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
import { useState } from "react";
import SearchWithList from "../common/SearchWithList";
import { ManagementType } from "../../types/common";
import { useUpsertFlashcard } from "../../utils/hooks";
import ts from "typescript";

export default function AddFlashcards({ showAddingFlashcards, close }) {
  const theme = useTheme();
  const { isMutating, trigger: upsertFlashcard } = useUpsertFlashcard();
  const addFlashcard = () => {
    upsertFlashcard(
      {
        //@ts-expect-error
        question: question,
        answer: answer,
        priority: 5,
        set_id: selectedSetId,
      },
    );
    setQuestion("");
    setAnswer("");
  };
  const [question, setQuestion] = useState("");
  const [answer, setAnswer] = useState("");
  const [selectedSetId, setSelectedSetId] = useState();
  const getSelectedSetId = (setId) => {
    setSelectedSetId(setId);
    console.log(setId);
  };
  return (
    <Portal>
      <Dialog
        style={{ alignItems: "center" }}
        visible={showAddingFlashcards}
        onDismiss={() => {
          close();
          Keyboard.dismiss();
        }}
      >
        <SearchWithList
          mode="select"
          type={ManagementType.FLASHCARD}
          searchPlaceholder="Search for flashcard set"
          sendSetId={getSelectedSetId}
        />
        <TextInput
          style={[styles.textInputStyle]}
          multiline={true}
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
          disabled={isMutating}
          onChangeText={(answer) => {
            setAnswer(answer);
            //console.log(answer);
            //update backend
          }}
        />
        <Dialog.Actions>
          <Button
            style={{ width: responsiveWidth(70) }}
            disabled={isMutating}
            onPress={() => {
              addFlashcard(), close(), Keyboard.dismiss();
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
  },
});
