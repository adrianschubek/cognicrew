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

export default function AddFlashcards({ showAddingFlashcards, close }) {
  const theme = useTheme();
  const { isMutating, trigger: upsertFlashcard} = useUpsertFlashcard();
  const save =  () =>{
    upsertFlashcard([{
      question: question,
      answer: answer,
      id: 0,
      groupId: 0,
    }]);
    setQuestion("");
    setAnswer("");
  };
  const [question, setQuestion] = useState("");
  const [answer, setAnswer] = useState("");
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
        />
        <TextInput
          style={[styles.textInputStyle]}
          multiline={true}
          label="Question:"
          onChangeText={(question) => {
            setQuestion(question);
            //console.log(question);
            //update backend
          }}
        />
        <TextInput
          style={styles.textInputStyle}
          label="Answer:"
          multiline={true}
          onChangeText={(answer) => {
            setAnswer(answer);
            //console.log(answer);
            //update backend
          }}
        />
        <Dialog.Actions>
          <Button
            style={{ width: responsiveWidth(70) }}
            onPress={() => {
              close(), Keyboard.dismiss();
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
