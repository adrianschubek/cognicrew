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
import { useEffect, useRef, useState } from "react";
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
import { Point, SketchCanvas, SketchCanvasRef } from "../localLibrary/rn-perfect-sketch-canvas";
//import { Points, point } from "@shopify/react-native-skia";

export default function Whiteboard({ navigation }) {
  const theme = useTheme();
  const { confirm } = useAlerts();
  const { stroke } = useWhiteboardStore();
  const canvasRef = useRef<SketchCanvasRef>(null);
  const [color, setColor] = useState("#00FF00");

  useConfirmLeaveLobby();
  const unlockedAchievementIds = usePreferencesStore(
    (state) => state.unlockedAchievementIds,
  );
  const { setInGame } = useSoundsStore();

  //REALTIME START

  const chan = supabase.channel("room-1");


  //REALTIME END

  const unlockAchievement = async () => {
    if (!unlockedAchievementIds.includes(12)) {
      const error = await supabase.rpc("insert_achievement", { id: 12 });
      console.log("error: ", error);
    }
  };

  useEffect(() => {

    console.log("current changed")

    chan.send({
      type: "broadcast",
      event: "test",
      payload: { message: canvasRef.current.toPoints() },
    });
  
  }, [canvasRef.current])

  useEffect(() => {
    console.log("Test")
    console.log(canvasRef.current.toPoints())

    chan.on("broadcast", { event: "test" }, (payload) => {
      console.log(payload);
      //canvasRef.current.addPoints(payload["message"])
    });
  
    chan.subscribe((status) => {
      if (status !== "SUBSCRIBED") {
        return;
      }
    });

    

    //const myPoint: Point = [3, 7];
    //const myPoint2: Point = [4,9];
    //const pointsArray: Point[][] = [[myPoint], [myPoint2]];
    //canvasRef.current.addPoints(pointsArray)
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
              borderRadius: 10,
              backgroundColor: theme.colors.background,
              transform: [{ rotateZ: "180deg" }],
            }}
            icon="logout"
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
            onPress={canvasRef.current?.undo}
          />
          <IconButton
            icon="redo"
            iconColor={theme.colors.primary}
            size={40}
            onPress={canvasRef.current?.redo}
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
        <SketchCanvas
          ref={canvasRef}
          strokeColor={color}
          strokeWidth={stroke}
          containerStyle={{ flex: 1 }}
          onTouchEnd={() => {
            console.log("touch end");
          }}
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
            onPress={canvasRef.current?.reset}
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
