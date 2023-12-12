import { useEffect, useState } from "react";
import TextInputWithCheckbox from "../common/TextInputWithCheckbox";
import { useAnswersExercises } from "../../utils/hooks";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { HelperText, IconButton, Text, useTheme } from "react-native-paper";
import { View } from "react-native";
import { supabase } from "../../supabase";
import { useCacheUpdateStore } from "../../stores/CacheUpdateStore";
import { isEqual } from "lodash";

export default function EditExercise(props: {
  listItem: any;
  sendAnswers: (answers: [string, boolean, number][]) => any;
  sendInitialAnswersLength: (InitialAnswersLength: number) => any;
}) {
  const { listItem, sendAnswers, sendInitialAnswersLength } = props;
  const [showErrorAnswerBoundaries, setShowErrorAnswerBoundaries] =
    useState<boolean>(false);
  const [isInitialized, setIsInitialized] = useState<boolean>(false);
  const [oldData, setOldData] = useState<any>(null);
  const [answers, setAnswers] = useState<[string, boolean, number][]>([]);
  const { data, error, isLoading, mutate } = useAnswersExercises(listItem.id);
  const [showAnswerDeletionOptions, setShowAnswerDeletionOptions] =
    useState<boolean>(false);
  const theme = useTheme();

  useEffect(() => {
    if (!isInitialized) return;
    //console.log("answers: ", answers);
  }, [answers]);

  useEffect(() => {
    if (!data) return;
    const initializingAnswers: [string, boolean, number][] = [];
    data.forEach((answerItem) => {
      initializingAnswers.push([
        answerItem.answer,
        answerItem.is_correct,
        answerItem.order_position,
      ]);
    });
    if (!isInitialized) {
      setAnswers(initializingAnswers);
      sendAnswers(initializingAnswers);
      sendInitialAnswersLength(initializingAnswers.length);
    } else {
      replaceInitialElements(answers, initializingAnswers);
    }
    setOldData(data);
    setIsInitialized(true);
  }, [data]);
  useEffect(() => {
    const realtimeAnswers = supabase
      .channel("answers_exercises_all")
      .on(
        "postgres_changes",
        { event: "*", schema: "public", table: "answers_exercises" },
        (payload) => {
          //console.log("realtimeAnswers: ", payload);
          mutate();
        },
      )
      .subscribe();
  }, []);
  async function updateCache(newAnswers: [string, boolean, number][]) {
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

    await mutate(updatedData, false);
  }
  function replaceInitialElements(
    array: [string, boolean, number][],
    replacementArray: [string, boolean, number][],
  ) {
    const remainingAnswers = array.slice(replacementArray.length);
    return [...replacementArray, ...remainingAnswers];
  }
  function getAnswer(number: number) {
    return ([text, checked]: [string, boolean]) => {
      let newAnswers = [...answers];
      newAnswers[number - 1] = [text, checked, answers[number - 1][2]];
      setAnswers(newAnswers);
      sendfilteredAnswers(newAnswers);
    };
  }
  function sendfilteredAnswers(answers: [string, boolean, number][]) {
    //console.log("answers: ", answers);
    const filteredAnswers = answers
      .filter((e) => e[0] !== "")
      .map((e, index) => {
        return [e[0], e[1], e[2]];
      }) as [string, boolean, number][];
    if (
      filteredAnswers.length >= 2 &&
      filteredAnswers.filter((e) => e[1] === true).length > 0
    ) {
      sendAnswers(filteredAnswers);
      updateCache(filteredAnswers);
    }
  }
  if (error || isLoading) return <LoadingOverlay visible={isLoading} />;
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
          <IconButton
            icon={showAnswerDeletionOptions ? "check" : "minus"}
            onPress={() => {
              setShowAnswerDeletionOptions(!showAnswerDeletionOptions);
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
          <View
            key={index}
            style={{ flexDirection: "row", alignItems: "center" }}
          >
            <TextInputWithCheckbox
              listItemAnswer={e}
              sendAnswer={getAnswer(index + 1)}
              number={index + 1}
              flex={1}
            />
            {showAnswerDeletionOptions && (
              <IconButton
                icon="close"
                onPress={() => {
                  if (answers.length <= 2) {
                    setShowErrorAnswerBoundaries(true);
                    return;
                  }
                  const newAnswers = [...answers]
                    .filter((e) => e[2] !== index + 1)
                    .map((e, index) => {
                      return [e[0], e[1], index + 1];
                    }) as [string, boolean, number][];
                  //console.log("when Minus pressed: ", newAnswers);
                  setAnswers(newAnswers);
                  sendfilteredAnswers(newAnswers);
                  setShowErrorAnswerBoundaries(false);
                }}
              />
            )}
          </View>
        );
      })}
    </>
  );
}
