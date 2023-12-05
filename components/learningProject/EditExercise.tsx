import { useEffect, useState } from "react";
import TextInputWithCheckbox from "../common/TextInputWithCheckbox";
import { useAnswersExercises } from "../../utils/hooks";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { HelperText, IconButton, Text } from "react-native-paper";
import { View } from "react-native";

export default function EditExercise(props: {
  listItem: any;
  sendAnswers: (answers: [string, boolean, number][]) => any;
  sendInitialAnswers: (answers: [string, boolean, number][]) => any;
}) {
  const { listItem, sendAnswers, sendInitialAnswers } = props;
  const [showErrorAnswerBoundaries, setShowErrorAnswerBoundaries] =
    useState<boolean>(false);
  const [isInitialized, setIsInitialized] = useState<boolean>(false);
  const [answers, setAnswers] = useState<[string, boolean, number][]>([]);
  const { data, error, isLoading } = useAnswersExercises(listItem.id);
  useEffect(() => {
    if (!isInitialized) return;
    sendAnswers(answers);
  }, [answers]);

  useEffect(() => {
    if (!data || isInitialized) return;
    const initializingAnswers: [string, boolean, number][] = [];
    data.forEach((answerItem) => {
      initializingAnswers.push([
        answerItem.answer,
        answerItem.is_correct,
        answerItem.order_position,
      ]);
    }),
      setAnswers(initializingAnswers);
    sendInitialAnswers(initializingAnswers);
    setIsInitialized(true);
  }, [data]);

  function getAnswer(number: number) {
    return ([text, checked]: [string, boolean]) => {
      let newAnswers = [...answers];
      newAnswers[number - 1] = [text, checked, answers[number - 1][2]];
      setAnswers(newAnswers);
    };
  }

  if (error) return <LoadingOverlay visible={isLoading} />;
  return (
    <>
      <View
        style={{
          flexDirection: "row",
          justifyContent: "space-between",
          alignItems: "center",
          marginLeft: 8,
        }}
      >
        <Text>Add or remove Answers: </Text>
        <View
          style={{
            flexDirection: "row",
            justifyContent: "flex-end",
          }}
        >
          <IconButton
            icon="minus"
            onPress={() => {
              if (answers.length <= 2) {
                setShowErrorAnswerBoundaries(true);
                return;
              }
              const newAnswers = [...answers];
              newAnswers.pop();
              setAnswers(newAnswers);
              setShowErrorAnswerBoundaries(false);
            }}
          />
          <IconButton
            icon="plus"
            onPress={() => {
              if (answers.length >= 6) {
                setShowErrorAnswerBoundaries(true);
                return;
              }
              const newArray = [...answers];
              newArray.push(["", false, newArray.length + 1]);
              setAnswers(newArray);
              setShowErrorAnswerBoundaries(false);
            }}
          />
        </View>
      </View>
      {showErrorAnswerBoundaries && (
        <HelperText
          style={{ paddingHorizontal: 0 }}
          type="error"
          visible={showErrorAnswerBoundaries}
        >
          You cannot have less than 2 or more than 6 answers
        </HelperText>
      )}
      {answers.map((e, index) => {
        return (
          <TextInputWithCheckbox
            key={index}
            listItemAnswer={e}
            sendAnswer={getAnswer(index + 1)}
            number={index + 1}
          />
        );
      })}
    </>
  );
}
