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
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";

export default function EditFlashcard({listItem}) {
  const theme = useTheme();
  const [question, setQuestion] = useState(listItem.question);
  const [answer, setAnswer] = useState(listItem.answer);
  return (
        <Card elevation={1} style={styles.cardStyle}>
          <Card.Title title="Edit here:" />
          <Card.Content style={styles.cardContentStyle}>
            <TextInput
              style={[
                styles.textInputStyle,
                { marginBottom: responsiveHeight(1) },
              ]}
              multiline={true}
              label="Question:"
              value={/*hier muss dann listItem.question hin*/ question}
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
              value={/*hier muss dann listItem.answer hin*/ answer}
              onChangeText={(answer) => {
                setAnswer(answer);
                console.log(answer);
                //update backend
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
