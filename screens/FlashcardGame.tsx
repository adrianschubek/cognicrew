import * as React from "react";
import { StyleSheet, View, BackHandler } from "react-native";
import { TextInput, Text, Button, Dialog } from "react-native-paper";
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

  const { user } = useAuth();
  const roomState = useRoomStateStore((state) => state.roomState);

  const { error: errrorAlert } = useAlerts();
  const [alreadySubmitted, setAlreadySubmitted] = useState(false);
  const [isInvoking, setIsInvoking] = useState(false);
  async function answer() {
    setIsInvoking(true);
    const { data, error } = await supabase.functions.invoke("room-update", {
      body: {
        type: "flashcard-answer",
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
      <ScrollView style={{ paddingTop: 20 }}>
        <Dialog.Title style={{ textAlign: "center", alignSelf: "center" }}>
          Question {roomState.round} of {roomState.totalRounds}
        </Dialog.Title>
        {MemoTimer}
        <Text style={{ fontSize: 20, textAlign: "center", marginVertical: 20 }}>
          {roomState.question}
        </Text>
        <View style={styles.answerViewStyle}>
          <TextInput
            mode="outlined"
            autoFocus
            style={[
              {
                textAlign: "center",
                flex: 1,
                marginHorizontal: 10,
                // backgroundColor: null,
                borderLeftWidth: 1,
                borderRightWidth: 1,
                borderTopWidth: 1,
                // borderColor: "gray",
              },
              roomState.screen === ScreenState.ROUND_SOLUTION
                ? currentPlayer.currentCorrect === true
                  ? styles.correctAnswer
                  : styles.wrongAnswer
                : {},
            ]}
            value={userInput}
            onChangeText={(text) => setUserInput(text)}
            editable={!alreadySubmitted}
          />
        </View>
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
  container: {
    flex: 1,
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "flex-start",
  },
  countDownStyle: {
    marginLeft: responsiveWidth(27.5),
    marginRight: responsiveWidth(15),
  },
  topRightContainer: {
    marginTop: 3,
    flexDirection: "column",
    alignItems: "flex-end",
  },
  topRow: {
    flexDirection: "row",
    alignItems: "center",
  },
  image: {
    width: responsiveWidth(10),
    height: responsiveHeight(5),
    marginRight: 3,
    borderRadius: 20,
    overflow: "hidden",
    alignItems: "flex-end",
  },
  questionStyle: {
    fontSize: 18,
  },
  answerStyle: {
    fontSize: 18,
    marginLeft: responsiveWidth(5),
    marginRight: 10,
  },
  answerViewStyle: {
    flexDirection: "row",
    alignItems: "center",
  },
  scrollContent: {
    paddingVertical: 16,
  },
});
