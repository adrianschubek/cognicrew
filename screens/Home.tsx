import * as React from "react";
import { View, Image } from "react-native";
import { StatusBar } from "expo-status-bar";
import { Text, Card, useTheme } from "react-native-paper";
import JoinRoom from "../components/learningRoom/JoinRoom";
import { useUsername } from "../utils/hooks";
import { useEffect } from "react";
import { useAuth } from "../providers/AuthProvider";
import ProfilePictureAvatar from "../components/profile/ProfilePictureAvatar";
import LoadingOverlay from "../components/alerts/LoadingOverlay";

export default function HomeScreen({ navigation }) {
  const { data, isLoading } = useUsername();
  const { user } = useAuth();
  const theme = useTheme();
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
    <View style={{ flex: 1, justifyContent: "center", paddingHorizontal: 20 }}>
      <StatusBar style="auto" />
      <View
        style={{
          flexDirection: "row",
          alignItems: "center",
          justifyContent: "space-between",
          padding: 10,
        }}
      >
        <Text variant="titleLarge">Hello, {isLoading ? "...." : data}</Text>
        <ProfilePictureAvatar
          username={isLoading ? "...." : data}
          userId={user.id}
          size={48}
        />
      </View>
      <View style={{ flex: 1, justifyContent: "space-around", padding: 10 }}>
        <Card
          style={{ padding: 20, marginVertical: 10 }}
          mode="contained"
          theme={{
            colors: { surfaceVariant: theme.colors.secondaryContainer },
          }}
        >
          <JoinRoom navigation={navigation} />
        </Card>
      </View>
    </View>
  );
}
