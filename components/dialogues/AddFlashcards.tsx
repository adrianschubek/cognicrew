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
} from "react-native-responsive-dimensions";
import { useState } from "react";
import SearchWithList from "../common/SearchWithList";
import { ManagementType } from "../../types/common";
import { useUpsertFlashcard } from "../../utils/hooks";
import { checkForLineBreak } from "../../utils/common";

/**
 * @deprecated delete this. useAlerts hook instead
 */
export default function AddFlashcards({ showAddingFlashcards, close }) {
  const theme = useTheme();
  const { isMutating, trigger: upsertFlashcard } = useUpsertFlashcard();
  const addFlashcard = () => {
    checkForError(() => {
      upsertFlashcard({
        //@ts-expect-error
        question: question,
        answer: answer,
        priority: priority,
        set_id: selectedSetId,
      });
      setQuestion("");
      setAnswer("");
      resetDialogue();
    });
  };
  const [question, setQuestion] = useState<string>("");
  const [answer, setAnswer] = useState<string>("");
  const [priority, setPriority] = useState<number>(5);
  const [selectedSetId, setSelectedSetId] = useState(null);
  const [showErrorNoSetSelected, setShowErrorNoSetSelected] =
    useState<boolean>(false);
  const [showErrorUpload, setShowErrorUpload] = useState<boolean>(false);
  const [errorText, setErrorText] = useState<string>("");
  const getSelectedSetId = (setId) => {
    setSelectedSetId(setId);
    console.log(setId);
  };
  function resetDialogue() {
    setSelectedSetId(null);
    close();
    Keyboard.dismiss();
    setShowErrorNoSetSelected(false);
    setShowErrorUpload(false);
  }
  function checkForError(functionToCheck: () => any) {
    const questionExists = question !== "";
    const answerExists = answer !== "";
    if (answerExists && questionExists && selectedSetId !== null) {
      functionToCheck();
    } else {
      selectedSetId === null && setShowErrorNoSetSelected(true);
      let errorText = "";
      !questionExists &&
        (errorText += checkForLineBreak(errorText, "Please enter a question"));
      !answerExists &&
        (errorText += checkForLineBreak(errorText, "Please enter an answer"));
      setErrorText(errorText);
      setShowErrorUpload(true);
    }
  }
  return (
    <Portal>
      <Dialog
        style={{ alignItems: "center" }}
        visible={showAddingFlashcards}
        onDismiss={() => {
          resetDialogue();
        }}
      >
        <View style={{ width: responsiveWidth(70) }}>
          <SearchWithList
            mode="select"
            type={ManagementType.FLASHCARD}
            searchPlaceholder="Search for cognicard set"
            sendSetId={getSelectedSetId}
            noSetSelected={showErrorNoSetSelected}
          />

          <TextInput
            testID="input-flashcard-question"
            style={[styles.textInputStyle]}
            multiline={true}
            blurOnSubmit={true}
            disabled={isMutating}
            label="Question:"
            onChangeText={(question) => {
              setQuestion(question);
            }}
          />
          <TextInput
            testID="input-flashcard-answer"
            style={styles.textInputStyle}
            label="Answer:"
            multiline={true}
            blurOnSubmit={true}
            disabled={isMutating}
            onChangeText={(answer) => {
              setAnswer(answer);
            }}
          />
          {showErrorUpload && errorText !== "" && (
            <HelperText
              style={{ paddingHorizontal: 0 }}
              type="error"
              visible={showErrorUpload}
            >
              {errorText}
            </HelperText>
          )}
          <HelperText
            style={{ paddingHorizontal: 0 }}
            type="info"
            visible={true}
          >
            You can add multiple correct answers by separating them with a
            comma!
          </HelperText>
        </View>
        <Dialog.Actions>
          <Button
            testID="add-new-flashcard-button"
            style={{ width: responsiveWidth(70), marginTop: 10 }}
            disabled={isMutating}
            onPress={() => {
              addFlashcard();
            }}
            mode="contained"
          >
            Add new cognicard
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
