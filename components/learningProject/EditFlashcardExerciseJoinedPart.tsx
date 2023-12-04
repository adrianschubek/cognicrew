import { Fragment, useCallback, useEffect, useState } from "react";
import { StyleSheet, View } from "react-native";
import { Card, TextInput, IconButton, HelperText } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
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
} from "../../utils/hooks";

export default function EditFlashcardExerciseJoinedPart(props: {
  listItem: any;
  type: ManagementType;
}) {
  const { listItem, type } = props;
  const [showErrorUpload, setShowErrorUpload] = useState<boolean>(false);
  const [errorText, setErrorText] = useState<string>("");
  const [priority, setPriority] = useState<number>(listItem.priority);
  const [answerOrAnswers, setAnswerOrAnswers] = useState(null);
  const [initialAnswers, setInitialAnswers] = useState<[string, boolean, number][]>([]);
  const [question, setQuestion] = useState<string>(listItem.question as string);
  const [isInitialized, setIsInitialized] = useState<boolean>(false);
  //Exercise hooks
  const { trigger: upsertExercise } = useUpsertExercise();
  const { trigger: deleteExercise } = useDeleteExercise();
  const { trigger: upsertAnswersExercise } = useUpsertAnswersExercise();
  const { trigger: deleteAnswersExercise } = useDeleteAnswersExercise();

  //Flashcard hooks
  const { trigger: upsertFlashcard } = useUpsertFlashcard();
  const { trigger: deleteFlashcard } = useDeleteFlashcard();
  const updateFlashcardOrExercise = (
    question: string,
    answerOrAnswers: any,
    priority: number,
  ) => {
    type === ManagementType.EXERCISE
      ? upsertExercise({
          //@ts-expect-error
          id: listItem.id,
          question: question,
          priority: priority,
          set_id: listItem.set_id,
        }).then((res) => {
          console.log("initalAnswers: ", initialAnswers, "\n");
          //delete those answers that should get deleted from the exercise
          /* initialAnswers
            .filter((e) => {
              return answerOrAnswers.some((answer) => answer.id === e[2]);
            })
            .forEach((e) => {
              console.log("e: \n \n", e, "\n");
              deleteAnswersExercise({ id: e[2] });
            });*/
          //answers need to be updated
          answerOrAnswers.forEach((e, index) => {
            upsertAnswersExercise({
              //@ts-expect-error
              id: e[2],
              answer: e[0],
              exercise: res[0].id,
              is_correct: e[1],
              order_position: index + 1,
            });
          });
        })
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
  const update = (question, answerOrAnswers, priority) => {
    checkForError(
      () => {
        updateFlashcardOrExercise(question, answerOrAnswers, priority);
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
    if (validAnswerExists && questionExists) {
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
      setErrorText(errorText);
      setShowErrorUpload(true);
    }
  }
  function resetCard() {
    setErrorText("");
    setShowErrorUpload(false);
  }
  // Create the debounced function
  const debouncedUpdate = useCallback(
    debounce((question, answerOrAnswers, priority) => {
      update(question, answerOrAnswers, priority);
    }, 500),
    [],
  );
  useEffect(() => {
    // Call the debounced function
    isInitialized && debouncedUpdate(question, answerOrAnswers, priority);
  }, [question, answerOrAnswers, priority, debouncedUpdate]);
  useEffect(() => {
    if (!answerOrAnswers) return;
    setIsInitialized(true);
  }, [answerOrAnswers]);

  return (
    <Card elevation={1} style={styles.cardStyle}>
      <Card.Title
        title="Edit here:"
        titleStyle={{}}
        style={{}}
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
                icon="delete"
                onPress={() => {
                  deleteFlashcardOrExercise();
                }}
                style={{ alignSelf: "center" }}
              />
            </View>
          </Fragment>
        )}
      />
      <Card.Content>
        <TextInput
          style={{ marginBottom: 8 }}
          multiline={true}
          label="Question:"
          value={question}
          onChangeText={(question) => {
            setQuestion(question);
          }}
        />
        {type === ManagementType.EXERCISE ? (
          <EditExercise
            listItem={listItem}
            sendAnswers={(val) => setAnswerOrAnswers(val)}
            sendInitialAnswers={(answers) => {
              setInitialAnswers(answers), console.log("initialAnswers!!!!: ", answers);
            }}
          />
        ) : (
          <EditFlashcard
            listItem={listItem}
            sendAnswer={(val) => setAnswerOrAnswers(val)}
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
