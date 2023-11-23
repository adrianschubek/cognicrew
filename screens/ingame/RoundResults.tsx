import { View } from "react-native";
import { Button, Text } from "react-native-paper";
import { PublicRoomState, ScreenState } from "../../functions/rooms";
import { useAlerts } from "../../utils/hooks";

export default function RoundResults(props: {
  roomState: PublicRoomState;
  user_id: string;
}) {
  const { confirm } = useAlerts();
  const initalValue = "";
  const results = props.roomState.players.reduce(
    (string, player) =>
      string + `${player.username}s score: ${player.score} \n\n`,
    initalValue,
  );
  return (
    <Button>
      PRESS ME, DADDY!{" "}
    </Button>
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
