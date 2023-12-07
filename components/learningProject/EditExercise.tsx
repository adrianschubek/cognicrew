import { useEffect, useState } from "react";
import TextInputWithCheckbox from "../common/TextInputWithCheckbox";
import { useAnswersExercises } from "../../utils/hooks";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { HelperText, IconButton, Text } from "react-native-paper";
import { View } from "react-native";
import { supabase } from "../../supabase";

export default function EditExercise(props: {
  listItem: any;
  sendAnswers: (answers: [string, boolean, number][]) => any;
  sendInitialAnswers: (answers: [string, boolean, number][]) => any;
}) {
  const { listItem, sendAnswers, sendInitialAnswers } = props;
  const [showErrorAnswerBoundaries, setShowErrorAnswerBoundaries] =
    useState<boolean>(false);
  const [isInitialized, setIsInitialized] = useState<boolean>(false);
  const [oldData, setOldData] = useState<any>(null);
  const [answers, setAnswers] = useState<[string, boolean, number][]>([]);
  const { data, error, isLoading, mutate } = useAnswersExercises(listItem.id);
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
    setOldData(data);
    sendInitialAnswers(initializingAnswers);
    setIsInitialized(true);
  }, [data]);
  useEffect(() => {
    const realtimeAnswers = supabase
      .channel("answers_exercises_all")
      .on(
        "postgres_changes",
        { event: "*", schema: "public", table: "answers_exercises" },
        (payload) => {
          if (
            (payload.new[0] && (payload.new[0].exercise as number)) ===
              (listItem.id as number) ||
            (payload.old[0] && (payload.old[0].exercise as number)) ===
              (listItem.id as number)
          )
            mutate();
        },
      )
      .subscribe();
  }, []);
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
              const updatedData = {
                ...oldData,
                data: newAnswers.map((e) => {
                  return {
                    answer: e[0],
                    is_correct: e[1],
                    order_position: e[2],
                    exercise: listItem.id,
                  };
                }),
              };
              mutate(updatedData, false);
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
