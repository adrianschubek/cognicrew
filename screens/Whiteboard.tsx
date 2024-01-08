import * as React from "react";
import { StyleSheet, View, Image } from "react-native";
import {
  Text,
  IconButton,
  useTheme,
  Divider,
  Portal,
  FAB,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import { useEffect, useState } from "react";
import { Canvas } from "../components/learningRoom/Canvas";
import { useWhiteboardStore } from "../stores/WhiteboardStore";
import { useSoundsStore } from "../stores/SoundsStore";
import {
  useAchievementsOld,
  useConfirmLeaveLobby,
  useUnlockAchievement,
} from "../utils/hooks";
import AchievementNotification from "../components/dialogues/AchievementNotification";
import { SafeAreaView } from "react-native-safe-area-context";
import { supabase } from "../supabase";
import { RoomClientUpdate, ScreenState } from "../functions/rooms";
import { useAlerts } from "react-native-paper-fastalerts";
import { handleEdgeError } from "../utils/common";
import { StrokeSettings } from "../components/learningRoom/DrawingSettings";

export default function Whiteboard({ navigation }) {
  const { error: errrorAlert, confirm } = useAlerts();
  const {
    addAction,
    undoLastAction,
    redoLastAction,
    setSelectedShape,
    resetActions,
    color,
    selectedShape,
  } = useWhiteboardStore();
  useConfirmLeaveLobby();

  const { setInGame } = useSoundsStore();
  const unlockAchievement = useUnlockAchievement();
  const [achievementVisible, setAchievementVisible] = useState(false);
  const [achievementName, setAchievementName] = useState("");
  const [achievementIcon, setAchievementIcon] = useState("");
  const [isTextToolSelected, setTextToolSelected] = useState(false);
  const { data: achievementsData } = useAchievementsOld();

  // Function to handle canvas click when text tool is selected
  const handleCanvasClick = (x: number, y: number) => {
    if (isTextToolSelected) {
      confirm({
        title: "Enter yout Text",
        icon: "keyboard",
        okText: "OK",
        okAction: (values) => {
          let text = values[0] as string;
          if (text.trim().length === 0) return;
          addAction({ x, y, text, color, type: "text" });
        },
        fields: [
          {
            placeholder: "Enter your text here",
            type: "text",
            required: true,
          },
        ],
      });
    }
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
        setTimeout(() => setAchievementVisible(false), 5500);
      }
    } else {
      console.error("Failed to unlock achievement");
    }
  };

  useEffect(() => {
    setInGame(true);
    unlockFirstTimeAchievement();
    return () => {
      setInGame(false);
    };
  }, []);

  const [plusMenu, setPlusMenu] = useState({ open: false });

  const onPlusMenuChange = ({ open }) => setPlusMenu({ open });

  const { open } = plusMenu;

  const theme = useTheme();
  return (
    <React.Fragment>
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
              mode="contained"
              style={{
                //backgroundColor: theme.colors.error,
                borderRadius: 10,
                backgroundColor: theme.colors.background,
                transform: [{ rotateZ: "180deg" }],
              }}
              icon="logout"
              //iconColor={theme.colors.onErrorContainer}
              onPress={() => {
                confirm({
                  key: "leaveroom",
                  title: "Leave game?",
                  message:
                    "Do you want to leave this game and return to lobby?",
                  icon: "location-exit",
                  okText: "Leave",
                  okAction: async () => {
                    const { error } = await supabase.functions.invoke(
                      "room-update",
                      {
                        body: {
                          type: "reset_room",
                        } as RoomClientUpdate,
                      },
                    );
                    if (error) return await handleEdgeError(error);
                  },
                });
              }}
            />
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
              icon="cog"
              iconColor={theme.colors.primary}
              size={40}
              onPress={() => {
                confirm({
                  title: "Drawing",
                  icon: "pencil",
                  okText: "Done",
                  cancelText: "",
                  fields: [
                    {
                      type: "custom",
                      render() {
                        return <StrokeSettings />;
                      },
                    },
                  ],
                });
              }}
            />
            <Portal>
              <FAB.Group
                open={open}
                visible
                icon={open ? "minus" : "drawing"}
                actions={[
                  {
                    icon: "pen",
                    label: "Pen",
                    onPress: () => {
                      setSelectedShape("none");
                      setTextToolSelected(false);
                    },
                  },
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
