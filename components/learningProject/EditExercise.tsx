import { max } from "cypress/types/lodash";
import { useEffect, useState } from "react";
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
import { useAnswersExercises } from "../../utils/hooks";
import LoadingOverlay from "../alerts/LoadingOverlay";

export default function EditExercise({ listItem }) {
  const theme = useTheme();
  const [question, setQuestion] = useState(listItem.question);
  const { data, error, isLoading } = useAnswersExercises(listItem.id);
  useEffect(() => {
    if (!data) return;
    setAnswers([
      [data[0].answer, data[0].is_correct],
      [data[1].answer, data[1].is_correct],
      [data[2].answer, data[2].is_correct],
      [data[3].answer, data[3].is_correct],
    ]);
  }, [data]);
  const [answers, setAnswers] = useState<[string, boolean][]>([
    ["", false],
    ["", false],
    ["", false],
    ["", false],
  ]);
  const getAnswer1 = ([text, checked]) => {
    setAnswers([[text, checked], answers[1], answers[2], answers[3]]);
  };
  const getAnswer2 = ([text, checked]) => {
    setAnswers([answers[0], [text, checked], answers[2], answers[3]]);
  };
  const getAnswer3 = ([text, checked]) => {
    setAnswers([answers[0], answers[1], [text, checked], answers[3]]);
  };
  const getAnswer4 = ([text, checked]) => {
    setAnswers([answers[0], answers[1], answers[2], [text, checked]]);
  };
  if (error) return <LoadingOverlay visible={isLoading} />;
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
            //console.log([answers[0], answers[1], answers[2], answers[3]]);
            //update backend
          }}
        />
        <TextInputWithCheckbox
          listItemAnswer={answers[0]}
          sendAnswer={getAnswer1}
          number="1"
        />
        <TextInputWithCheckbox
          listItemAnswer={answers[1]}
          sendAnswer={getAnswer2}
          number="2"
        />
        <TextInputWithCheckbox
          listItemAnswer={answers[2]}
          sendAnswer={getAnswer3}
          number="3"
        />
        <TextInputWithCheckbox
          listItemAnswer={answers[3]}
          sendAnswer={getAnswer4}
          number="4"
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
