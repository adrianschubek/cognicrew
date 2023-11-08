import * as React from "react";
import { StyleSheet, View, ScrollView, Keyboard } from "react-native";
import {
  Button,
  Dialog,
  List,
  Portal,
  Text,
  TextInput,
  useTheme,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import EditFlashcard from "../learningProject/EditFlashcard";
import { useState } from "react";
import SearchWithList from "../common/SearchWithList";
import TextInputWithCheckbox from "../common/TextInputWithCheckbox";

export default function AddExercises({ showAddExercises, close }) {
  const theme = useTheme();
  const exercise = {
    question: "",
    answer1: "",
    answer2: "",
    answer3: "",
    answer4: "",
    id: 0,
    groupId: 0,
  };
  const [question, setQuestion] = useState(exercise.question);
  const [answer1, setAnswer1] = useState(exercise.answer1);
  const [answer2, setAnswer2] = useState(exercise.answer2);
  const [answer3, setAnswer3] = useState(exercise.answer3);
  const [answer4, setAnswer4] = useState(exercise.answer4);
  return (
    <Portal>
      <Dialog
        style={{ alignItems: "center" }}
        visible={showAddExercises}
        onDismiss={() => {
          close();
          Keyboard.dismiss();
        }}
      >
        <SearchWithList
          mode="select"
          type="exercise"
          searchPlaceholder="Search for exercise set"
        />
        <TextInput
          style={[styles.textInputStyle]}
          multiline={true}
          label="Question:"
          onChangeText={(question) => {
            setQuestion(question);
            console.log(question);
            //update backend
          }}
        />
        <TextInputWithCheckbox
          number="1"
          listItemAnswer={answer1}
          width={responsiveWidth(70)}
        />
        <TextInputWithCheckbox
          number="2"
          listItemAnswer={answer2}
          width={responsiveWidth(70)}
        />
        <TextInputWithCheckbox
          number="3"
          listItemAnswer={answer3}
          width={responsiveWidth(70)}
        />
        <TextInputWithCheckbox
          number="4"
          listItemAnswer={answer4}
          width={responsiveWidth(70)}
        />
        <Dialog.Actions>
          <Button
            style={{ width: responsiveWidth(70) }}
            onPress={() => {
              close(), Keyboard.dismiss();
            }}
            mode="contained"
          >
            add new exercise
          </Button>
        </Dialog.Actions>
      </Dialog>
    </Portal>
  );
}

const styles = StyleSheet.create({
  textInputStyle: {
    marginBottom: responsiveHeight(1),
    width: responsiveWidth(70),
  },
});
