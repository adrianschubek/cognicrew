import { Card, Divider, Icon, Text, useTheme } from "react-native-paper";
import { StyleProp, TouchableOpacity, View, ViewStyle } from "react-native";
import { useQuery } from "@supabase-cache-helpers/postgrest-swr";
import { supabase } from "../supabase";
import { useFocusEffect } from "@react-navigation/native";
import LoadingOverlay from "../components/alerts/LoadingOverlay";
import React, { Fragment, useEffect, useState } from "react";
import { DotIndicator as LoadingAnimation } from "react-native-indicators";
import { useRoomStore } from "../stores/RoomStore";
import { useAuth } from "../providers/AuthProvider";
import { useAlerts } from "react-native-paper-fastalerts";
import { usePresenceStore } from "../stores/PresenceStore";
import { PulseIndicator } from "react-native-indicators";

function Room({ room }) {
  const theme = useTheme();
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
                p_room_code: +vars[0] ?? null,
                p_room_id: room.id,
              });

              if (error) return error.message;
              if (!data?.id) return "Something went wrong";
              console.log(data);
              //@ts-ignore it works, database function is just to lazy to specify the return type
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

export default function RoomsList(props: { style?: StyleProp<ViewStyle> }) {
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
    //console.log(data);
    setFriends(data.map((friend) => friend.id));
  };

  useEffect(() => {
    getFriends();
  }, []);

  const online = usePresenceStore((state) => state.online);

  // Cheating: check for updates on room_tracker then refetch rooms
  useFocusEffect(() => {
    const roomsTracker = supabase
      .channel("list-rooms-tracker")
      .on(
        "postgres_changes",
        {
          event: "*",
          schema: "public",
          table: "tracker",
          filter: "key=eq.rooms",
        },
        (payload) => {
          mutate();
          getFriends();
        },
      )
      .subscribe();
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
  const roomTypes = [
    { title: "Friend Rooms", rooms: friendRooms },
    { title: "Other Rooms", rooms: otherRooms },
  ];
  if (isLoading) return <LoadingOverlay visible />;
  return (
    <View style={[props.style, { gap: 5 }]}>
      {roomTypes.map((roomType, index) => (
        <Fragment key={index}>
          <View
            style={{
              marginBottom: 2,
              flexDirection: "row",
              alignItems: "center",
            }}
          >
            <Text variant="titleSmall" style={{ alignItems: "center" }}>
              {roomType.title}
            </Text>
            {index === 0 && (
              <>
                <PulseIndicator
                  style={{ flex: 0, opacity: 0.7, marginLeft: 5 }}
                  size={25}
                  color={theme.colors.primary}
                />
                <Text style={{ color: theme.colors.primary }}>
                  {online.filter((v) => friends.includes(v.user_id)).length}{" "}
                  online
                </Text>
              </>
            )}
          </View>
          {roomType.rooms.map((room) => (
            <Room key={room.id} room={room} />
          ))}
          {roomType.rooms.length === 0 && (
            <Card mode="contained">
              <Card.Content
                style={{ alignContent: "center", alignItems: "center" }}
              >
                <Text>No active Rooms</Text>
              </Card.Content>
            </Card>
          )}
        </Fragment>
      ))}
      <Card.Content
        style={{
          marginTop: 20,
          alignContent: "center",
          alignItems: "center",
        }}
      >
        <LoadingAnimation color={theme.colors.secondaryContainer} />
      </Card.Content>
    </View>
  );
}
