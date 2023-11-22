import * as React from "react";
import { StyleSheet, View } from "react-native";
import { List, Divider, useTheme } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import EditFlashcard from "./EditFlashcard";
import EditExercise from "./EditExercise";
import { ManagementType, orderByPrinciple } from "../../types/common";
import { useEffect, useState } from "react";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { useExercises, useFlashcards } from "../../utils/hooks";
import { supabase } from "../../supabase";
import { sortByOrder } from "../../utils/common";

export default function AccordionListItems(props: {
  type: ManagementType;
  setId;
  orderSetItemsBy: orderByPrinciple;
  [name: string]: any;
}) {
  const theme = useTheme();
  const { data, isLoading, error, mutate } =
    props.type === ManagementType.FLASHCARD
      ? useFlashcards(props.setId)
      : useExercises(props.setId);

  useEffect(() => {
    if (!data) return;
    setContent(data);
  }, [data]);

  useEffect(() => {
    const realtimeFlashcardsOrExercises = supabase
      .channel("flashcards_or_exercises_all")
      .on(
        "postgres_changes",
        {
          event: "*",
          schema: "public",
          table: props.type === ManagementType.FLASHCARD ? "flashcards" : "exercises",
        },
        (payload) => {
          console.log("Change received!", payload);
          mutate();
        },
      )
      .subscribe();
  }, []);
  const [content, setContent] = useState([]);
  const orderedContent= sortByOrder(content, props.orderSetItemsBy);
  if (error) return <LoadingOverlay visible={isLoading} />;
  return orderedContent.map((listItem) => (
    <View key={listItem.id}>
      <List.Accordion
        title={listItem.question}
        titleNumberOfLines={4}
        style={{
          width: responsiveWidth(100),
          backgroundColor: theme.colors.secondaryContainer,
        }}
      >
        {
          props.type === ManagementType.FLASHCARD && (
            <EditFlashcard listItem={listItem} />
          ) //if type === flashcard then render <EditFlashcard/> component
        }
        {
          props.type === ManagementType.EXERCISE && (
            <EditExercise listItem={listItem} />
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
