import * as React from "react";
import { StyleSheet, Keyboard } from "react-native";
import {
  Button,
  Dialog,
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
import { ManagementType } from "../../types/common";
import { useUpsertFlashcard } from "../../utils/hooks";

export default function AddFlashcards({ showAddingFlashcards, close }) {
  const theme = useTheme();
  const { isMutating, trigger: upsertFlashcard } = useUpsertFlashcard();
  const addFlashcard = () => {
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
  };
  const [question, setQuestion] = useState("");
  const [answer, setAnswer] = useState("");
  const [priority, setPriority] = useState(5);
  const [selectedSetId, setSelectedSetId] = useState(null);
  const [showError, setShowError] = useState(false);
  const getSelectedSetId = (setId) => {
    setSelectedSetId(setId);
    console.log(setId);
  };
  function resetDialogue() {
    setSelectedSetId(null);
    close();
    Keyboard.dismiss();
    setShowError(false);
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
        <SearchWithList
          mode="select"
          type={ManagementType.FLASHCARD}
          searchPlaceholder="Search for flashcard set"
          sendSetId={getSelectedSetId}
          noSetSelected={showError}
        />

        <TextInput
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
          style={styles.textInputStyle}
          label="Answer:"
          multiline={true}
          blurOnSubmit={true}
          disabled={isMutating}
          onChangeText={(answer) => {
            setAnswer(answer);
          }}
        />
        <Dialog.Actions>
          <Button
            style={{ width: responsiveWidth(70), marginTop: 10 }}
            disabled={isMutating}
            onPress={() => {
              selectedSetId === null ? setShowError(true) : addFlashcard();
            }}
            mode="contained"
          >
            add new flashcard
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
