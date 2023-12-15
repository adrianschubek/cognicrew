import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import {
  responsiveHeight,
  responsiveWidth
} from "react-native-responsive-dimensions";
import LearningProjectCategory from "../components/learningProject/LearningProjectCategory";
import { NAVIGATION } from "../types/common";

export default function LearningRoom({ navigation }) {
  return (
    <>
      <View style={styles.container}>
        <StatusBar style="auto" />
        <LearningProjectCategory
          path={require("../assets/completed_task_symbol.png")}
          name={"Cogniquiz"}
          function={() => {
            navigation.navigate(NAVIGATION.EXERCISE_GAME);
            console.log("Quiz Game Pressed");
          }}
        />
        <LearningProjectCategory
          path={require("../assets/cards_symbol.png")}
          name={"Cognicards"}
          flexDirection="row-reverse"
          mode="contained"
          function={() => {
            console.log("Flashcard Game Pressed");
          }}
        />

        <LearningProjectCategory
          path={require("../assets/teamwork_symbol.png")}
          name={"Cogniboard"}
          function={() => {
            navigation.navigate(NAVIGATION.WHITEBOARD);
            console.log("Whiteboard pressed");
          }}
        />
      </View>
    </>
  );
}

const styles = StyleSheet.create({
  container: {
    width: responsiveWidth(100),
    height: responsiveHeight(100),
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "flex-start",
  },
});
