import * as React from "react";
import { StyleSheet, View, Image } from "react-native";
import {
  Text,
  IconButton,
  useTheme,
  Divider,
  PaperProvider,
  Portal,
  FAB,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import { useEffect, useState } from "react";
import CreateDrawing from "../components/dialogues/CreateDrawing";
import { Canvas } from "../components/learningRoom/Canvas";
import { useWhiteboardStore } from "../stores/WhiteboardStore";
import { useFocusEffect } from "@react-navigation/native";
import { useSoundsStore } from "../stores/SoundsStore";
import {
  useAchievements,
  useAlerts,
  useUnlockAchievement,
} from "../utils/hooks";
import AchievementNotification from "../components/dialogues/AchievementNotification";
import TextInputDialog from "../components/dialogues/TextInputDialog";
import { SafeAreaView } from "react-native-safe-area-context";
import { supabase } from "../supabase";
import { useRoomStateStore } from "../stores/RoomStore";
import { ScreenState } from "../functions/rooms";

export default function Whiteboard({ navigation }) {
  const {
    addAction,
    undoLastAction,
    redoLastAction,
    setSelectedShape,
    resetActions,
    color,
    selectedShape,
  } = useWhiteboardStore();

  const roomState = useRoomStateStore((state) => state.roomState);
  const { confirm } = useAlerts();
  useEffect(() => {
    // TODO: refactor put in function
    navigation.addListener("beforeRemove", (e) => {
      // if roomstate screen not this one, then return without confirmation. access store directly bypass react
      if (
        useRoomStateStore.getState().roomState?.screen !== ScreenState.INGAME &&
        useRoomStateStore.getState().roomState?.screen !==
          ScreenState.ROUND_RESULTS &&
        useRoomStateStore.getState().roomState?.screen !==
          ScreenState.ROUND_SOLUTION
      )
        return;
      // Prevent default behavior of leaving the screen
      e.preventDefault();

      confirm({
        key: "leaveroom",
        title: "Leave room?",
        message: "Do you want to leave this room?",
        icon: "exit-run",
        okText: "Leave",
        okAction: async () => {
          await supabase.rpc("leave_room");
        },
      });
    });
  }, [navigation]);

  const { sound, playSound, stopSound, loadSound2 } = useSoundsStore();
  const unlockAchievement = useUnlockAchievement();
  const [achievementVisible, setAchievementVisible] = useState(false);
  const [achievementName, setAchievementName] = useState("");
  const [achievementIcon, setAchievementIcon] = useState("");
  const { data: achievementsData } = useAchievements();

  const [isTextToolSelected, setTextToolSelected] = useState(false);
  const [textInputVisible, setTextInputVisible] = useState(false);
  const [tempTextPosition, setTempTextPosition] = useState({ x: 0, y: 0 });

  // Function to handle canvas click when text tool is selected
  const handleCanvasClick = (x, y) => {
    if (isTextToolSelected) {
      setTempTextPosition({ x, y });
      setTextInputVisible(true);
    }
  };

  // Function to add text to the canvas
  const addTextToCanvas = (text) => {
    if (text.trim().length === 0) {
      // If the text is empty or only contains whitespace, do nothing
      setTextInputVisible(false);
      return;
    }
    const { x, y } = tempTextPosition;
    addAction({ x, y, text, color, type: "text" });
    setTextInputVisible(false);
  };

  const unlockFirstTimeAchievement = async () => {
    const achievementId = 12; // ID for the 'first time whiteboard open' achievement
    const { success } = await unlockAchievement(achievementId);
    if (success) {
      const achievement = achievementsData?.find(
        (ach) => ach.id === achievementId,
      );
      if (achievement) {
        setAchievementName(achievement.name);
        setAchievementIcon(achievement.icon_name);
        setAchievementVisible(true);
        setTimeout(() => setAchievementVisible(false), 5000); // Hide notification after 5 seconds
      }
    } else {
      console.error("Failed to unlock achievement");
    }
  };

  useEffect(() => {
    unlockFirstTimeAchievement();
  }, []);

  useFocusEffect(
    React.useCallback(() => {
      const { isLoaded2, isLoaded } = useSoundsStore.getState();

      if (!isLoaded2) {
        const audioSource = require("../assets/sounds/Tetris.mp3");
        loadSound2(audioSource);
      } else {
        console.log("play tetris");
        playSound();
      }

      return () => {
        console.log("Component unmounted");
        stopSound();
      };
    }, []),
  );

  const [plusMenu, setPlusMenu] = React.useState({ open: false });

  const onPlusMenuChange = ({ open }) => setPlusMenu({ open });

  const { open } = plusMenu;

  const [showDrawing, setDrawing] = useState(false);
  const theme = useTheme();
  return (
    <React.Fragment>
      <CreateDrawing
        showDrawing={showDrawing}
        close={() => setDrawing(false)}
      />
      <SafeAreaView
        style={{
          flexDirection: "column",
          justifyContent: "space-between",
          flex: 1,
        }}
      >
        <View style={styles.top}>
          <View style={styles.topleft}>
            <IconButton
              icon="undo"
              iconColor={theme.colors.primary}
              size={40}
              onPress={undoLastAction}
            />
            <IconButton
              icon="redo"
              iconColor={theme.colors.primary}
              size={40}
              onPress={redoLastAction}
            />
          </View>
          <View style={styles.topright}>
            <Image
              source={{
                uri: supabase.storage
                  .from("profile-pictures")
                  .getPublicUrl("icon").data.publicUrl,
              }}
              style={styles.image}
            />
            <Text>User 1</Text>
            <Image
              source={{
                uri: supabase.storage
                  .from("profile-pictures")
                  .getPublicUrl("icon").data.publicUrl,
              }}
              style={styles.image}
            />
            <Text>User 2</Text>
          </View>
        </View>

        <Divider style={styles.divider} />

        <View style={styles.mid}>
          <Canvas
            onClick={handleCanvasClick}
            isTextToolSelected={isTextToolSelected}
          />
          <TextInputDialog
            isVisible={textInputVisible}
            onClose={() => setTextInputVisible(false)}
            onSubmit={(inputText) => addTextToCanvas(inputText)}
          />
        </View>

        <Divider style={styles.divider} />

        <View style={styles.bottomLeft}>
          <View style={styles.iconRow}>
            <IconButton
              icon="delete"
              iconColor={theme.colors.primary}
              size={40}
              onPress={resetActions}
            />
            <IconButton
              icon="pencil"
              iconColor={theme.colors.primary}
              size={40}
              onPress={() => {
                setSelectedShape("none");
                setTextToolSelected(false);
                setDrawing(true);
              }}
            />
            <Portal>
              <FAB.Group
                open={open}
                visible
                icon={open ? "minus" : "drawing"}
                actions={[
                  {
                    icon: "keyboard",
                    label: "Keyboard",
                    onPress: () => {
                      setSelectedShape("none");
                      setTextToolSelected(!isTextToolSelected);
                    },
                  },
                  {
                    icon: "triangle-outline",
                    label: "Triangle",
                    onPress: () => {
                      setSelectedShape("triangle");
                      setTextToolSelected(false);
                    },
                  },
                  {
                    icon: "square-outline",
                    label: "Square",
                    onPress: () => {
                      setSelectedShape("square");
                      setTextToolSelected(false);
                    },
                  },
                  {
                    icon: "circle-outline",
                    label: "Circle",
                    onPress: () => {
                      setSelectedShape("circle");
                      setTextToolSelected(false);
                    },
                  },
                ]}
                onStateChange={onPlusMenuChange}
              />
            </Portal>
          </View>
        </View>
      </SafeAreaView>
      <AchievementNotification
        isVisible={achievementVisible}
        achievementName={achievementName}
        achievementIconName={achievementIcon}
      />
    </React.Fragment>
  );
}

const styles = StyleSheet.create({
  top: {
    flexDirection: "row",
  },
  topleft: {
    flexDirection: "row",
    flex: 1,
  },
  topright: {
    flexDirection: "row",
  },
  mid: {
    flex: 1,
  },
  divider: {
    height: 1,
    backgroundColor: "black",
  },
  image: {
    marginLeft: responsiveWidth(7),
    width: responsiveWidth(14),
    height: responsiveHeight(7),
    marginRight: 3,
    borderRadius: 35,
    overflow: "hidden",
  },
  bottomLeft: {
    flexDirection: "column",
    flex: 0.125,
    alignItems: "flex-start",
  },
  iconRow: {
    flexDirection: "row",
  },
  sliderRow: {
    flexDirection: "row",
    alignItems: "center",
  },
  slider: {
    width: 200,
    height: 40,
    marginLeft: 10,
  },
  sliderLabel: {
    marginRight: 10,
  },
  centeredView: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    marginTop: 22,
  },
  modalView: {
    margin: 20,
    backgroundColor: "white",
    borderRadius: 20,
    padding: 35,
    alignItems: "center",
    shadowColor: "#000",
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 4,
    elevation: 5,
  },
  textInput: {
    height: 40,
    margin: 12,
    borderWidth: 1,
    padding: 10,
    width: 200,
  },
});
