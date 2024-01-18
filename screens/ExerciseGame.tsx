import * as React from "react";
import { ScrollView, View } from "react-native";
import {
  Dialog,
  RadioButton,
  Button,
  Text,
  useTheme,
  IconButton,
} from "react-native-paper";
import { useConfirmLeaveLobby } from "../utils/hooks";
import { useAlerts } from "react-native-paper-fastalerts";
import { useEffect, useMemo, useState } from "react";
import { useRoomStateStore } from "../stores/RoomStore";
import LoadingOverlay from "../components/alerts/LoadingOverlay";
import { supabase } from "../supabase";
import Timer from "../components/ingameComponents/Timer";
import { RoomClientUpdate, ScreenState } from "../functions/rooms";
import { handleEdgeError } from "../utils/common";
import { useSoundsStore } from "../stores/SoundsStore";

export default function ExerciseGame({ navigation }) {
  useConfirmLeaveLobby();
  const roomState = useRoomStateStore(
    (state) => state.roomState,
  ); /* TODO: memoize */
  const { error: errrorAlert, confirm } = useAlerts();

  const [isInvoking, setIsInvoking] = useState(false);
  async function answer() {
    setIsInvoking(true);
    const { data, error } = await supabase.functions.invoke("room-update", {
      body: {
        type: "exercise_answer",
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
        type: "skip_round",
      } as RoomClientUpdate,
    });
    if (error) errrorAlert({ message: await handleEdgeError(error) });
    setIsInvoking(false);
  }
  const [alreadySubmitted, setAlreadySubmitted] = useState(false);
  const [checked, setChecked] = useState([] as number[]);
  const theme = useTheme();
  const handleValueChange = (newValue) => {
    if (checked.includes(newValue)) {
      setChecked(checked.filter((value) => value !== newValue));
    } else {
      setChecked([...checked, newValue]);
    }
  };
  const { setInGame } = useSoundsStore();

  useEffect(() => {
    setInGame(true);
    return () => {
      setInGame(false);
    };
  }, []);

  useEffect(() => {
    setChecked([]);
    setAlreadySubmitted(false);
  }, [roomState?.round]);

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

  const MemoTimer = useMemo(
    () => <Timer roundEndsAt={roomState?.roundEndsAt} onTimeUp={() => {}} />,
    [roomState?.roundEndsAt],
  );

  if (!roomState) {
    return <LoadingOverlay visible />;
  }

  return (
    <>
      <ScrollView style={{ paddingTop: 20 }}>
        <IconButton
          mode="contained"
          style={{
            //backgroundColor: theme.colors.error,
            position: "absolute",
            left: 0,
            top: 8,
            borderRadius: 10,
            backgroundColor: theme.colors.background,
            transform: [{ rotateZ: "180deg" }],
          }}
          icon="logout"
          //iconColor={theme.colors.onErrorContainer}
          onPress={() => {
            confirm({
              key: "leaveroom",
              title: "Leave game?",
              message: "Do you want to leave this game and return to lobby?",
              icon: "location-exit",
              okText: "Leave",
              okAction: async () => {
                const { error } = await supabase.functions.invoke("room-update", {
                  body: {
                    type: "reset_room",
                  } as RoomClientUpdate,
                });
                if (error) return await handleEdgeError(error);
              },
            });
          }}
        />
        <Dialog.Title
          style={{
            textAlign: "center",
            alignSelf: "center",
          }}
        >
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
                ? roomState.userAnswers[option[1]].percentage 
                : ""
            }`}
            labelStyle={{
              color:
                roomState.screen === ScreenState.ROUND_SOLUTION
                  ? roomState.userAnswers[option[1]].isCorrect === true
                    ? theme.colors.onPrimaryContainer
                    : theme.colors.onErrorContainer
                  : checked.includes(option[1])
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
                borderRadius: 10,
                paddingVertical: 15,
              },
              roomState.screen === ScreenState.ROUND_SOLUTION
                ? {
                    borderColor: checked.includes(option[1])
                      ? theme.colors.primary
                      : undefined,
                    borderWidth: checked.includes(option[1]) ? 3 : 0,
                    backgroundColor:
                      roomState.userAnswers[option[1]].isCorrect === true
                        ? /* theme.colors.primaryContainer */ "#4CAF50" /* theme.colors.primaryContainer */
                        : theme.colors.elevation.level2,
                  }
                : {
                    backgroundColor: checked.includes(option[1])
                      ? theme.colors.primary
                      : theme.colors.secondaryContainer,
                  },
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
