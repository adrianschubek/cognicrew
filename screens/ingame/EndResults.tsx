import { View } from "react-native";
import { Button, Text } from "react-native-paper";
import { PublicRoomState, ScreenState } from "../../functions/rooms";
import { useAlerts } from "../../utils/hooks";
import { useEffect } from "react";

export default function EndResults({
  route,
}: {
  route: { params: { roomState: PublicRoomState; user_id: string } };
}) {
  let self;
  //const roomState = route.params.roomState;
  //const user_id = route.params.user_id;
  /*const otherPlayers = roomState.players.filter((player) => {
    if (player.id !== user_id) return true;
    self = player;
    return false;
  });*/
  self = {
    id: "10",
    username: "TimoDerBoiii",
    score: 9000,
    currentCorrect: false,
    currentDone: false,
  };
  const otherPlayers = [
    {
      id: "1",
      username: "Player 1",
      score: 10,
      currentCorrect: false,
      currentDone: false,
    },
    {
      id: "2",
      username: "Player 2",
      score: 20,
      currentCorrect: false,
      currentDone: false,
    },
    {
      id: "3",
      username: "Player 3",
      score: 30,
      currentCorrect: false,
      currentDone: false,
    },
    {
      id: "4",
      username: "Player 4",
      score: 40,
      currentCorrect: false,
      currentDone: false,
    },
  ];
  useEffect(() => {
    console.log(self);
  }, []);
  return (
    <View
      style={{
        flex: 1,
        justifyContent: "flex-start",
        marginTop: 200,
        alignItems: "center",
      }}
    >
      <Text variant="headlineSmall" style={{ fontWeight: "bold" }}>
        Your score: {self.score} {/*"\n \n"*/}
      </Text>
      <Text variant="bodyMedium" style={{ textAlign: "center", marginBottom: 70 }}>
        You are more important than the others, {"\n"}thats why your score is
        big and bold
      </Text>
      {otherPlayers.map((player) => (
        <Text variant="titleMedium" key={player.id}>
          {player.username}s score: {player.score} {"\n \n"}
        </Text>
      ))}
    </View>
  );
}
/*
 props.roomState.players.map((player) => player.score)) }*/
/*
 <View style={{}}>
      {
        //props.roomState.screen == ScreenState.ROUND_RESULTS ? (
        <Text>
          Your score:{" "}
          {
            props.roomState.players.find(
              (player) => player.id === props.user_id,
            ).score
          }
        </Text>
        //) : null
      }
    </View>
*/
