import * as React from "react";
import { View, StyleSheet } from "react-native";
import { StatusBar } from "expo-status-bar";
import { Avatar, Button, Text } from "react-native-paper";
import JoinRoom from "../components/learningRoom/JoinRoom";
import CreateRoom from "../components/learningRoom/CreateRoom";
import { useUsername } from "../utils/hooks";

import { NAVIGATION } from "../types/common";
export default function HomeScreen({ navigation }) {
  const { data, isLoading } = useUsername();

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
      <View style={styles.footer}>
        <Button
          icon="account-group"
          mode="contained"
          style={styles.button}
          onPress={() => {
            navigation.navigate(NAVIGATION.MANAGE_FRIENDS);
          }}
        >
          Manage Your Friends
        </Button>

        <Button
          icon="trophy"
          mode="contained"
          style={styles.button}
          onPress={() => {
            navigation.navigate(NAVIGATION.ACHIEVEMENTS);
          }}
        >
          Test Achievements
        </Button>
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
