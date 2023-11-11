import * as React from "react";
import { View, StyleSheet } from "react-native";
import { StatusBar } from "expo-status-bar";
import { Avatar, Button, Text } from "react-native-paper";
import JoinRoom from "../components/learningRoom/JoinRoom";
import CreateRoom from "../components/learningRoom/CreateRoom";
import { useUsername } from "../utils/hooks";
import { Image } from "react-native";
import { NAVIGATION } from "../types/common";
import { useEffect } from "react";

export default function HomeScreen({ navigation }) {
  const { data, isLoading } = useUsername();

  useEffect(() => {
    navigation.setOptions({
      title: "CogniCrew",
      headerRight: () => (
        <Image
          source={require("../assets/icon.png")}
          style={{
            height: 40,
            width: 40,
          }}
        />
      ),
    });
  }, []);

  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <View style={styles.header}>
        <Text>Hello, {isLoading ? "...." : data}</Text>
        <Avatar.Text
          size={48}
          label={(isLoading ? "" : data).substring(0, 2)}
        />
      </View>
      <View style={styles.body}>
        <JoinRoom navigation={navigation} />
        <CreateRoom navigation={navigation} />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "space-between",
  },
  header: {
    width: "100%",
    height: 100,
    alignItems: "flex-end",
    justifyContent: "center",
    padding: 10,
    position: "relative",
  },
  body: {
    justifyContent: "space-around",
  },
  footer: {
    height: 150,
    alignItems: "center",
    justifyContent: "space-around",
    paddingBottom: 20,
  },
  button: {
    width: "100%",
  },
});
