import CreateQuizGame from "../components/dialogues/CreateQuizGame";

import * as React from "react";
import { ScrollView, View, TouchableOpacity, StyleSheet, Alert } from "react-native";
import { Dialog, Portal, RadioButton, Button, Text, ProgressBar } from "react-native-paper";
import { responsiveHeight, responsiveFontSize } from "react-native-responsive-dimensions";

// Placeholder function to simulate fetching questions
const fetchQuestions = () => {
  return [
    {
      question: "Which city is the capital of France?",
      options: ["Paris", "Berlin", "Rome", "Madrid"],
      correctAnswer: "Paris"
    },
    {
      question: "Wie groß ist Timo's Weihnachtsbaum?",
      options: ["2cm", "3cm", "5m", "Timo ist Atheist obwohl sein Vater Theologie studiert hat und besitzt daher keinen Weihnachtsbaum"],
      correctAnswer: "Timo ist Atheist obwohl sein Vater Theologie studiert hat und besitzt daher keinen Weihnachtsbaum"
    },
    {
      question: "A, B, C und ?",
      options: ["D", "X", "Y", "Z"],
      correctAnswer: "D"
    },
  ];
};

export default function ExerciseGame({}) {
         const [showCreateQuizGame, setShowCreateQuizGame] = React.useState(false);
                    return (
                <>
                        <Button onPress={() => setShowCreateQuizGame(true)}>Start Quiz</Button>

                        <CreateQuizGame
                             showCreateQuizGame={showCreateQuizGame}
                             close={() => setShowCreateQuizGame(false)}
                        />
                </>
    );
}

const styles = StyleSheet.create({
});
