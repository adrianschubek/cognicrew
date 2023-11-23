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
  const roomState = route.params.roomState;
  const user_id = route.params.user_id;
  const otherPlayers = roomState.players.filter((player) => {
    if (player.id !== user_id) return true;
    self = player;
    return false;
  });
  useEffect(() => {
    console.log(self);
  }, []);
  return (
    <View
      style={{
        flex: 1,
        justifyContent: "center",
        alignItems: "center",
      }}
    >
      <Text style={{ fontSize: 30, fontWeight: "bold" }}>
        Your score: {self.score} {/*"\n \n"*/}
      </Text>
      <Text style={{ textAlign:"center" }}>
        You are more than the others, {"\n"}thats why your score is big and bold
      </Text>
      {otherPlayers.map((player) => (
        <Text>
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
