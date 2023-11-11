import { max } from "cypress/types/lodash";
import * as React from "react";
import { useState } from "react";
import { StyleSheet, View } from "react-native";
import {
  useTheme,
  Card,
  TextInput,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { useUpsertFlashcard } from "../../utils/hooks";

export default function EditFlashcard({ listItem }) {
  const theme = useTheme();
  const [question, setQuestion] = useState(listItem.question);
  const [answer, setAnswer] = useState(listItem.answer);
  const [priority, setPriority] = useState(listItem.priority);
  const { isMutating, trigger: upsertFlashcard } = useUpsertFlashcard();
  //is called everytime the user changes text in the textinput, thats the design right now, do we want to do it like that?
  const editFlashcard = (question, answer, priority) => {
    upsertFlashcard(
      {
        //@ts-expect-error
        id:listItem.id,
        question: question,
        answer: answer,
        priority: priority,
        set_id: listItem.set_id,
      },
    );}
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
            editFlashcard(question,answer,priority);
          }}
        />
        <TextInput
          style={styles.textInputStyle}
          label="Answer:"
          multiline={true}
          value={answer}
          onChangeText={(answer) => {
            setAnswer(answer);
            editFlashcard(question,answer,priority);
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
