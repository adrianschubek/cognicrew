import * as React from "react";
import { ScrollView, View, StyleSheet, Alert } from "react-native";
import {
  Dialog,
  Portal,
  RadioButton,
  Button,
  Text,
  ProgressBar,
  useTheme,
} from "react-native-paper";
import { responsiveFontSize } from "react-native-responsive-dimensions";
import {
  useAchievements,
  useAlerts,
  useExercisesAndAnswers,
  useSoundSystem2,
  useUnlockAchievement,
} from "../utils/hooks";
import { memo, useEffect, useMemo, useState } from "react";
import AchievementNotification from "../components/dialogues/AchievementNotification";
import { useRoomStateStore } from "../stores/RoomStore";
import LoadingOverlay from "../components/alerts/LoadingOverlay";
import { supabase } from "../supabase";
import Timer from "../components/IngameComponents/Timer";
import { useAuth } from "../providers/AuthProvider";
import { NAVIGATION } from "../types/common";
import { RoomClientUpdate, ScreenState } from "../functions/rooms";
import { handleEdgeError } from "../utils/common";
import { set } from "cypress/types/lodash";

export default function ExerciseGame({ navigation }) {
  useSoundSystem2();
  const { user } = useAuth();
  const roomState = useRoomStateStore(
    (state) => state.roomState,
  ); /* TODO: memoize */
  const { error: errrorAlert } = useAlerts();

  const [isInvoking, setIsInvoking] = useState(false);
  async function answer() {
    setIsInvoking(true);
    const { data, error } = await supabase.functions.invoke("room-update", {
      body: {
        type: "exercise-answer",
        answerIndex: checked, // between 0 and 3 // TODO: get selected Answers
      } as RoomClientUpdate,
    });
    if (error) errrorAlert({ message: await handleEdgeError(error) });
    else setAlreadySubmitted(true);
    setIsInvoking(false);
  }
  async function skipQuestion() {
    setIsInvoking(true);
    const { data, error } = await supabase.functions.invoke("room-update", {
      body: {
        type: "skip-round",
      } as RoomClientUpdate,
    });
    if (error) errrorAlert({ message: await handleEdgeError(error) });
    setIsInvoking(false);
  }
  const [alreadySubmitted, setAlreadySubmitted] = useState(false);
  const [checked, setChecked] = useState([] as number[]);
  const [quizComplete, setQuizComplete] = useState(false);
  const unlockAchievement = useUnlockAchievement();
  const [achievementVisible, setAchievementVisible] = useState(false);
  const theme = useTheme();
  const { data: achievements } = useAchievements();
  const [achievementName, setAchievementName] = useState("");
  const [achievementIcon, setAchievementIcon] = useState("");
  const currentPlayerIndex = roomState?.players.findIndex(
    (player) => player.id === user?.id,
  );
  const handleValueChange = (newValue) => {
    if (checked.includes(newValue)) {
      setChecked(checked.filter((value) => value !== newValue));
    } else {
      setChecked([...checked, newValue]);
    }
  };
  useEffect(() => {
    setChecked([]);
    setAlreadySubmitted(false);
  }, [roomState?.round]);
  /*
      Alert.alert(
        isCorrect ? "Correct!" : "Incorrect!",
        isCorrect
          ? "You're awesome! Keep it up!"
          : `The correct answer was: ${questions[currentQuestionIndex].correctAnswer}`,
        [{ text: "OK", onPress: () => advanceQuestion() }],
      );
    } else {
      Alert.alert(
        "No Answer",
        "Please select an answer or skip the question.",
        [{ text: "OK" }],
      );
    }
*/
  const answersWithIndexes = (roomState ? roomState.possibleAnswers : []).map(
    (answer, index) => [answer, index],
  ) as [string, number][];
  const shuffledAnswers = useMemo(
    () => shuffleArray(answersWithIndexes),
    [roomState?.round],
  );
  /*function starts from the end of the array and works its way to the start, 
  swapping each element with a random element that comes before it (including possibly itself).*/
  function shuffleArray(array: [string, number][]) {
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
  }

  const completeQuiz = async () => {
    const achievementId = 11; // ggf. abändern
    const { success } = await unlockAchievement(achievementId);
    if (success) {
      // Find the achievement with the specific ID and update the state
      const achievement = achievements?.find((ach) => ach.id === achievementId);
      setAchievementName(achievement?.name || "Achievement");
      setAchievementIcon(achievement?.icon_name);

      console.log(`Achievement Unlocked: ${achievement?.name}`);
      setAchievementVisible(true);
      setTimeout(() => setAchievementVisible(false), 5000); // Hide after 5 seconds
    } else {
      console.log(`Failed to unlock achievement: ID ${achievementId}`);
    }
  };

  const MemoTimer = useMemo(
    () => <Timer roundEndsAt={roomState?.roundEndsAt} onTimeUp={() => {}} />,
    [roomState?.roundEndsAt],
  );

  if (!roomState) {
    return <LoadingOverlay visible />;
  }

  // TODO: pack alles in useMemo
  return (
    <>
      <ScrollView style={{ paddingTop: 20 }}>
        <Dialog.Title style={{ textAlign: "center", alignSelf: "center" }}>
          Question {roomState.round} of {roomState.totalRounds}
        </Dialog.Title>
        {MemoTimer}
        <Text style={{ fontSize: 20, textAlign: "center", marginVertical: 20 }}>
          {roomState.question}
        </Text>
        {shuffledAnswers.map((option, index) => (
          <RadioButton.Item
            key={index}
            label={`${String.fromCharCode(65 + index)}) ${option[0]} ${
              roomState.screen === ScreenState.ROUND_SOLUTION
                ? " (" + roomState.userAnswers[option[1]].percentage + "%)"
                : ""
            }`}
            labelStyle={{
              color: checked.includes(option[1])
                ? theme.colors.onPrimary
                : theme.colors.onSecondaryContainer,
            }}
            value={option[1].toString()}
            disabled={alreadySubmitted}
            status={checked.includes(option[1]) ? "checked" : "unchecked"}
            onPress={() => {
              handleValueChange(option[1]);
            }}
            mode="ios"
            // uncheckedColor="white"
            color={theme.colors.onPrimary}
            style={[
              {
                margin: 10,
                marginVertical: 5,
                backgroundColor: checked.includes(option[1])
                  ? theme.colors.primary
                  : theme.colors.secondaryContainer,
                borderRadius: 10,
                paddingVertical: 15,
              },
              roomState.screen === ScreenState.ROUND_SOLUTION
                ? roomState.userAnswers[option[1]].isCorrect === true
                  ? styles.correctAnswer
                  : styles.wrongAnswer
                : {},
            ]}
          />
        ))}
        <View
          style={{
            marginHorizontal: 10,
            marginTop: 15,
          }}
        >
          <Button
            style={{
              paddingVertical: 5,
              borderRadius: 10,
              display: alreadySubmitted ? "none" : undefined,
            }}
            mode="contained"
            disabled={isInvoking || checked.length === 0}
            onPress={answer}
          >
            Submit Answer
          </Button>
        </View>
        <View
          style={{
            flexDirection: "row",
            justifyContent: "flex-end",
            alignItems: "center",
            paddingTop: 16,
            paddingRight: 16,
          }}
        >
          {/* Host only */}
          {/*   <Button disabled={isInvoking} onPress={skipQuestion}>
            Skip question
          </Button> */}
        </View>
      </ScrollView>
    </>
  );
}

const styles = StyleSheet.create({
  correctAnswer: {
    borderColor: "green",
    borderWidth: 3,
    //backgroundColor:"green"
  },
  wrongAnswer: {
    borderColor: "red",
    borderWidth: 3,
    //backgroundColor:"red"
  },
  summaryScreen: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
  summaryText: {
    fontSize: 20,
    textAlign: "center",
    marginBottom: 20,
  },
});
