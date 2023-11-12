import { max } from "cypress/types/lodash";
import * as React from "react";
import { useCallback, useEffect, useState } from "react";
import { StyleSheet, View } from "react-native";
import { useTheme, Card, TextInput } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { useUpsertFlashcard } from "../../utils/hooks";
import { use } from "chai";

export default function EditFlashcard({ listItem }) {
  const debounce = (func, delay) => {
    let timer;
    return (...args) => {
      clearTimeout(timer);
      timer = setTimeout(() => {
        func(...args);
      }, delay);
    };
  };
  const theme = useTheme();
  const [question, setQuestion] = useState(listItem.question);
  const [answer, setAnswer] = useState(listItem.answer);
  const [priority, setPriority] = useState(listItem.priority);
  const { isMutating, trigger: upsertFlashcard } = useUpsertFlashcard();

  const editFlashcard = (question, answer, priority) => {
    upsertFlashcard({
      //@ts-expect-error
      id: listItem.id,
      question: question,
      answer: answer,
      priority: priority,
      set_id: listItem.set_id,
    });
  };
  // Create the debounced function
  const debouncedEditFlashcard = useCallback(
    debounce((q, a, p) => {
      editFlashcard(q, a, p);
    }, 500),
    [] // dependencies array is empty because debounce and editFlashcard do not change
  );
  

  useEffect(() => {
    if (question !== "" && answer !== "") {
      // Call the debounced function
      debouncedEditFlashcard(question, answer, priority);
    }
  }, [question, answer, priority, debouncedEditFlashcard]); // add debouncedEditFlashcard to dependencies
  return (
    <Card elevation={1} style={styles.cardStyle}>
      <Card.Title title="Edit here:" />
      <Card.Content style={styles.cardContentStyle}>
        <TextInput
          style={[styles.textInputStyle, { marginBottom: responsiveHeight(1) }]}
          multiline={true}
          label="Question:"
          value={question}
          onChangeText={(question) => {
            setQuestion(question);
          }}
        />
        <TextInput
          style={styles.textInputStyle}
          label="Answer:"
          multiline={true}
          value={answer}
          onChangeText={(answer) => {
            setAnswer(answer);
          }}
        />
      </Card.Content>
    </Card>
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
  textInputStyle: {},
});
