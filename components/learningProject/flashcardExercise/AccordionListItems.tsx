import * as React from "react";
import { View } from "react-native";
import { List, Divider, useTheme, HelperText } from "react-native-paper";
import { responsiveWidth } from "react-native-responsive-dimensions";
import { ManagementType, orderByPrinciple } from "../../../types/common";
import { useEffect, useState } from "react";
import LoadingOverlay from "../../alerts/LoadingOverlay";
import { useExercises, useFlashcards } from "../../../utils/hooks";
import { supabase } from "../../../supabase";
import { sortByOrder } from "../../../utils/common";
import EditFlashcardExerciseJoinedPart from "./EditFlashcardExerciseJoinedPart";

export default function AccordionListItems(props: {
  type: ManagementType;
  setId;
  orderSetItemsBy: orderByPrinciple;
  [name: string]: any;
}) {
  const { type, setId, orderSetItemsBy } = props;
  const theme = useTheme();
  const [content, setContent] = useState<
    | {
        id: number;
        question: string;
        priority: number;
        set_id: number;
        created_at: string;
      }[]
    | {
        id: number;
        question: string;
        answer: string;
        priority: number;
        set_id: number;
        created_at: string;
      }[]
  >([]);
  const orderedContent = sortByOrder(content, orderSetItemsBy);
  const [noSetItemsAvailable, setNoSetItemsAvailable] =
    useState<boolean>(false);
  const typeName = (plural: boolean) =>
    (type === ManagementType.FLASHCARD ? "cognicard" : "cogniquiz") +
    (plural ? (type === ManagementType.FLASHCARD ? "s" : "zes") : "");

  const { data, isLoading, error, mutate } =
    type === ManagementType.FLASHCARD
      ? useFlashcards(setId)
      : useExercises(setId);

  useEffect(() => {
    if (!data) return;
    setContent(data);
    setNoSetItemsAvailable(data.length === 0);
  }, [data]);

  useEffect(() => {
    const realtimeFlashcardsOrExercises = supabase
      .channel("flashcards_or_exercises_all")
      .on(
        "postgres_changes",
        {
          event: "*",
          schema: "public",
          table: type === ManagementType.FLASHCARD ? "flashcards" : "exercises",
        },
        (payload) => {
          //console.log("realtimeFlashcardsOrExercises: ", payload);
          mutate();
        },
      )
      .subscribe();
  }, []);
  if (error) return <LoadingOverlay visible={isLoading} />;
  return noSetItemsAvailable ? (
    <HelperText
      testID="empty-set-text"
      type="info"
      style={{ backgroundColor: theme.colors.secondaryContainer }}
    >
      There are no {typeName(true)} in this set. Add some via the button on the
      bottom right
    </HelperText>
  ) : (
    orderedContent.map((listItem) => (
      <View key={listItem.id}>
        <List.Accordion
          testID="flashcard-list-button"
          title={listItem.question}
          titleNumberOfLines={4}
          style={{
            width: responsiveWidth(100),
            backgroundColor: theme.colors.secondaryContainer,
          }}
        >
          {<EditFlashcardExerciseJoinedPart listItem={listItem} type={type} />}
        </List.Accordion>
        <Divider />
      </View>
    ))
  );
}
