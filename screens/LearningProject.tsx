import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import { Button, Text } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import LearningProjectCategory from "../components/learningProject/LearningProjectCategory";

export default function LearningProject({ navigation }) {
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <LearningProjectCategory
        path={require("../assets/cards_symbol.png")}
        name={"Flashcards"}
        function={() => {
          navigation.navigate("FlashcardManagement");
        }}
      />
      <LearningProjectCategory
        path={require("../assets/completed_task_symbol.png")}
        name={"Exercises"}
        function={() => {
          navigation.navigate("ExerciseManagement");
        }}
      />
      <LearningProjectCategory
        path={require("../assets/camera_symbol.png")}
        name={"Links"}
        function={() => {
          navigation.navigate("LinkManagement");
        }}
      />
      <LearningProjectCategory
        path={require("../assets/files_symbol.png")}
        name={"Files"}
      />
    
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    width: responsiveWidth(100),
    height: responsiveHeight(100),
    flex: 1,
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "flex-start",
  },
});
