import * as React from "react";
import { StyleSheet, Keyboard, View } from "react-native";
import {
  Button,
  Dialog,
  HelperText,
  Portal,
  TextInput,
  useTheme,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { useState } from "react";
import SearchWithList from "../common/SearchWithList";
import TextInputWithCheckbox from "../common/TextInputWithCheckbox";
import { ManagementType } from "../../types/common";
import { useUpsertAnswersExercise, useUpsertExercise } from "../../utils/hooks";
import { checkForLineBreak } from "../../utils/common";

export default function AddExercises({ showAddExercises, close }) {
  const theme = useTheme();
  const array = Array.from({ length: 4 }, (_, index) => index + 1) as number[];
  const [question, setQuestion] = useState<string>("");
  const [showErrorNoSetSelected, setShowErrorNoSetSelected] =
    useState<boolean>(false);
  const [showErrorUpload, setShowErrorUpload] = useState<boolean>(false);
  const [errorText, setErrorText] = useState<string>("");
  const [answers, setAnswers] = useState<[string, boolean][]>([
    ["", false],
    ["", false],
    ["", false],
    ["", false],
  ]);
  const [priority, setPriority] = useState(5);
  const [selectedSetId, setSelectedSetId] = useState(null);
  const { isMutating, trigger: upsertExercise } = useUpsertExercise();
  const { isMutating: isMutating2, trigger: upsertAnswersExercise } =
    useUpsertAnswersExercise();
  const getSelectedSetId = (setId) => {
    setSelectedSetId(setId);
  };
  function resetDialogue() {
    setSelectedSetId(null);
    close();
    Keyboard.dismiss();
    setShowErrorNoSetSelected(false);
    setShowErrorUpload(false);
  }
  const addExercise = () => {
    checkForError(() => {
      upsertExercise({
        //@ts-expect-error
        question: question,
        priority: priority,
        set_id: selectedSetId,
      }).then((res) => {
        answers.forEach((e, index) => {
          upsertAnswersExercise({
            //@ts-expect-error
            answer: e[0],
            exercise: res[0].id,
            is_correct: e[1],
            order_position: index + 1,
          });
        });
      });
      setQuestion("");
      setAnswers([
        ["", false],
        ["", false],
        ["", false],
        ["", false],
      ]);
      resetDialogue();
    });
  };

  function checkForError(functionToCheck: () => any) {
    const questionExists = question !== "";
    const correctAnswerExists = answers.some((e) => e[0] && e[1]);
    if (correctAnswerExists && questionExists && selectedSetId !== null) {
      functionToCheck();
    } else {
      selectedSetId === null && setShowErrorNoSetSelected(true);
      let errorText = "";
      !questionExists &&
        (errorText += checkForLineBreak(errorText, "Please enter a question"));
      !correctAnswerExists &&
        (errorText += checkForLineBreak(
          errorText,
          "Please enter at least one correct answer",
        ));
      setErrorText(errorText);
      setShowErrorUpload(true);
    }
  }
  function getAnswer(number: number) {
    return ([text, checked]: [string, boolean]) => {
      let newAnswers = [...answers];
      newAnswers[number - 1] = [text, checked];
      setAnswers(newAnswers);
    };
  }
  return (
    <Portal>
      <Dialog
        style={{ alignItems: "center" }}
        visible={showAddExercises}
        onDismiss={() => {
          resetDialogue();
        }}
      >
        <View style={{ width: responsiveWidth(70) }}>
          <SearchWithList
            mode="select"
            type={ManagementType.EXERCISE}
            searchPlaceholder="Search for exercise set"
            sendSetId={getSelectedSetId}
            noSetSelected={showErrorNoSetSelected}
          />
          <TextInput
            style={[styles.textInputStyle]}
            label="Question:"
            multiline={true}
            blurOnSubmit={true}
            onChangeText={(question) => {
              setQuestion(question);
            }}
          />
          {array.map((e) => {
            return (
              <TextInputWithCheckbox
                key={e}
                number={e}
                sendAnswer={getAnswer(e)}
                width={"100%"}
              />
            );
          })}
          {showErrorUpload && errorText !== "" && (
            <HelperText
              style={{ paddingHorizontal: 0 }}
              type="error"
              visible={showErrorUpload}
            >
              {errorText}
            </HelperText>
          )}
        </View>
        <Dialog.Actions>
          <Button
            style={{ width: responsiveWidth(70), marginTop: 10 }}
            onPress={() => {
              addExercise();
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
    maxHeight: responsiveHeight(10.5),
  },
});
