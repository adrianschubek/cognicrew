import * as React from "react";
import {
  StyleSheet,
  View,
  ScrollView,
  Keyboard,
  KeyboardAvoidingView,
} from "react-native";
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
import { ManagementType } from "../../types/common";
import { useUpsertAnswersExercise, useUpsertExercise } from "../../utils/hooks";
import { set } from "cypress/types/lodash";

export default function AddExercises({ showAddExercises, close }) {
  const theme = useTheme();
  const [question, setQuestion] = useState("");
  const [answers, setAnswers] = useState<[string, boolean][]>([
    ["", false],
    ["", false],
    ["", false],
    ["", false],
  ]);
  const [priority, setPriority] = useState(5);
  const [selectedSetId, setSelectedSetId] = useState();
  const { isMutating, trigger: upsertExercise } = useUpsertExercise();
  const { isMutating: isMutating2, trigger: upsertAnswersExercise } =
    useUpsertAnswersExercise();
  const getSelectedSetId = (setId) => {
    setSelectedSetId(setId);
    console.log(setId);
  };
  const addExercise = () => {
    upsertExercise({
      //@ts-expect-error
      question: question,
      priority: priority,
      set_id: selectedSetId,
    }).then((res) => {
      answers.forEach((e) => {
        upsertAnswersExercise({
          //@ts-expect-error
          answer: e[0],
          exercise: res[0].id,
          is_correct: e[1],
        });
      });
    }); //an array is expected
    setQuestion("");
    setAnswers([
      ["", false],
      ["", false],
      ["", false],
      ["", false],
    ]);
  };
  const getAnswer1 = ([text, checked]) => {
    setAnswers([[text, checked], answers[1], answers[2], answers[3]]);
  };
  const getAnswer2 = ([text, checked]) => {
    setAnswers([answers[0], [text, checked], answers[2], answers[3]]);
  };
  const getAnswer3 = ([text, checked]) => {
    setAnswers([answers[0], answers[1], [text, checked], answers[3]]);
  };
  const getAnswer4 = ([text, checked]) => {
    setAnswers([answers[0], answers[1], answers[2], [text, checked]]);
  };
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
            type={ManagementType.EXERCISE}
            searchPlaceholder="Search for exercise set"
            sendSetId={getSelectedSetId}
          />
          <TextInput
            style={[styles.textInputStyle]}
            multiline={true}
            label="Question:"
            onChangeText={(question) => {
              setQuestion(question);
            }}
            onSubmitEditing={() => {
              Keyboard.dismiss();
            }}
          />
          <TextInputWithCheckbox
            number="1"
            sendAnswer={getAnswer1}
            width={responsiveWidth(70)}
            onSubmitEditing={() => {
              Keyboard.dismiss();
            }}
          />
          <TextInputWithCheckbox
            number="2"
            sendAnswer={getAnswer2}
            width={responsiveWidth(70)}
            onSubmitEditing={() => {
              Keyboard.dismiss();
            }}
          />
          <TextInputWithCheckbox
            number="3"
            sendAnswer={getAnswer3}
            width={responsiveWidth(70)}
            onSubmitEditing={() => {
              Keyboard.dismiss();
            }}
          />
          <TextInputWithCheckbox
            number="4"
            sendAnswer={getAnswer4}
            width={responsiveWidth(70)}
            onSubmitEditing={() => {
              Keyboard.dismiss();
            }}
          />
          <Dialog.Actions>
          
            <Button
              style={{ width: responsiveWidth(70) }}
              onPress={() => {
                addExercise(), close(), Keyboard.dismiss();
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
