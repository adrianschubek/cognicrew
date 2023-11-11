import { max, update } from "cypress/types/lodash";
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
import {
  useAnswersExercises,
  useUpsertAnswersExercise,
  useUpsertExercise,
} from "../../utils/hooks";
import LoadingOverlay from "../alerts/LoadingOverlay";

export default function EditExercise({ listItem }) {
  const theme = useTheme();
  const [priority, setPriority] = useState(5);
  const [selectedSetId, setSelectedSetId] = useState(listItem.set_id);
  const [question, setQuestion] = useState(listItem.question);
  const { data, error, isLoading } = useAnswersExercises(listItem.id);
  const { isMutating, trigger: upsertExercise } = useUpsertExercise();
  const { isMutating: isMutating2, trigger: upsertAnswersExercise } =
    useUpsertAnswersExercise();
  const updateExercise = () => {
    upsertExercise({
      //@ts-expect-error
      id: listItem.id,
      question: question,
      priority: priority,
      set_id: selectedSetId,
    }).then((res) => {
      answers.forEach((e) => {
        console.log("ANSWER:" + "                    " + e);
        upsertAnswersExercise({
          //@ts-expect-error
          id: e[2],
          answer: e[0],
          exercise: res[0].id,
          is_correct: e[1],
        });
      });
    });
  };
  useEffect(() => {
    if (!data) return;
    setAnswers([
      [data[0].answer, data[0].is_correct, data[0].id],
      [data[1].answer, data[1].is_correct, data[1].id],
      [data[2].answer, data[2].is_correct, data[2].id],
      [data[3].answer, data[3].is_correct, data[3].id],
    ]);
  }, [data]);
  const [answers, setAnswers] = useState<[string, boolean, number][]>([
    ["", false, 0],
    ["", false, 0],
    ["", false, 0],
    ["", false, 0],
  ]);
  const getAnswer1 = ([text, checked]) => {
    setAnswers([
      [text, checked, answers[0][2]],
      answers[1],
      answers[2],
      answers[3],
    ]);
  };
  const getAnswer2 = ([text, checked]) => {
    setAnswers([
      answers[0],
      [text, checked, answers[1][2]],
      answers[2],
      answers[3],
    ]);
  };
  const getAnswer3 = ([text, checked]) => {
    setAnswers([
      answers[0],
      answers[1],
      [text, checked, answers[2][2]],
      answers[3],
    ]);
  };
  const getAnswer4 = ([text, checked]) => {
    setAnswers([
      answers[0],
      answers[1],
      answers[2],
      [text, checked, answers[3][2]],
    ]);
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
          performFunction={updateExercise}
        />
        <TextInputWithCheckbox
          listItemAnswer={answers[1]}
          sendAnswer={getAnswer2}
          number="2"
          performFunction={updateExercise}
        />
        <TextInputWithCheckbox
          listItemAnswer={answers[2]}
          sendAnswer={getAnswer3}
          number="3"
          performFunction={updateExercise}
        />
        <TextInputWithCheckbox
          listItemAnswer={answers[3]}
          sendAnswer={getAnswer4}
          number="4"
          performFunction={updateExercise}
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
