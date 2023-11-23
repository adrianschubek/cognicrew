import { Card, Divider, Icon, Text, useTheme } from "react-native-paper";
import { ScrollView, TouchableOpacity } from "react-native";
import { useQuery } from "@supabase-cache-helpers/postgrest-swr";
import { supabase } from "../supabase";
import { useFocusEffect, useIsFocused } from "@react-navigation/native";
import LoadingOverlay from "../components/alerts/LoadingOverlay";
import React, { useEffect, useMemo, useState } from "react";
import { DotIndicator as LoadingAnimation } from "react-native-indicators";
import { useAlerts, useSoundSystem1, useUsername } from "../utils/hooks";
import { useRoomStore } from "../stores/RoomStore";
import { useAuth } from "../providers/AuthProvider";

function Room({ room }) {
  useSoundSystem1();

  const theme = useTheme();
  const { data: username } = useUsername();
  const user = useAuth().user;
  const { confirm, info } = useAlerts();
  const setRoom = useRoomStore((state) => state.setRoom);
  return (
    <>
      <TouchableOpacity
        onPress={() => {
          if (room.host === user.id)
            return info({
              title: "Already connected",
              message: "You already joined this room.",
            });
          confirm({
            icon: "location-enter",
            title: room.name,
            message: `Do you want to join this room hosted by ${room.hostname}?`,
            okText: "Join",
            okAction: async (vars) => {
              const { data, error } = await supabase.rpc("join_room", {
                p_room_code: vars[0] ?? null,
                p_room_id: room.id,
              });

              if (error) return error.message;
              if (!data?.id) return "Something went wrong";
              console.log(data);
              setRoom(data);
            },
            fields: room.protected && [
              {
                label: "Room Code",
                helperText: "This room is protected",
                type: "number",
                icon: "key",
                validator: (value) => value.length !== 0,
                required: true,
              },
            ],
          });
        }}
      >
        <Card
          mode="contained"
          style={{
            marginVertical: 5,
            backgroundColor: theme.colors.primaryContainer,
          }}
        >
          <Card.Content
            style={{
              display: "flex",
              flexDirection: "row",
              paddingTop: 10,
            }}
          >
            <Text>
              {room.name ? room?.name?.substring(0, 45) : "Unnamed Room"}
            </Text>
          </Card.Content>
          <Divider style={{ margin: 5 }} />
          <Card.Content
            style={{
              display: "flex",
              flexDirection: "row",
              paddingBottom: 10,
            }}
          >
            <Text style={{ marginLeft: "auto" }}>
              <Icon size={16} source={room.protected && "key"} />
            </Text>
            <Text style={{ marginLeft: 5 }}>
              <Icon size={16} source={"shield-crown"} /> {room.hostname}
            </Text>
            <Text style={{ marginLeft: 5 }}>
              <Icon size={16} source={"account"} /> {room.cursize}/
              {room.maxsize}
            </Text>
          </Card.Content>
        </Card>
      </TouchableOpacity>
    </>
  );
}

export default function RoomsList() {
  const theme = useTheme();
  const {
    data: rooms,
    isLoading,
    mutate,
  } = useQuery(supabase.rpc("list_rooms"), {});

  const [friends, setFriends] = useState([]);
  const getFriends = async () => {
    const { data, error } = await supabase.rpc("list_friends_ids_and_names");

    if (error) {
      console.error(error);
      return;
    }
    console.log(data);
    setFriends(data.map((friend) => friend.id));
  };

  // Cheating: check for updates on room_tracker then refetch rooms
  useFocusEffect(() => {
    const roomsTracker = supabase
      .channel("list-rooms-tracker")
      .on(
        "postgres_changes",
        { event: "*", schema: "public", table: "tracker" },
        (payload) => {
          mutate();
          getFriends();
        },
      )
      .subscribe();
    getFriends();
    return () => {
      roomsTracker.unsubscribe();
    };
  });

  const friendRooms = (rooms ?? []).filter((room) =>
    friends.includes(room.host),
  );
  const otherRooms = (rooms ?? []).filter(
    (room) => !friends.includes(room.host),
  );

  if (isLoading) return <LoadingOverlay visible />;

  return (
    <>
      <ScrollView
        style={{
          margin: 10,
          marginHorizontal: 15,
        }}
      >
        <Text variant="titleMedium">Friend Rooms</Text>
        {friendRooms.map((room) => (
          <Room key={room.id} room={room} />
        ))}
        {friendRooms.length === 0 && (
          <Card mode="contained">
            <Card.Content
              style={{ alignContent: "center", alignItems: "center" }}
            >
              <Text>No active Rooms</Text>
            </Card.Content>
          </Card>
        )}
        <Text variant="titleMedium">All Rooms</Text>
        {otherRooms.map((room) => (
          <Room key={room.id} room={room} />
        ))}
        {otherRooms.length === 0 && (
          <Card mode="contained">
            <Card.Content
              style={{ alignContent: "center", alignItems: "center" }}
            >
              <Text>No active Rooms</Text>
            </Card.Content>
          </Card>
        )}
        <Card.Content
          style={{
            marginTop: 20,
            alignContent: "center",
            alignItems: "center",
          }}
        >
          <LoadingAnimation color={theme.colors.secondaryContainer} />
        </Card.Content>
      </ScrollView>
      {/* TODO: maybe remove FAb and use two buttons on home screen, Join and List Rooms */}
      {/*  <FAB
        icon={"location-enter"}
        onPress={() => {
          info({
            title: "Coming soon",
            message: "This feature is coming soon.",
          });
        }}
        color={theme.colors.onPrimary}
        style={{
          position: "absolute",
          margin: 16,
          right: 0,
          bottom: 0,
          backgroundColor: theme.colors.primary,
        }}
        label={"Enter Room code"}
      /> */}
    </>
  );
}
