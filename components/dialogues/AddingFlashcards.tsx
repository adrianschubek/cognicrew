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
import SearchAndSelect from "../common/SearchAndSelect";

export default function AddingFlashcards({ showAddingFlashcards, close }) {
  const theme = useTheme();
  const flashcard = {
    question: "",
    answer: "",
    id: 0,
    groupId: 0,
  };
  const [question, setQuestion] = useState(flashcard.question);
  const [answer, setAnswer] = useState(flashcard.answer);
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
        <SearchAndSelect
          type="flashcard"
          searchPlaceholder="Search for flashcard set"
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
        <TextInput
          style={styles.textInputStyle}
          label="Answer:"
          multiline={true}
          onChangeText={(answer) => {
            setAnswer(answer);
            console.log(answer);
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
  cardStyle: {
    width: responsiveWidth(100) - responsiveHeight(2),
    marginTop: responsiveHeight(1),
    marginBottom: responsiveHeight(1),
    alignSelf: "center",
  },
  cardContentStyle: {},
  textInputStyle: {
    marginBottom: responsiveHeight(1),
    width: responsiveWidth(70),
  },
});
