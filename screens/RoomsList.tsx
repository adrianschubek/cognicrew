import {
  ActivityIndicator,
  Card,
  Divider,
  FAB,
  Icon,
  Text,
  useTheme,
} from "react-native-paper";
import { ScrollView, TouchableOpacity, View } from "react-native";
import {
  useInsertMutation,
  useQuery,
} from "@supabase-cache-helpers/postgrest-swr";
import { supabase } from "../supabase";
import { useIsFocused } from "@react-navigation/native";
import LoadingOverlay from "../components/alerts/LoadingOverlay";
import React from "react";
import { DotIndicator as LoadingAnimation } from "react-native-indicators";
import { NAVIGATION } from "../types/common";
import { useAlerts } from "../utils/hooks";

export default function RoomsList({ navigation }) {
  const theme = useTheme();
  const focus = useIsFocused();
  const { confirm } = useAlerts();
  const {
    data: rooms,
    isLoading,
    isValidating,
  } = useQuery(supabase.rpc("list_rooms"), {
    refreshInterval: focus ? 3000 : 0,
  });

  const { trigger } = useInsertMutation(supabase.rpc("create_room"), {
    onSuccess: () => {
      trigger();
    },
  });

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
              confirm({
                icon: "location-enter",
                title: room.name,
                message: `Do you want to join this room hosted by ${room.host}?`,
                okText: "Join",
                okAction: () => navigation.navigate(NAVIGATION.LOBBY),
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
                  <Icon size={16} source={"shield-crown"} /> {room.host}
                </Text>
                <Text style={{ marginLeft: 5 }}>
                  <Icon size={16} source={"account"} /> 1/2
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
        {true && (
          <Card.Content
            style={{
              marginTop: 20,
              alignContent: "center",
              alignItems: "center",
            }}
          >
            <LoadingAnimation color={theme.colors.secondaryContainer} />
          </Card.Content>
        )}
      </ScrollView>
      <FAB
        icon={"plus"}
        onPress={() => {}}
        color={theme.colors.onPrimary}
        style={{
          position: "absolute",
          margin: 16,
          right: 0,
          bottom: 0,
          backgroundColor: theme.colors.primary,
        }}
        label={"Create Room"}
        // onPress={save}
        // disabled={isMutating}
      />
      {/* <LearningProjectCategory
        path={require("../assets/teamwork_symbol.png")}
        name={"Cogniboard"}
        function={() => {
          navigation.navigate(NAVIGATION.WHITEBOARD);
          console.log("Whiteboard pressed");
        }}
      /> */}
    </>
  );
}