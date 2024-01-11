import { Fragment, useCallback, useEffect, useRef, useState } from "react";
import { StyleSheet, View } from "react-native";
import {
  Card,
  Text,
  TextInput,
  IconButton,
  HelperText, useTheme,
  Icon
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import PrioritySelector from "./PrioritySelector";
import { checkForLineBreak, debounce } from "../../utils/common";
import { ManagementType } from "../../types/common";
import EditFlashcard from "./EditFlashcard";
import EditExercise from "./EditExercise";
import {
  useDeleteAnswersExercise,
  useDeleteExercise,
  useDeleteFlashcard,
  useUpsertAnswersExercise,
  useUpsertExercise,
  useUpsertFlashcard,
  useUsername,
} from "../../utils/hooks";
import { supabase } from "../../supabase";
import { useAlerts } from "react-native-paper-fastalerts";
import { useAuth } from "../../providers/AuthProvider";
import { usePresenceStore } from "../../stores/PresenceStore";
import { useShallow } from "zustand/react/shallow";

export default function EditFlashcardExerciseJoinedPart(props: {
  listItem: any;
  type: ManagementType;
}) {
  const { listItem, type } = props;
  const alerts = useAlerts();
  const [showErrorUpload, setShowErrorUpload] = useState<boolean>(false);
  const [errorText, setErrorText] = useState<string>("");
  const [priority, setPriority] = useState<number>(listItem.priority);
  const [answerOrAnswers, setAnswerOrAnswers] = useState(null);
  const [initialAnswersLength, setInitialAnswersLength] = useState<number>();
  const [question, setQuestion] = useState<string>(listItem.question as string);
  const [isInitialized, setIsInitialized] = useState<boolean>(false);
  const [updateCache, setUpdateCache] = useState<boolean>(false);
  //Exercise hooks
  const { trigger: upsertExercise } = useUpsertExercise();
  const { trigger: deleteExercise } = useDeleteExercise();
  const { trigger: upsertAnswersExercise } = useUpsertAnswersExercise();
  const { trigger: deleteAnswersExercise } = useDeleteAnswersExercise();
  //exercise specific
  async function deleteAnswers(
    initialLength: number,
    answers: [string, boolean, number][],
  ) {
    const numberOfAnswersToDelete = initialLength - answers.length;
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
    /* for (const e of deletionArray) {
      await deleteAnswersExercise({
        exercise: e.exercise,
        order_position: e.order_position,
      });
    }*/
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
          //console.log("initialAnswersLength: ", initialLength);
          //console.log("answerOrAnswers ", answerOrAnswers);
          deleteAnswers(initialLength, answerOrAnswers);
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
    // Call the debounced function
    if (isInitialized) {
      debouncedUpdate(
        question,
        answerOrAnswers,
        priority,
        initialAnswersLength,
        updateCache,
      );
    }
  }, [question, answerOrAnswers, priority, debouncedUpdate]);
  useEffect(() => {
    if (!answerOrAnswers) return;
    setIsInitialized(true);
  }, [answerOrAnswers, priority, question]);

  const theme = useTheme();
  const { user } = useAuth();
  const username = useUsername();

  const updateEditedBy = usePresenceStore(
    (state) => state.updateCardQuizEditing,
  );

  const realtime = useRef(
    supabase.channel(`cardquiz:edit:${listItem.id}`, {
      config: { presence: { key: user.id } },
    }),
  );

  useEffect(() => {
    realtime.current
      .on("presence", { event: "sync" }, () => {
        const newState = realtime.current.presenceState();
        // console.log(
        //   `sync cardquiz:edit:${listItem.id}`,
        //   newState,
        //   Object.values(newState).flatMap((e: any) => e[0].user_name),
        // );
        updateEditedBy(
          listItem.id,
          Object.values(newState)
            // @ts-expect-error user_name not defined
            .filter((u) => u[0].user_name !== username.data)
            .flatMap((e: any) => e[0].user_name as string),
        );
      })
      .subscribe();
  }, []);

  const startEditing = async () => {
    const presenceTrackStatus = await realtime.current.track({
      user_name: username.data,
    });
    // console.log(presenceTrackStatus);
  };

  const endEditing = async () => {
    const presenceTrackStatus = await realtime.current.untrack();
    // console.log(presenceTrackStatus);
  };

  const liveEditBy =
    usePresenceStore(
      useShallow((state) => state.cardQuizEditing[props.listItem.id]),
    ) ?? [];
  // console.log("liveEditBy: ", liveEditBy);

  return (
    <Card
      elevation={1}
      style={[
        styles.cardStyle,
        liveEditBy.length > 0 && {
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
          <Fragment>
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
                setPriority={(val) => {
                  setPriority(val);
                }}
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
          </Fragment>
        )}
      />
      <Card.Content>
        {liveEditBy.length > 0 && (
          <Text
            style={{
              width: "auto",
              textAlign: "center",
              verticalAlign: "middle",
              paddingVertical: 4,
              marginBottom: 8,
              marginLeft: -16,
              marginRight: -16,
              color: theme.colors.onPrimary,
              backgroundColor: theme.colors.onPrimaryContainer,
            }}
          >
            {liveEditBy.length === 1
              ? `${liveEditBy[0]} is`
              : liveEditBy.length === 2
              ? `${liveEditBy[0]} and ${liveEditBy[1]} are`
              : "Multiple people are"}{" "}
            editing this question{" "}
            <Icon
              color={theme.colors.onPrimary}
              source={"account-multiple"}
              size={16}
            ></Icon>
          </Text>
        )}
        <TextInput
          testID="input-edit-flashcard-question"
          style={{ marginBottom: 8 }}
          multiline={true}
          label="Question"
          value={question}
          onFocus={startEditing}
          onBlur={endEditing}
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
            onStartEditing={startEditing}
            onFinishEditing={endEditing}
          />
        ) : (
          <EditFlashcard
            listItem={listItem}
            sendAnswer={(val) => setAnswerOrAnswers(val)}
            onStartEditing={startEditing}
            onFinishEditing={endEditing}
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
  );
}

const styles = StyleSheet.create({
  cardStyle: {
    width: responsiveWidth(100) - responsiveHeight(2),
    marginTop: 8,
    marginBottom: 8,
    alignSelf: "center",
  },
});
