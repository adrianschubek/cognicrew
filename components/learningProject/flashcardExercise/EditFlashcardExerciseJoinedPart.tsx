import { useCallback, useEffect, useState } from "react";
import { View } from "react-native";
import {
  Card,
  Text,
  TextInput,
  IconButton,
  HelperText,
  useTheme,
  Icon,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import PrioritySelector from "./PrioritySelector";
import { checkForLineBreak, debounce } from "../../../utils/common";
import { ManagementType } from "../../../types/common";
import EditFlashcard from "./EditFlashcard";
import EditExercise from "./EditExercise";
import {
  useDeleteExercise,
  useDeleteFlashcard,
  useUpsertAnswersExercise,
  useUpsertExercise,
  useUpsertFlashcard,
} from "../../../utils/hooks";
import { supabase } from "../../../supabase";
import { useAlerts } from "react-native-paper-fastalerts";
import LivePresenceFunctionality from "./LivePresenceFunctionality";
import { usePresenceStore } from "../../../stores/PresenceStore";
import { useShallow } from "zustand/react/shallow";
import { useFocusEffect } from "@react-navigation/native";

export default function EditFlashcardExerciseJoinedPart(props: {
  listItem: {
    id: number;
    question: string;
    priority: number;
    set_id: number;
    created_at: string;
  };
  type: ManagementType;
}) {
  const { listItem, type } = props;
  const theme = useTheme();
  const alerts = useAlerts();
  const [showErrorUpload, setShowErrorUpload] = useState<boolean>(false);
  const [errorText, setErrorText] = useState<string>("");
  const [priority, setPriority] = useState<number>(listItem.priority);
  const [answerOrAnswers, setAnswerOrAnswers] = useState(null);
  const [initialAnswersLength, setInitialAnswersLength] = useState<number>();
  const [question, setQuestion] = useState<string>(listItem.question as string);
  const [isInitialized, setIsInitialized] = useState<boolean>(false);
  const [updateCache, setUpdateCache] = useState<boolean>(false);

  //DELETION AND UPSERTING
  //Exercise hooks
  const { trigger: upsertExercise } = useUpsertExercise();
  const { trigger: deleteExercise } = useDeleteExercise();
  const { trigger: upsertAnswersExercise } = useUpsertAnswersExercise();
  //exercise specific
  async function deleteAnswers(initialLength: number, answersLength: number) {
    const numberOfAnswersToDelete = initialLength - answersLength;
    if (numberOfAnswersToDelete <= 0) return;
    const initialLenghtArray = Array.from(
      { length: initialLength },
      (_, index) => index + 1,
    );
    const deletionArray = initialLenghtArray
      .slice(-numberOfAnswersToDelete)
      .map((orderPosition) => {
        return {
          exercise: listItem.id as number,
          order_position: orderPosition,
        };
      });
    //console.log("numberOfAnswersToDelete: ", numberOfAnswersToDelete);
    let { data, error } = await supabase.rpc("delete_answers_exercise", {
      answers: deletionArray,
    });
    console.log("error: ", error);
    return data;
  }
  //Flashcard hooks
  const { trigger: upsertFlashcard } = useUpsertFlashcard();
  const { trigger: deleteFlashcard } = useDeleteFlashcard();
  const updateFlashcardOrExercise = (
    question: string,
    answerOrAnswers: any,
    priority: number,
    initialLength: number,
    updateCache: boolean,
  ) => {
    type === ManagementType.EXERCISE
      ? (setInitialAnswersLength(answerOrAnswers.length),
        setUpdateCache(!updateCache),
        upsertExercise({
          //@ts-expect-error
          id: listItem.id,
          question: question,
          priority: priority,
          set_id: listItem.set_id,
        }).then((res) => {
          //answers need to be updated
          deleteAnswers(initialLength, answerOrAnswers.length);
          answerOrAnswers.forEach((e) => {
            upsertAnswersExercise({
              //@ts-expect-error
              answer: e[0],
              exercise: res[0].id,
              is_correct: e[1],
              order_position: e[2],
            });
          });
        }))
      : upsertFlashcard({
          //@ts-expect-error
          id: listItem.id,
          question: question,
          answer: answerOrAnswers, //update answer
          priority: priority,
          set_id: listItem.set_id,
        });
  };
  const deleteFlashcardOrExercise = () => {
    type === ManagementType.EXERCISE
      ? deleteExercise({ id: listItem.id })
      : deleteFlashcard({ id: listItem.id });
  };
  const update = (
    question,
    answerOrAnswers,
    priority,
    initalLength,
    updateCache,
  ) => {
    checkForError(
      () => {
        updateFlashcardOrExercise(
          question,
          answerOrAnswers,
          priority,
          initalLength,
          updateCache,
        );
        resetCard();
      },
      question,
      answerOrAnswers,
    );
  };

  function checkForError(
    functionToCheck: () => any,
    question,
    answerOrAnswers,
  ) {
    const questionExists = question !== "";
    const validAnswerExists =
      type === ManagementType.EXERCISE
        ? answerOrAnswers.some((e) => e[0] && e[1])
        : answerOrAnswers !== "";
    const atLeastTwoAnswersExist =
      type === ManagementType.EXERCISE
        ? answerOrAnswers.filter((e) => e[0] !== "").length >= 2
        : true;
    if (validAnswerExists && questionExists && atLeastTwoAnswersExist) {
      functionToCheck();
    } else {
      let errorText = "";
      !questionExists &&
        (errorText += checkForLineBreak(errorText, "Question needs to exist"));
      !validAnswerExists &&
        (errorText += checkForLineBreak(
          errorText,
          type === ManagementType.EXERCISE
            ? "At least one correct answer needs to exist"
            : "Answer needs to exist",
        ));
      !atLeastTwoAnswersExist &&
        (errorText += checkForLineBreak(
          errorText,
          "There need to be at least two answers",
        ));
      setErrorText(errorText);
      setShowErrorUpload(true);
    }
  }
  function resetCard() {
    setErrorText("");
    setShowErrorUpload(false);
  }
  const updateDebounceApplied = debounce(
    (question, answerOrAnswers, priority, initialLength, updateCache) => {
      update(question, answerOrAnswers, priority, initialLength, updateCache);
    },
    500,
  );
  const debouncedUpdate = useCallback(updateDebounceApplied, []);
  useEffect(() => {
    if (!isInitialized) return;
    if (updateDisabled) {
      setUpdateDisabled(false);
      return;
    }
    debouncedUpdate(
      question,
      answerOrAnswers,
      priority,
      initialAnswersLength,
      updateCache,
    );
  }, [question, answerOrAnswers, priority, debouncedUpdate]);
  useEffect(() => {
    if (!answerOrAnswers) return;
    setIsInitialized(true);
  }, [answerOrAnswers, priority, question]);
  //END DELETION AND UPSERTING

  //LIVE EDITING RERENDERING
  const [isEditing, setIsEditing] = useState<boolean>(false);
  const [refetchedPrio, setRefetchedPrio] = useState<number>(null);
  const [updateDisabled, setUpdateDisabled] = useState<boolean>(false);
  const [liveEditByEmptied, setLiveEditByEmptied] = useState<boolean>(false);
  const [initialLiveEditBy, setInitialLiveEditBy] = useState<string[]>([]);
  const [liveEditByInitialized, setLiveEditByInitialized] =
    useState<boolean>(false);
  const [someoneAlreadyEditing, setSomeoneAlreadyEditing] =
    useState<boolean>(null);
  const liveEditBy = usePresenceStore(
    useShallow((state) => state.cardQuizEditing[listItem.id]),
  );
  const [prevLiveEditByLength, setPrevLiveEditByLength] = useState(
    liveEditBy?.length,
  );
  useEffect(() => {
    if (!liveEditBy) return;
    if (
      liveEditBy.length < prevLiveEditByLength &&
      prevLiveEditByLength === 1 //the last one gets the actual edit
    ) {
      //console.log("EMPTIED: ", true);
      setLiveEditByEmptied(true);
      setInitialLiveEditBy([]);
    }
    setPrevLiveEditByLength(liveEditBy.length);
  }, [liveEditBy?.length]);
  useEffect(() => {
    if (!liveEditByEmptied || !liveEditBy) return;
    setRefetchedPrio(listItem.priority);
    setUpdateDisabled(true);
    setLiveEditByEmptied(false);
  }, [listItem.priority, liveEditByEmptied]);
  useEffect(() => {
    if (!liveEditByEmptied || !liveEditBy) return;
    setQuestion(listItem.question);
    setUpdateDisabled(true);
    setLiveEditByEmptied(false);
  }, [listItem.question, liveEditByEmptied]);

  useFocusEffect(
    useCallback(() => {
      if (!liveEditBy || liveEditByInitialized) return;
      setInitialLiveEditBy(liveEditBy);
      setSomeoneAlreadyEditing(liveEditBy.length > 0);
      setIsEditing(true);
      setLiveEditByInitialized(true);
      return () => {
        setInitialLiveEditBy([]);
      };
    }, [liveEditBy]),
  );
  useEffect(() => {
    //console.log("liveEditBy: ", liveEditBy);
    if (!liveEditBy || initialLiveEditBy.length === 0) return;
    setSomeoneAlreadyEditing(
      initialLiveEditBy.length > 0 &&
        initialLiveEditBy.some((item) => liveEditBy.includes(item)),
    );
  }, [liveEditBy]);
  return (
    <>
      <Card
        elevation={1}
        style={[
          {
            width: responsiveWidth(100) - responsiveHeight(2),
            marginTop: 8,
            marginBottom: 8,
            alignSelf: "center",
          },
          initialLiveEditBy.length > 0 && {
            backgroundColor: theme.colors.primaryContainer,
            borderColor: theme.colors.primary,
            borderWidth: 2,
          },
        ]}
      >
        <Card.Title
          title="Edit question"
          titleStyle={{
            color: theme.colors.primary,
          }}
          right={() => (
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
                sendPriority={(val) => {
                  setPriority(val);
                }}
                refetchedPrio={refetchedPrio}
              />
              <IconButton
                testID="delete-flashcard-button"
                icon="delete"
                onPress={() => {
                  alerts.confirm({
                    icon: "delete",
                    message: "Are you sure you want to delete this question?",
                    okText: "Delete",
                    okAction(values) {
                      deleteFlashcardOrExercise();
                    },
                  });
                }}
                style={{ alignSelf: "center" }}
              />
            </View>
          )}
        />
        {liveEditBy?.length > 0 && someoneAlreadyEditing !== null && (
          <View
            style={{
              gap: 4,
              paddingVertical: 4,
              flexDirection: "row",
              alignSelf: "center",
              justifyContent: "center",
              width: "100%",
              alignItems: "center",
              marginBottom: 8,
              backgroundColor: someoneAlreadyEditing
                ? theme.colors.onPrimaryContainer
                : theme.colors.errorContainer,
            }}
          >
            {!someoneAlreadyEditing && (
              <Icon color={theme.colors.error} source={"alert"} size={14} />
            )}
            <Text
              variant="bodySmall"
              style={{
                textAlign: "center",
                color: someoneAlreadyEditing
                  ? theme.colors.onPrimary
                  : theme.colors.error,
              }}
            >
              {liveEditBy?.length === 1
                ? `${liveEditBy[0]} is`
                : "Multiple people are"}{" "}
              {someoneAlreadyEditing
                ? "already editing"
                : "also starting to edit"}{" "}
              this question{" "}
            </Text>
            <Icon
              color={
                someoneAlreadyEditing
                  ? theme.colors.onPrimary
                  : theme.colors.error
              }
              source={"account-multiple"}
              size={14}
            />
          </View>
        )}
        <Card.Content>
          <LivePresenceFunctionality
            isInitialized={isInitialized}
            listItemId={listItem.id}
            isEditing={isEditing}
          />
          <TextInput
            testID="input-edit-flashcard-question"
            style={{ marginBottom: 8 }}
            multiline={true}
            label="Question"
            value={question}
            onChangeText={(question) => {
              setQuestion(question);
            }}
          />
          {type === ManagementType.EXERCISE ? (
            <EditExercise
              listItem={listItem}
              sendAnswers={(val) => setAnswerOrAnswers(val)}
              sendInitialAnswersLength={(num) => setInitialAnswersLength(num)}
              updateCacheTrigger={updateCache}
              liveEditByEmptied={liveEditByEmptied}
              onUpdate={() => {
                setLiveEditByEmptied(false);
                setUpdateDisabled(true);
              }}
            />
          ) : (
            <EditFlashcard
              listItem={listItem}
              sendAnswer={(val) => setAnswerOrAnswers(val)}
              liveEditByEmptied={liveEditByEmptied}
              onUpdate={() => {
                setLiveEditByEmptied(false);
              }}
            />
          )}
          {showErrorUpload && errorText !== "" && (
            <HelperText
              style={{ paddingHorizontal: 0 }}
              type="error"
              visible={showErrorUpload}
            >
              {errorText}
            </HelperText>
          )}
        </Card.Content>
      </Card>
    </>
  );
}
