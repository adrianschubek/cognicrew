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
    question: "What does Sigmund Freud base his main theory on? ",
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
    <View key={listItem.id}>
      <List.Accordion
        title={listItem.question}
        titleNumberOfLines={4}
        style={{
          width: responsiveWidth(100),
          backgroundColor: theme.colors.secondaryContainer,
        }}
        onPress={() => {
          setQuestion(listItem.question);
          setAnswer(listItem.answer);
        }}
      >
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
              value={/*hier muss dann listItem.question hin*/question}
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
      </List.Accordion>
      <Divider />
      </View>
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
