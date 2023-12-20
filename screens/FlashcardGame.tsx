import * as React from "react";
import {
  StyleSheet,
  View,
  BackHandler,
  KeyboardAvoidingView,
} from "react-native";
import {
  TextInput,
  Text,
  Button,
  Dialog,
  useTheme,
  Card,
  IconButton,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import { useEffect, useMemo, useState } from "react";
import { ScrollView } from "react-native";
import { useConfirmLeaveLobby } from "../utils/hooks";
import { useAlerts } from "react-native-paper-fastalerts";
import { useAuth } from "../providers/AuthProvider";
import { useRoomStateStore } from "../stores/RoomStore";
import Timer from "../components/IngameComponents/Timer";
import LoadingOverlay from "../components/alerts/LoadingOverlay";
import { supabase } from "../supabase";
import { RoomClientUpdate, ScreenState } from "../functions/rooms";
import { handleEdgeError } from "../utils/common";
import { useFocusEffect } from "@react-navigation/native";
import Animated from "react-native-reanimated";
import { useSoundsStore } from "../stores/SoundsStore";

export default function FlashcardGame({ route, navigation }) {
  const { setInGame } = useSoundsStore();

  useConfirmLeaveLobby();
  const theme = useTheme();
  const { user } = useAuth();
  const roomState = useRoomStateStore((state) => state.roomState);

  const { error: errrorAlert, confirm } = useAlerts();
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

  useEffect(() => {
    setInGame(true);
    return () => {
      setInGame(false);
    };
  }, []);

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
                  const { error } = await supabase.functions.invoke(
                    "room-update",
                    {
                      body: {
                        type: "reset_room",
                      } as RoomClientUpdate,
                    },
                  );
                  if (error) return await handleEdgeError(error);
                },
              });
            }}
          />
          <Dialog.Title style={{ textAlign: "center", alignSelf: "center" }}>
            Question {roomState.round} of {roomState.totalRounds}
          </Dialog.Title>
          {MemoTimer}
        </View>
        <View
          style={{ flex: 2, marginHorizontal: 10, justifyContent: "center" }}
        >
          <Card style={{ paddingVertical: 20 }}>
            <Card.Content>
              <Text variant="headlineSmall" style={{ textAlign: "center" }}>
                {roomState.question}
              </Text>
            </Card.Content>
          </Card>
        </View>
        <View
          style={{
            flexDirection: "column",
            justifyContent: "flex-start",
            flex: 3,
            marginHorizontal: 10,
          }}
        >
          <TextInput
            mode="outlined"
            autoFocus
            style={[
              {
                textAlign: "center",
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
            }}
          >
            {roomState.screen === ScreenState.ROUND_SOLUTION &&
              roomState.userAnswers &&
              roomState.userAnswers.map((answer, index) => (
                <Animated.View
                  key={index}
                  style={[
                    {
                      width: "100%",
                      height: 70,
                    },
                  ]}
                >
                  <Card
                    mode="outlined"
                    style={[
                      answer.isCorrect
                        ? { backgroundColor: "#4CAF50" }
                        : { backgroundColor: theme.colors.elevation.level2 },
                      answer.answer === userInput
                        ? { borderColor: theme.colors.primary }
                        : { borderColor: null, borderWidth: 0 },
                    ]}
                  >
                    <Card.Content
                      style={{
                        flexDirection: "row",
                        justifyContent: "flex-start",
                        alignItems: "center",
                      }}
                    >
                      <View
                        style={{
                          marginLeft: 5,
                          justifyContent: "flex-start",
                          alignItems: "flex-start",
                          gap: 5,
                        }}
                      >
                        <Text
                          variant="titleMedium"
                          key={index}
                          style={[
                            answer.isCorrect
                              ? { color: theme.colors.onBackground }
                              : { color: theme.colors.onErrorContainer },
                            { textAlign: "center" },
                          ]}
                        >
                          {answer.answer} {answer.percentage}%
                        </Text>
                      </View>
                    </Card.Content>
                  </Card>
                </Animated.View>
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
