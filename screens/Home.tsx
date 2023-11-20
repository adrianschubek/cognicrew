import * as React from "react";
import { View, StyleSheet, Image } from "react-native";
import { StatusBar } from "expo-status-bar";
import { Avatar, Button, Text, Card, IconButton } from "react-native-paper";
import JoinRoom from "../components/learningRoom/JoinRoom";
import { useSoundSystem1, useUsername } from "../utils/hooks";
import { useEffect, useState } from "react";


export default function HomeScreen({ navigation }) {
  const { data, isLoading } = useUsername();


  useEffect(() => {
    navigation.setOptions({
      title: "CogniCrew",
      headerRight: () => (
        <Image
          source={require("../assets/icon.png")}
          style={styles.headerIcon}
        />
      ),
    });
  }, []);

  useSoundSystem1();
  

  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <View style={styles.header}>
        <Text style={styles.headerText}>Hello, {isLoading ? "...." : data}</Text>
        <Avatar.Text
          size={48}
          label={(isLoading ? "" : data).substring(0, 2)}
          style={styles.avatar}
        />
      </View>
      <View style={styles.body}>
        <Card style={styles.card}>
          <IconButton
            icon="door-open"
            size={20}
            onPress={() => console.log('Pressed')}
          />
          <JoinRoom navigation={navigation} />
        </Card>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    paddingHorizontal: 20,
  },
  header: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
    padding: 10,
  },
  headerText: {
    fontSize: 20,
    fontWeight: "bold",
  },
  headerIcon: {
    height: 42,
    width: 41,
  },
  avatar: {
  },
  body: {
    flex: 1,
    justifyContent: "space-around",
    padding: 10,
  },
  card: {
    padding: 20,
    marginVertical: 10,
  },
  button: {
    width: "80%",
    alignSelf: "center",
  },
});
