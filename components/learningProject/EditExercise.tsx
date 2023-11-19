import { max, update } from "cypress/types/lodash";
import { Fragment, useCallback, useEffect, useState } from "react";
import { StyleSheet, View } from "react-native";
import {
  Text,
  List,
  Divider,
  useTheme,
  Card,
  TextInput,
  Checkbox,
  IconButton,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import TextInputWithCheckbox from "../common/TextInputWithCheckbox";
import {
  useAnswersExercises,
  useDeleteExercise,
  useUpsertAnswersExercise,
  useUpsertExercise,
} from "../../utils/hooks";
import LoadingOverlay from "../alerts/LoadingOverlay";

export default function EditExercise({ listItem }) {
  const theme = useTheme();
  const [isInitialized, setIsInitialized] = useState(false);
  const [priority, setPriority] = useState(listItem.prority);
  const [question, setQuestion] = useState(listItem.question);
  const { data, error, isLoading } = useAnswersExercises(listItem.id);
  const { isMutating, trigger: upsertExercise } = useUpsertExercise();
  const { trigger: deleteExercise } = useDeleteExercise();
  const { isMutating: isMutating2, trigger: upsertAnswersExercise } =
    useUpsertAnswersExercise();
  const updateExercise = (question, answers, priority) => {
    setIsInitialized(true);
    upsertExercise({
      //@ts-expect-error
      id: listItem.id,
      question: question,
      priority: priority,
      set_id: listItem.set_id,
    }).then((res) => {
      answers.forEach((e) => {
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
    if (!data || isInitialized) return;
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
    setAnswers((prevAnswers) => [
      [text, checked, prevAnswers[0][2]],
      prevAnswers[1],
      prevAnswers[2],
      prevAnswers[3],
    ]);
  };

  const getAnswer2 = ([text, checked]) => {
    setAnswers((prevAnswers) => [
      prevAnswers[0],
      [text, checked, prevAnswers[1][2]],
      prevAnswers[2],
      prevAnswers[3],
    ]);
  };

  const getAnswer3 = ([text, checked]) => {
    setAnswers((prevAnswers) => [
      prevAnswers[0],
      prevAnswers[1],
      [text, checked, prevAnswers[2][2]],
      prevAnswers[3],
    ]);
  };
  const getAnswer4 = ([text, checked]) => {
    setAnswers((prevAnswers) => [
      prevAnswers[0],
      prevAnswers[1],
      prevAnswers[2],
      [text, checked, prevAnswers[3][2]],
    ]);
  };
  const debounce = (func, delay) => {
    let timer;
    let args;
    return (...newArgs) => {
      args = newArgs;
      clearTimeout(timer);
      timer = setTimeout(() => {
        func(...args);
      }, delay);
    };
  };
  // Create the debounced function
  const debouncedEditExercise = useCallback(
    debounce((question, answers, priority) => {
      updateExercise(question, answers, priority);
    }, 500),
    [], // dependencies array is empty because debounce and editFlashcard do not change
  );
  useEffect(() => {
    if (question !== null && answers !== null) {
      // Call the debounced function
      debouncedEditExercise(question, answers, priority);
    }
  }, [question, answers, priority, debouncedEditExercise]); // add debouncedEditFlashcard to dependencies
  if (error) return <LoadingOverlay visible={isLoading} />;
  return (
    <Card elevation={1} style={styles.cardStyle}>
      <Card.Title
        title="Edit here:"
        right={() => (
          <View style={{ flexDirection: "row", marginBottom:8, marginTop:8 }}>
            <Text style={{ alignSelf: "center", opacity: 0.5, marginRight: 8 }}>
              Choose priority:
            </Text>
            <TextInput
              label=""
              mode="outlined"
              placeholder="9"
              multiline={false}
              outlineColor={null}
              inputMode="numeric"
              style={{ backgroundColor: null, }}
              contentStyle={{ }}
            />

            <IconButton
              icon="delete"
              onPress={() => deleteExercise({ id: listItem.id })}
            />
          </View>
        )}
      />
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
