import { max, set, update } from "cypress/types/lodash";
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
  HelperText,
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
import { parse } from "react-native-svg";
import PrioritySelector from "./PrioritySelector";
import { debounce } from "../../utils/common";

export default function EditExercise({ listItem }) {
  const theme = useTheme();
  const array = Array.from({ length: 4 }, (_, index) => index + 1) as number[];
  const [allowUpdate, setAllowUpdate] = useState(false);
  const [isInitialized, setIsInitialized] = useState(false);
  const [priority, setPriority] = useState<number>(0);
  const [question, setQuestion] = useState(listItem.question);
  const { data, error, isLoading } = useAnswersExercises(listItem.id);
  const { isMutating, trigger: upsertExercise } = useUpsertExercise();
  const { trigger: deleteExercise } = useDeleteExercise();
  const { isMutating: isMutating2, trigger: upsertAnswersExercise } =
    useUpsertAnswersExercise();
  const updateExercise = (question, answers, priority) => {
    upsertExercise({
      //@ts-expect-error
      id: listItem.id,
      question: question,
      priority: priority,
      set_id: listItem.set_id,
    }).then((res) => {
      answers.forEach((e, index) => {
        upsertAnswersExercise({
          //@ts-expect-error
          id: e[2],
          answer: e[0],
          exercise: res[0].id,
          is_correct: e[1],
          order_position: index + 1,
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
    setIsInitialized(true);
  }, [data]);

  const [answers, setAnswers] = useState<[string, boolean, number][]>([
    ["", false, 0],
    ["", false, 0],
    ["", false, 0],
    ["", false, 0],
  ]);
  function getAnswer(number: number) {
    return ([text, checked]: [string, boolean]) => {
      let newAnswers = [...answers];
      newAnswers[number - 1] = [text, checked, answers[number - 1][2]];
      setAnswers(newAnswers);
    };
  }
  // Create the debounced function
  const debouncedEditExercise = useCallback(
    debounce((question, answers, priority) => {
      updateExercise(question, answers, priority);
    }, 500),
    [], // dependencies array is empty because debounce and editFlashcard do not change
  );
  useEffect(() => {
    if (question && answers && priority && isInitialized === true) {
      // Call the debounced function
      allowUpdate === true
        ? debouncedEditExercise(question, answers, priority)
        : setAllowUpdate(true);
    }
  }, [question, answers, priority, debouncedEditExercise]); // add debouncedEditFlashcard to dependencies

  useEffect(() => {
    if (isInitialized) return;
    if (!listItem.priority) return;
    setPriority(listItem.priority);
  }, [listItem.priority]);

  if (error) return <LoadingOverlay visible={isLoading} />;
  return (
    <Card elevation={1} style={styles.cardStyle}>
      <Card.Title
        title="Edit here:"
        titleStyle={{}}
        style={{}}
        right={() => (
          <Fragment>
            <View
              style={{
                flexDirection: "row",
                marginBottom: 8,
                marginTop: 8,
                justifyContent: "flex-end",
              }}
            >
              <PrioritySelector
                priority={priority}
                setPriority={(val) => {
                  setPriority(val);
                }}
              />
              <IconButton
                icon="delete"
                onPress={() => {
                  deleteExercise({ id: listItem.id });
                }}
                style={{ alignSelf: "center" }}
              />
            </View>
          </Fragment>
        )}
      />
      <Card.Content style={styles.cardContentStyle}>
        <TextInput
          style={[styles.textInputStyle, { marginBottom: 8 }]}
          multiline={true}
          label="Question:"
          value={question}
          onChangeText={(question) => {
            setQuestion(question);
          }}
        />
        {array.map((e) => {
          return (
            <TextInputWithCheckbox
              key={e}
              listItemAnswer={answers[e - 1]}
              sendAnswer={getAnswer(e)}
              number={e}
            />
          );
        })}
      </Card.Content>
    </Card>
  );
}

const styles = StyleSheet.create({
  cardStyle: {
    width: responsiveWidth(100) - responsiveHeight(2),
    marginTop: 8,
    marginBottom: 8,
    alignSelf: "center",
  },
  cardContentStyle: {},
  textInputStyle: {},
});
