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
import { set } from "cypress/types/lodash";

export default function AccordionListItems(props: {
  type: ManagementType;
  setId;
  orderSetItemsBy: orderByPrinciple;
  [name: string]: any;
}) {
  const { type, setId, orderSetItemsBy } = props;
  const theme = useTheme();
  const [mutated, setMutated] = useState<boolean>(false);
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
    if (!mutated || !content) return;
    setMutationSignal(true);
    setMutated(false);
  }, [mutated, content]);
  useEffect(() => {
    const realtimeFlashcardsOrExercises = supabase
      .channel("flashcards_or_exercises_all")
      .on(
        "postgres_changes",
        {
          event: "*",
          schema: "public",
          table:
            type === ManagementType.FLASHCARD
              ? "flashcards"
              : "answers_exercises",
        },
        (payload) => {
          //console.log("realtimeFlashcardsOrExercises: ", payload);
          mutate().then(() => {
            setMutated(true);
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
              resetMutationSignal={() => setMutationSignal(false)}
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
  resetMutationSignal: () => void;
}) {
  const { listItem, type, mutationSignal, resetMutationSignal } = props;
  const liveEditBy =
    usePresenceStore(
      useShallow((state) => state.cardQuizEditing[listItem.id]),
    ) ?? [];
  const [key, setKey] = useState<number>(listItem.id);
  const [liveEditByEmptied, setLiveEditByEmptied] = useState<boolean>(false);
  const [mutationHappened, setMutationHappened] = useState<boolean>(false);
  const [prevLiveEditByLength, setPrevLiveEditByLength] = useState(
    liveEditBy.length,
  );

  useEffect(() => {
    console.log("liveEditBy: ", liveEditBy);
    if (
      liveEditBy.length < prevLiveEditByLength &&
      prevLiveEditByLength === 1 //the last one gets the actual edit
    ) {
      //console.log("EMPTIED: ", true);
      setLiveEditByEmptied(true);
    }
    setPrevLiveEditByLength(liveEditBy.length);
  }, [liveEditBy.length]);
  useEffect(() => {
    if (mutationSignal) {
      //console.log("MUTATION HAPPENED: ", mutationSignal);
      setMutationHappened(true);
      resetMutationSignal();
    }
  }, [mutationSignal]);
  useEffect(() => {
    //console.log("1", liveEditByEmptied);
    //console.log("2", mutationHappened);
    if (!liveEditByEmptied || !mutationHappened) return;
    setKey(Date.now());
    console.log("liveEditByEmptied: ", liveEditByEmptied);
    console.log("mutationHappened: ", mutationHappened);
    setLiveEditByEmptied(false);
    setMutationHappened(false);
  }, [liveEditByEmptied, mutationHappened]);
  return (
    <EditFlashcardExerciseJoinedPart
      key={key}
      listItem={listItem}
      type={type}
      liveEditBy={liveEditBy}
    />
  );
}
