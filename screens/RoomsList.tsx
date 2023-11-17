import { Card, Divider, FAB, Icon, Text, useTheme } from "react-native-paper";
import { ScrollView, TouchableOpacity } from "react-native";
import { useQuery } from "@supabase-cache-helpers/postgrest-swr";
import { supabase } from "../supabase";
import { useIsFocused } from "@react-navigation/native";
import LoadingOverlay from "../components/alerts/LoadingOverlay";
import React, { useEffect } from "react";
import { DotIndicator as LoadingAnimation } from "react-native-indicators";
import { NAVIGATION } from "../types/common";
import { useAlerts, useUsername } from "../utils/hooks";
import { useRoomStore } from "../stores/RoomStore";
import { useAuth } from "../providers/AuthProvider";

export default function RoomsList({ navigation }) {
  const theme = useTheme();
  const focus = useIsFocused();
  const { data: username } = useUsername();
  const user = useAuth().user;
  const { confirm, info } = useAlerts();
  const setRoom = useRoomStore((state) => state.setRoom);
  const {
    data: rooms,
    isLoading,
    isValidating,
    mutate,
  } = useQuery(supabase.rpc("list_rooms"), {
    
  });

  // Cheating: check for updates on room_tracker then refetch rooms
  useEffect(() => {
    const roomsTracker = supabase
      .channel("list-rooms-tracker")
      .on(
        "postgres_changes",
        { event: "*", schema: "public", table: "tracker" },
        (payload) => {
          mutate();
        },
      )
      .subscribe();
  }, []);

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
        {true && (
          <Card mode="contained">
            <Card.Content
              style={{ alignContent: "center", alignItems: "center" }}
            >
              <Text>No active Rooms</Text>
            </Card.Content>
          </Card>
        )}
        <Text variant="titleMedium">All Rooms</Text>
        {/* Freidns from */}

        {rooms?.map((room) => (
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
                  console.log(data);
                  setRoom(data);
                },
                inputs: room.protected && [
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
            key={room.id}
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
        ))}
        {rooms.length === 0 && (
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
          {/* <Text
            variant="labelSmall"
            style={{ color: theme.colors.secondary, textAlign: "center" }}
          >
            Only rooms of projects you are a member of will be shown here.
            TEMPORARY REMOVE THIS LATER. Everyone should be able to play!
          </Text> */}
        </Card.Content>
      </ScrollView>
      {/* TODO: maybe remove FAb and use two buttons on home screen, Join and List Rooms */}
      <FAB
        icon={"location-enter"}
        onPress={() => {
          info({
            title: "Coming soon",
            message: "This feature is coming soon.",
          });
          // confirm({
          //   icon: "location-enter",
          //   title: "Join Room",
          //   message: "Enter a room code",
          //   okText: "Join",
          //   okAction: (vars) => {
          //     info({ message: JSON.stringify(vars) });
          //     navigation.navigate(NAVIGATION.LOBBY);
          //   },
          //   inputs: [
          //     {
          //       label: "Room Code",
          //       type: "number",
          //       icon: "key",
          //       validator: (value) => value.length !== 0,
          //     },
          //   ],
          // });
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
      />
    </>
  );
}
