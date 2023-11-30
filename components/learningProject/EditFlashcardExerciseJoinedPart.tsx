import { max, set, update } from "cypress/types/lodash";
import { Fragment, useCallback, useEffect, useState } from "react";
import { StyleSheet, View } from "react-native";
import {
  Text,
  List,
  Divider,
  useTheme,
  Card,
  TextInput,
  Checkbox,
  IconButton,
  HelperText,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { parse } from "react-native-svg";
import PrioritySelector from "./PrioritySelector";
import { checkForLineBreak, debounce } from "../../utils/common";
import { ManagementType } from "../../types/common";
import EditFlashcard from "./EditFlashcard";
import EditExercise from "./EditExercise";
import { useDeleteExercise, useUpsertAnswersExercise, useUpsertExercise } from "../../utils/hooks";

export default function EditFlashcardExerciseJoinedPart({ listItem, type }) {
  const theme = useTheme();
  const [allowUpdate, setAllowUpdate] = useState<boolean>(false);
  const [showErrorUpload, setShowErrorUpload] = useState<boolean>(false);
  const [errorText, setErrorText] = useState<string>("");
  const [isInitialized, setIsInitialized] = useState<boolean>(false);
  const [priority, setPriority] = useState<number>(0);
  const [answerOrAnswers, setAnswerOrAnswers] = useState(null);
  const [question, setQuestion] = useState<string>(listItem.question as string);
  const [upsertFlashcardOrExercise, setUpsertFlashcardOrExercise] =
    useState<Function>(() => {});
  const [deleteFlashcardOrExercise, setDeleteFlashcardOrExercise] =
    useState<Function>(() => {});
    const { isMutating, trigger: upsertExercise } = useUpsertExercise();
    const { trigger: deleteExercise } = useDeleteExercise();
    const { isMutating: isMutating2, trigger: upsertAnswersExercise } =
      useUpsertAnswersExercise();
    const updateExercise = (question, answers, priority) => {
      upsertExercise({
        //@ts-expect-error
        id: listItem.id,
        question: question,
        priority: priority,
        set_id: listItem.set_id,
      }).then((res) => {
        answers.forEach((e, index) => {
          upsertAnswersExercise({
            //@ts-expect-error
            id: e[2],
            answer: e[0],
            exercise: res[0].id,
            is_correct: e[1],
            order_position: index + 1,
          });
        });
      });
    };
  const update = (question, answerOrAnswers, priority) => {
    checkForError(
      () => {
        ManagementType.EXERCISE && updateExercise(question, answerOrAnswers, priority);
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
          ManagementType.EXERCISE
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
    setAllowUpdate(true);
  }, []);
  useEffect(() => {
    // Call the debounced function
    allowUpdate
      ? debouncedUpdate(question, answerOrAnswers, priority)
      : setAllowUpdate(true);
  }, [question, answerOrAnswers, priority, debouncedUpdate]);

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
      <Card.Content style={styles.cardContentStyle}>
        <TextInput
          style={[styles.textInputStyle, { marginBottom: 8 }]}
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
          />
        ) : (
          <EditFlashcard listItem={listItem} />
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
  cardContentStyle: {},
  textInputStyle: {},
});
