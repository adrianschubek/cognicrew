import { max } from "cypress/types/lodash";
import * as React from "react";
import { useState } from "react";
import { StyleSheet, View } from "react-native";
import {
  Text,
  List,
  Divider,
  useTheme,
  Card,
  TextInput,
  Checkbox,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import TextInputWithCheckbox from "../common/TextInputWithCheckbox";

export default function EditExercise({ listItem }) {
  const theme = useTheme();
  const [question, setQuestion] = useState(listItem.question);
  const [answer1, setAnswer1] = useState(listItem.answer1);
  const [answer2, setAnswer2] = useState(listItem.answer2);
  const [answer3, setAnswer3] = useState(listItem.answer3);
  const [answer4, setAnswer4] = useState(listItem.answer4);
  const [checked, setChecked] = useState(false);
  return (
    <Card elevation={1} style={styles.cardStyle}>
      <Card.Title title="Edit here:" />
      <Card.Content style={styles.cardContentStyle}>
        <TextInput
          style={[styles.textInputStyle, { marginBottom: responsiveHeight(1) }]}
          multiline={true}
          label="Question:"
          value={/*hier muss dann listItem.question hin*/ question}
          onChangeText={(question) => {
            setQuestion(question);
            console.log(question);
            //update backend
          }}
        />
        <TextInputWithCheckbox listItem={listItem}/>
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
