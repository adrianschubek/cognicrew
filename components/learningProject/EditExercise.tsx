import { useEffect, useState } from "react";
import TextInputWithCheckbox from "../common/TextInputWithCheckbox";
import { useAnswersExercises } from "../../utils/hooks";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { HelperText, IconButton } from "react-native-paper";
import { View, Text } from "react-native";
import { set } from "cypress/types/lodash";

export default function EditExercise(props: {
  listItem: any;
  sendAnswers: (answers: [string, boolean, number][]) => any;
  sendInitialAnswers: (answers: [string, boolean, number][]) => any;
}) {
  const {listItem, sendAnswers, sendInitialAnswers} = props;
  const [array, setArray] = useState<number[]>([]);
  const [showErrorAnswerBoundaries, setShowErrorAnswerBoundaries] =
    useState<boolean>(false);
  const [isInitialized, setIsInitialized] = useState<boolean>(false);
  const [answers, setAnswers] = useState<[string, boolean, number][]>([]);
  const { data, error, isLoading } = useAnswersExercises(listItem.id);
  useEffect(() => {
    if (!isInitialized) return;
    sendAnswers(answers);
    console.log(answers);
  }, [answers]);

  useEffect(() => {
    if (!data || isInitialized) return;
    setArray(Array.from({ length: data.length }, (_, index) => index + 1));
    const initializingAnswers: [string, boolean, number][] = [];
    data.forEach((answerItem) => {
      initializingAnswers.push([
        answerItem.answer,
        answerItem.is_correct,
        answerItem.id,
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
              if (array.length <= 2) {
                setShowErrorAnswerBoundaries(true);
                return;
              }
              const newArray = [...array];
              newArray.pop();
              setArray(newArray);
              const newAnswers = [...answers];
              newAnswers.pop();
              setAnswers(newAnswers);
              setShowErrorAnswerBoundaries(false);
              //console.log(answers);
            }}
          />
          <IconButton
            icon="plus"
            onPress={() => {
              if (array.length >= 6) {
                setShowErrorAnswerBoundaries(true);
                return;
              }
              const newArray = [...array, array.length + 1];
              setArray(newArray);
              answers.push(["", false, undefined]);
              setShowErrorAnswerBoundaries(false);
              //console.log(answers);
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
    </>
  );
}
