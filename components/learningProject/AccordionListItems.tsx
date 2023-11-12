import { isNull, max, set } from "cypress/types/lodash";
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
import EditFlashcard from "./EditFlashcard";
import EditExercise from "./EditExercise";
import { ManagementType } from "../../types/common";
import { useEffect, useState } from "react";
import LoadingOverlay from "../alerts/LoadingOverlay";
import {
  useExercises,
  useFlashcards,
  useUpsertAnswersExercise,
  useUpsertExercise,
} from "../../utils/hooks";

export default function AccordionListItems({
  type,
  setId,
}: {
  type: ManagementType;
  [name: string]: any;
}) {
  const theme = useTheme();
  const { isMutating, trigger: upsertExercise } = useUpsertExercise();
  const { isMutating: isMutating2, trigger: upsertAnswersExercise } =
    useUpsertAnswersExercise();
  const [question, setQuestion] = useState<string>("");
  const [answers, setAnswers] = useState<[string, boolean, number][]>([
    ["", false, 0],
    ["", false, 0],
    ["", false, 0],
    ["", false, 0],
  ]);
  const [priority, setPriority] = useState<number>(0);
  useUpsertAnswersExercise();
  const updateExercise = (listItem, answers, question, priority, setId) => {
    upsertExercise({
      //@ts-expect-error
      id: listItem.id,
      question: question,
      priority: priority,
      set_id: setId,
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
  const { data, isLoading, error } =
    type === ManagementType.FLASHCARD
      ? useFlashcards(setId)
      : useExercises(setId);
  //doesn't update if new sets are added to the project, useEffect counterproductive? How to fix? through a listener?
  useEffect(() => {
    if (!data) return;
    setContent(data);
  }, [data]);
  const [content, setContent] = useState([]);
  const [expanded, setExpanded] = useState(false);
  const getData = (question, answers, priority) => {
    setQuestion(question);
    setAnswers(answers);
    setPriority(priority);
    console.log("AccordionListItems:" + answers);
    console.log("AccordionListItems:" + question);
  };
  if (error) return <LoadingOverlay visible={isLoading} />;
  return content.map((listItem) => (
    <View key={listItem.id}>
      <List.Accordion
        title={listItem.question}
        titleNumberOfLines={4}
        style={{
          width: responsiveWidth(100),
          backgroundColor: theme.colors.secondaryContainer,
        }}
        onPress={() => {
          if (expanded === true) {
            console.log("accordion closed");
            updateExercise(
              listItem,
              answers,
              question,
              priority,
              listItem.set_id,
            );
          }
          setExpanded(!expanded);
        }}
      >
        {
          type === ManagementType.FLASHCARD && (
            <EditFlashcard listItem={listItem} />
          ) //if type === flashcard then render <EditFlashcard/> component
        }
        {
          type === ManagementType.EXERCISE && (
            <EditExercise listItem={listItem} sendDataToParent={getData} />
          ) //if type === exercise then render <EditExercise/> component
        }
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
