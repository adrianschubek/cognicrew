import { Button, Text, useTheme } from "react-native-paper";
import { PacmanIndicator as LoadingAnimation } from "react-native-indicators";
import { useNavigation } from "@react-navigation/native";
import { useEffect } from "react";
import { SafeAreaView } from "react-native-safe-area-context";
import { useAlerts } from "../../utils/hooks";
import { NAVIGATION } from "../../types/common";
import { useRoomStateStore, useRoomStore } from "../../stores/RoomStore";
import { supabase } from "../../supabase";

export default function Lobby() {
  const theme = useTheme();
  const { confirm } = useAlerts();
  // TODO: if owner exists this screen. delete room rpc(delete_room) !!!
  //TODO: in database: cron auto cleanup rooms after X minutes
  // TODO: maybe delte immediately after lobby started from rooms table. and use room_code in profiles table?

  const room = useRoomStore((state) => state.room);
  const roomState = useRoomStateStore((state) => state.roomState);
  const setRoom = useRoomStore((state) => state.setRoom);

  // TODO: Realtime subscription filter -> = room.id

  const navigation = useNavigation();
  useEffect(() => {
    navigation.setOptions({
      headerShown: false,
    });
    navigation.addListener("beforeRemove", (e) => {
      // Prevent default behavior of leaving the screen
      e.preventDefault();
      // Prompt the user before leaving the screen
      confirm({
        icon: "location-exit",
        title: "Leave room?",
        message: "Are you sure you want to leave this room?",
        okText: "Leave",
        okAction: async () => {
          const { error } = await supabase.rpc("leave_room");
          if (error) return error.message;
          setRoom(null);
        },
      });
    });
  }, []);

  // TODO: is user is owner show host lobby view (list users, select game, close)
  // TODO: oncreate room call db fucntion to insert public_room_state
  return (
    <SafeAreaView
      style={{
        justifyContent: "center",
        alignContent: "center",
        alignItems: "center",
        flex: 1,
        backgroundColor: theme.colors.primaryContainer,
      }}
    >
      <LoadingAnimation
        size={96}
        style={{ flex: 0, background: "red", marginBottom: 30 }}
        color={theme.colors.primary}
      />
      <Text
        variant="bodyLarge"
        style={{ flex: 0, color: theme.colors.primary }}
      >
        Waiting for host to start a game
      </Text>
      <Button
        style={{ marginTop: 20 }}
        onPress={() =>
          confirm({
            icon: "location-exit",
            title: "Leave room?",
            message: "Are you sure you want to leave this room?",
            okText: "Leave",
            okAction: async () => {
              const { error } = await supabase.rpc("leave_room");
              if (error) return error.message;
              setRoom(null);
            },
          })
        }
      >
        Leave
      </Button>
    </SafeAreaView>
  );
}
