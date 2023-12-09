import * as React from "react";
import {
  StyleSheet,
  View,
  BackHandler,
  KeyboardAvoidingView,
} from "react-native";
import { TextInput, Text, Button, Dialog, useTheme } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import { useEffect, useMemo, useState } from "react";
import { ScrollView } from "react-native";
import {
  useAlerts,
  useConfirmLeaveLobby,
  useSoundSystem2,
} from "../utils/hooks";
import { useAuth } from "../providers/AuthProvider";
import { useRoomStateStore } from "../stores/RoomStore";
import Timer from "../components/IngameComponents/Timer";
import LoadingOverlay from "../components/alerts/LoadingOverlay";
import { supabase } from "../supabase";
import { RoomClientUpdate, ScreenState } from "../functions/rooms";
import { handleEdgeError } from "../utils/common";
import { useFocusEffect } from "@react-navigation/native";

export default function FlashcardGame({ route, navigation }) {
  useSoundSystem2();
  useConfirmLeaveLobby();

  const theme = useTheme();
  const { user } = useAuth();
  const roomState = useRoomStateStore((state) => state.roomState);

  const { error: errrorAlert } = useAlerts();
  const [alreadySubmitted, setAlreadySubmitted] = useState(false);
  const [isInvoking, setIsInvoking] = useState(false);
  async function answer() {
    setIsInvoking(true);
    const { data, error } = await supabase.functions.invoke("room-update", {
      body: {
        type: "flashcard_answer",
        answer: userInput, // get answer
      } as RoomClientUpdate,
    });
    if (error) errrorAlert({ message: await handleEdgeError(error) });
    else setAlreadySubmitted(true);
    setIsInvoking(false);
  }

  useEffect(() => {
    setUserInput("");
    setAlreadySubmitted(false);
  }, [roomState?.round]);

  const [userInput, setUserInput] = useState("");

  const MemoTimer = useMemo(
    () => <Timer roundEndsAt={roomState?.roundEndsAt} onTimeUp={() => {}} />,
    [roomState?.roundEndsAt],
  );

  if (!roomState) {
    return <LoadingOverlay visible />;
  }

  const currentPlayer = roomState?.players.find(
    (player) => player.id === user?.id,
  );

  return (
    <>
      <View style={{ paddingVertical: 20, flex: 1 }}>
        <View style={{ flex: 1 }}>
          <Dialog.Title style={{ textAlign: "center", alignSelf: "center" }}>
            Question {roomState.round} of {roomState.totalRounds}
          </Dialog.Title>
          {MemoTimer}
        </View>
        <View
          style={{
            flexDirection: "column",
            justifyContent: "flex-start",
            flex: 2,
          }}
        >
          <Text
            variant="headlineSmall"
            style={{ textAlign: "center", marginVertical: 20 }}
          >
            {roomState.question}
          </Text>
          <TextInput
            mode="outlined"
            autoFocus
            style={[
              {
                textAlign: "center",
                marginHorizontal: 10,
              },
              roomState.screen === ScreenState.ROUND_SOLUTION
                ? currentPlayer.currentCorrect === true
                  ? { backgroundColor: "#4CAF50" }
                  : { backgroundColor: theme.colors.errorContainer }
                : {},
            ]}
            value={userInput}
            onChangeText={(text) => setUserInput(text)}
            editable={
              !alreadySubmitted && roomState.screen === ScreenState.INGAME
            }
          />
          <Button
            style={{
              marginTop: 25,
              marginHorizontal: 10,
              paddingVertical: 5,
              borderRadius: 10,
              display: alreadySubmitted ? "none" : undefined,
            }}
            mode="contained"
            disabled={isInvoking || userInput.length === 0}
            onPress={answer}
          >
            Submit Answer
          </Button>
          <View
            style={{
              flexDirection: "column",
              justifyContent: "flex-start",
              alignItems: "flex-end",
              paddingTop: 16,
              paddingRight: 16,
            }}
          >
            {roomState.screen === ScreenState.ROUND_SOLUTION &&
              roomState.userAnswers.map((answer, index) => (
                <Text
                  variant="titleLarge"
                  key={index}
                  style={{
                    color: answer.isCorrect ? "green" : "red",
                    marginBottom: 10,
                  }}
                >
                  {answer.answer} {answer.percentage}%
                </Text>
              ))}
          </View>
        </View>
      </View>
    </>
  );
}

const styles = StyleSheet.create({
  correctAnswer: {
    // borderColor: "green",
    // borderWidth: 3,
    backgroundColor: "#4CAF50",
  },
  wrongAnswer: {
    // borderColor: "red",
    // borderWidth: 3,
    backgroundColor: "red",
  },

});
