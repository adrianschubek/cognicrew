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
import Canvas from "../components/learningRoom/Canvas";
import { useWhiteboardStore } from "../stores/WhiteboardStore";
import { useSoundsStore } from "../stores/SoundsStore";
import { useConfirmLeaveLobby } from "../utils/hooks";
import { SafeAreaView } from "react-native-safe-area-context";
import { supabase } from "../supabase";
import { RoomClientUpdate } from "../functions/rooms";
import { useAlerts } from "react-native-paper-fastalerts";
import { handleEdgeError } from "../utils/common";
import { StrokeSettings } from "../components/learningRoom/StrokeSettings";
import { usePreferencesStore } from "../stores/PreferencesStore";
import { Action } from "../types/common";

export default function Whiteboard({ navigation }) {
  const theme = useTheme();
  const { confirm } = useAlerts();
  const { setSelectedShape, setShapeSize, setStroke } = useWhiteboardStore();

  const [color, setColor] = useState("#00FF00");

  useConfirmLeaveLobby();
  const unlockedAchievementIds = usePreferencesStore(
    (state) => state.unlockedAchievementIds,
  );
  const { setInGame } = useSoundsStore();
  const [isTextToolSelected, setTextToolSelected] = useState<boolean>(false);
  const [actions, setActions] = useState<Action[]>([]);
  const [undoActions, setUndoActions] = useState<Action[]>([]);
  const [plusMenu, setPlusMenu] = useState({ open: false });
  const onPlusMenuChange = ({ open }) => setPlusMenu({ open });
  const { open } = plusMenu;

  //REALTIME START

  const chan = supabase.channel("room-1");

  chan.on("broadcast", { event: "test" }, (payload) => {
    console.log(payload);

    addAction(payload["payload"]["message"]);
    const components = payload["payload"]["message"]["path"][0].split(" ");
    const x = components[0].substring(1);
    const y = components[1];
  });

  chan.subscribe((status) => {
    if (status !== "SUBSCRIBED") {
      return;
    }
  });

  //REALTIME END

  function addAction(action: Action) {
    console.log(action);
    setActions((actions) => [...actions, action]);
    setUndoActions([]);

    chan.send({
      type: "broadcast",
      event: "test",
      payload: { message: action },
    });
  }

  function resetActions() {
    setActions([]);
    setUndoActions([]);
  }
  function undoLastAction() {
    if (actions.length > 0) {
      const lastAction = actions[actions.length - 1];
      setActions(actions.slice(0, -1));
      setUndoActions([...undoActions, lastAction]);
    }
  }
  function redoLastAction() {
    if (undoActions.length > 0) {
      const lastUndoAction = undoActions[undoActions.length - 1];
      setActions([...actions, lastUndoAction]);
      setUndoActions(undoActions.slice(0, -1));
    }
  }
  function updatePath(action: Action) {
        setActions([...actions, action]);
      }
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
  //is this achievement supposed to be triggered in the frontend?
  const unlockAchievement = async () => {
    if (!unlockedAchievementIds.includes(12)) {
      const error = await supabase.rpc("insert_achievement", { id: 12 });
      console.log("error: ", error);
    }
  };

  useEffect(() => {
    setInGame(true);
    unlockAchievement();
    return () => {
      setInGame(false);
    };
  }, []);

  return (
    <SafeAreaView
      style={{
        flexDirection: "column",
        justifyContent: "space-between",
        flex: 1,
      }}
    >
      <View style={{ flexDirection: "row" }}>
        <View style={{ flexDirection: "row", flex: 1 }}>
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
                message: "Do you want to leave this game and return to lobby?",
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
        <View style={{ flexDirection: "row" }}>
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

      <View style={{ flex: 1 }}>
        <Canvas
          onClick={handleCanvasClick}
          isTextToolSelected={isTextToolSelected}
          actions={actions}
          addAction={addAction}
          updatePath={updatePath}
          color={color}
        />
      </View>

      <Divider style={styles.divider} />

      <View
        style={{
          flexDirection: "column",
          flex: 0.125,
          alignItems: "flex-start",
        }}
      >
        <View style={{ flexDirection: "row" }}>
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
                      return (
                        <StrokeSettings
                          color={color}
                          sendColor={(color) => {
                            setColor(color);
                          }}
                        />
                      );
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
  );
}

const styles = StyleSheet.create({
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
});
