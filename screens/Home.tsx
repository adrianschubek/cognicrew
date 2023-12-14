import * as React from "react";
import { View, StyleSheet, Image } from "react-native";
import { StatusBar } from "expo-status-bar";
import { Avatar, Text, Card, IconButton, Button, useTheme } from "react-native-paper";
import JoinRoom from "../components/learningRoom/JoinRoom";
import { useUsername } from "../utils/hooks";
import { useEffect } from "react";

//for testing purposes
import { NAVIGATION } from "../types/common";

export default function HomeScreen({ navigation }) {
  const { data, isLoading } = useUsername();
  const theme = useTheme();

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

  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <View style={styles.header}>
        <Text style={styles.headerText}>
          Hello, {isLoading ? "...." : data}
        </Text>
        <Avatar.Text
          size={48}
          label={(isLoading ? "" : data).substring(0, 2)}
          style={styles.avatar}
        />
      </View>
      <View style={styles.body}>
        <Card style={styles.card} mode="contained" theme={{
          colors: { surfaceVariant: theme.colors.secondaryContainer },
        }}>
          <JoinRoom navigation={navigation} />
        </Card>
      </View>
      {/* for testing purposes*/}
      {/* 
      <Button
      style={{marginBottom: 20}}
        onPress={() => {
          navigation.navigate(NAVIGATION.END_RESULTS, {
            roomState: null,
            user_id: null,
          });
        }}
      >
        PRESS ME, DADDY!
      </Button>*/}
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
  avatar: {},
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
