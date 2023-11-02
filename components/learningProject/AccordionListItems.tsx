import { max } from "cypress/types/lodash";
import * as React from "react";
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
const accordionListItems = [
  {
    question: "What does Sigmund Freud base his main theory on?",
    answer: "on case studies of his own patients and those of his colleagues",
    id: 1,
  },
  {
    question: "Why can't I find love and why doesn't my family love me?",
    answer: "because I am clearly unloveable",
    id: 2,
  },
  {
    question: "Why do we live?",
    answer: "we live ultimately to survive and pass on our genes",
    id: 3,
  },
  {
    question: "How can i convince my gf to buy me a Porsche?",
    answer:
      "use of questionable, agressive and emotionaly manipulative tactics",
    id: 4,
  },
];

export default function AccordionListItems() {
  const theme = useTheme();
  const [question, setQuestion] = React.useState("");
  const [answer, setAnswer] = React.useState("");
  return accordionListItems.map((listItem) => (
    <>
      <List.Accordion
        title={listItem.question}
        key={listItem.id}
        style={{
          width: responsiveWidth(100),
          backgroundColor: theme.colors.secondaryContainer,
        }}
        onPress={() => {
          setQuestion(listItem.question);
          setAnswer(listItem.answer);
        }}
      >
        <Card elevation={1} style={styles.cardStyle} key={listItem.id}>
          <Card.Title title="edit here:" />
          <Card.Content style={styles.cardContentStyle}>
            <TextInput
              style={[
                styles.textInputStyle,
                { marginBottom: responsiveHeight(1) },
              ]}
              multiline={true}
              label="question:"
              value={question}
              onChangeText={(question) => {
                setQuestion(question);
                console.log(question);
                //update backend
              }}
            />
            <TextInput
              style={styles.textInputStyle}
              label="answer:"
              multiline={true}
              value={answer}
              onChangeText={(answer) => {
                setAnswer(answer);
                console.log(answer);
                //update backend
              }}
            />
          </Card.Content>
        </Card>
      </List.Accordion>
      <Divider />
    </>
  ));
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
