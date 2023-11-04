import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import { Dialog, Portal } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import LearningProjectCategory from "../components/learningProject/LearningProjectCategory";
import { useState } from "react";
import CreateFlashCardGame from "../components/dialogues/CreateFlashcardGame";
import CreateQuizGame from "../components/dialogues/CreateQuizGame";

export default function LearningRoom({ navigation }) {
  const [showCreateFlashcardGame, setShowCreateFlashcardGame] = useState(false);
  const [showCreateQuizGame, setShowCreateQuizGame] = useState(false);
  return (
    <>
      <CreateFlashCardGame
        showCreateFlashcardGame={showCreateFlashcardGame}
        close={() => setShowCreateFlashcardGame(false)}
      />
      <CreateQuizGame
        showCreateQuizGame={showCreateQuizGame}
        close={() => setShowCreateQuizGame(false)}
      />
      <View style={styles.container}>
        <StatusBar style="auto" />
        <LearningProjectCategory
          path={require("../assets/completed_task_symbol.png")}
          name={"Cogniquiz"}
          function={() => {
            setShowCreateQuizGame(true);
            console.log("Quiz Game Pressed");
          }}
        />
        <LearningProjectCategory
          path={require("../assets/cards_symbol.png")}
          name={"Cognicards"}
          flexDirection="row-reverse"
          mode="contained"
          function={() => {
            setShowCreateFlashcardGame(true);
            console.log("Flashcard Game Pressed");
          }}
        />
        <LearningProjectCategory
          path={require("../assets/teamwork_symbol.png")}
          name={"Cogniboard"}
        />
      </View>
    </>
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
