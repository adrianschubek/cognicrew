import * as React from "react";
import { View } from "react-native";
import { List, Divider, useTheme, HelperText } from "react-native-paper";
import { responsiveWidth } from "react-native-responsive-dimensions";
import { ManagementType, orderByPrinciple } from "../../../types/common";
import { useEffect, useRef, useState } from "react";
import LoadingOverlay from "../../alerts/LoadingOverlay";
import { useExercises, useFlashcards } from "../../../utils/hooks";
import { supabase } from "../../../supabase";
import { sortByOrder } from "../../../utils/common";
import EditFlashcardExerciseJoinedPart from "./EditFlashcardExerciseJoinedPart";
import { usePresenceStore } from "../../../stores/PresenceStore";
import { useShallow } from "zustand/react/shallow";

export default function AccordionListItems(props: {
  type: ManagementType;
  setId;
  orderSetItemsBy: orderByPrinciple;
  [name: string]: any;
}) {
  const { type, setId, orderSetItemsBy } = props;
  const theme = useTheme();
  const [mutationSignal, setMutationSignal] = useState<boolean>(false);
  const [content, setContent] = useState([]);
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
          mutate().then(() => {
            setMutationSignal((prevMutationSignal) => !prevMutationSignal);
          });
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
          {
            <EditFlashcardExerciseJoinedPartWrapper
              listItem={listItem}
              mutationSignal={mutationSignal}
              type={type}
            />
          }
        </List.Accordion>
        <Divider />
      </View>
    ))
  );
}

function EditFlashcardExerciseJoinedPartWrapper(props: {
  listItem;
  type: ManagementType;
  mutationSignal: boolean;
}) {
  const { listItem, type, mutationSignal } = props;
  const liveEditBy =
    usePresenceStore(
      useShallow((state) => state.cardQuizEditing[listItem.id]),
    ) ?? [];
  const [key, setKey] = useState<number>(listItem.id);
  const [liveEditByEmptied, setLiveEditByEmptied] = useState<boolean>(false);
  const [prevLiveEditByLength, setPrevLiveEditByLength] = useState(
    liveEditBy.length,
  );
  console.log(mutationSignal, "mutationSignal");
  useEffect(() => {
    //console.log("liveEditBy: ", liveEditBy);
    if (
      liveEditBy.length < prevLiveEditByLength &&
      prevLiveEditByLength === 1 //the last one gets the actual edit
    ) {
      console.log("EMPTIED: ", true);
      setLiveEditByEmptied(true);
    }
    setPrevLiveEditByLength(liveEditBy.length);
  }, [liveEditBy.length]);
  useEffect(() => {
    console.log("liveEditByEmptied: ", liveEditByEmptied);
    if (liveEditByEmptied) {
      setKey(Date.now());
      setLiveEditByEmptied(false);
    }
  }, [mutationSignal]);

  return (
    <EditFlashcardExerciseJoinedPart
      key={key}
      listItem={listItem}
      type={type}
      liveEditBy={liveEditBy}
    />
  );
}
