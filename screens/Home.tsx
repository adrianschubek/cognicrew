import * as React from "react";
import { View, Image, ScrollView } from "react-native";
import { StatusBar } from "expo-status-bar";
import { Text } from "react-native-paper";
import JoinRoom from "../components/learningRoom/JoinRoom";
import { useUsername } from "../utils/hooks";
import { useEffect } from "react";
import { useAuth } from "../providers/AuthProvider";
import ProfilePictureAvatar from "../components/profile/ProfilePictureAvatar";
import LoadingOverlay from "../components/alerts/LoadingOverlay";
import RoomsList from "./RoomsList";

export default function HomeScreen({ navigation }) {
  const { data, isLoading } = useUsername();
  const { user } = useAuth();
  useEffect(() => {
    navigation.setOptions({
      title: "CogniCrew",
      headerRight: () => (
        <Image
          source={require("../assets/icon.png")}
          style={{ height: 42, width: 41 }}
        />
      ),
    });
  }, []);

  if (isLoading)
    return (
      <>
        <StatusBar style="auto" />
        <LoadingOverlay visible={isLoading} />
      </>
    );
  return (
    <ScrollView
      style={{
        flex: 1,
        paddingHorizontal: 35,
        gap: 10,
      }}
    >
      <StatusBar style="auto" />
      <View
        style={{
          flexDirection: "row",
          alignItems: "center",
          justifyContent: "space-between",
          paddingTop: 10,
          marginBottom: 10,
        }}
      >
        <Text variant="titleLarge">Hello, {isLoading ? "...." : data}</Text>
        <ProfilePictureAvatar
          username={isLoading ? "...." : data}
          userId={user.id}
          size={48}
        />
      </View>
      <View
        style={{
          marginBottom: 20,
          gap: 10,
        }}
      >
        <JoinRoom
          style={{
            gap: 5,
          }}
        />
        <RoomsList />
      </View>
    </ScrollView>
  );
}
