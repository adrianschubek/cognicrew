import { Button, Icon, Text, useTheme } from "react-native-paper";
import { PacmanIndicator as LoadingAnimation } from "react-native-indicators";
import { useNavigation } from "@react-navigation/native";
import { useEffect } from "react";
import { SafeAreaView } from "react-native-safe-area-context";
import {
  useAlerts,
  useSoundSystem1,
  useUsernamesByRoom,
} from "../../utils/hooks";
import { useRoomStateStore, useRoomStore } from "../../stores/RoomStore";
import { supabase } from "../../supabase";
import React from "react";

export default function GuestLobby() {
  useSoundSystem1();

  const theme = useTheme();
  const { confirm } = useAlerts();
  // TODO: if owner exists this screen. delete room rpc(delete_room) !!!
  //TODO: in database: cron auto cleanup rooms after X minutes
  // TODO: maybe delte immediately after lobby started from rooms table. and use room_code in profiles table?

  const room = useRoomStore((state) => state.room);
  const setRoom = useRoomStore((state) => state.setRoom);
  const roomState = useRoomStateStore((state) => state.roomState);
  const setRoomState = useRoomStateStore((state) => state.setRoomState);

  const { warning } = useAlerts();

  const [userList, setUserList] = React.useState<string[]>([]);
  useEffect(() => {
    const fetchData = async () => {
      await useUsernamesByRoom().then((userNames) => {
        setUserList(userNames.data.map((user) => user.username));
        // if (userNames.data.length === 0 && room) {
        // //  TODO: remove this
        //   warning({ message: "Room was closed by host" });
        //   setRoom(null);
        // }
      });
    };
    fetchData();
    const roomsTracker = supabase
      .channel("list-rooms-tracker")
      .on(
        "postgres_changes",
        {
          event: "*",
          schema: "public",
          table: "tracker",
          filter: "room_id=eq." + room?.id,
        },
        (payload) => {
          console.log("refetching lobby members");
          fetchData();
        },
      )
      .subscribe();
    return () => {
      roomsTracker.unsubscribe();
    };
  }, []);

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
          setRoom(null);
          if (error) return error.message;
        },
      });
    });
  }, []);

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
      <Text
        variant="bodyLarge"
        style={{ flex: 0, color: theme.colors.primary }}
      >
        <Icon size={24} source="account-group" /> {userList.length} /{" "}
        {room?.max_size}
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
              setRoom(null);
              if (error) return error.message;
            },
          })
        }
      >
        Leave
      </Button>
    </SafeAreaView>
  );
}
