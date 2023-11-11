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
import { ManagementType } from "../../types/common";
import { useUpsertAnswersExercise, useUpsertExercise } from "../../utils/hooks";

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
  const [question, setQuestion] = useState("");
  const [answer1, setAnswer1] = useState<[string,boolean]>(["", false]);
  const [answer2, setAnswer2] = useState<[string,boolean]>(["", false]);
  const [answer3, setAnswer3] = useState<[string,boolean]>(["", false]);
  const [answer4, setAnswer4] = useState<[string,boolean]>(["", false]);
  const [priority, setPriority] = useState(5);
  const [selectedSetId, setSelectedSetId] = useState();
  const { isMutating, trigger: upsertExercise } = useUpsertExercise();
  const { isMutating: isMutating2, trigger: upsertAnswersExercise } = useUpsertAnswersExercise();
  const getSelectedSetId = (setId) => {
    setSelectedSetId(setId);
    console.log(setId);
  };
  const addExercise = () => {
    upsertExercise({
      //@ts-expect-error
      id:0,
      question: question,
      priority: priority,
      set_id: selectedSetId,
    });
    upsertAnswersExercise({
      //@ts-expect-error
      answer: answer1[0],
      exercise_id: 0,
      is_correct: answer1[1],

    });
    setQuestion("");
    setAnswer1(["", false]);
    setAnswer2(["", false]);
    setAnswer3(["", false]);
    setAnswer4(["", false]);
  };
  const getAnswer1 = ([text, checked]) => {
    setAnswer1([text, checked]);
  }
  const getAnswer2 = ([text, checked]) => {
    setAnswer2([text, checked]);
  }
  const getAnswer3 = ([text, checked]) => {
    setAnswer3([text, checked]);
  }
  const getAnswer4 = ([text, checked]) => {
    setAnswer4([text, checked]);
  }
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
        />
        <TextInputWithCheckbox
          number="1"
          sendAnswer={getAnswer1}
          width={responsiveWidth(70)}
        />
        <TextInputWithCheckbox
          number="2"
          sendAnswer={getAnswer2}
          width={responsiveWidth(70)}
        />
        <TextInputWithCheckbox
          number="3"
          sendAnswer={getAnswer3}
          width={responsiveWidth(70)}
        />
        <TextInputWithCheckbox
          number="4"
          sendAnswer={getAnswer4}
          width={responsiveWidth(70)}
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
