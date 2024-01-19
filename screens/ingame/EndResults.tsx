import { ScrollView, View } from "react-native";
import { Divider, Text, useTheme } from "react-native-paper";
import { useMemo, useState } from "react";
import { useRoomStateStore } from "../../stores/RoomStore";
import { useConfirmLeaveLobby } from "../../utils/hooks";
import RateProjectComponent from "../../components/learningProject/rating/RateProjectComponent";
import { useAuth } from "../../providers/AuthProvider";
import ScorePedestal from "../../components/ingameComponents/ScorePedestal";
import ScoreCard from "../../components/ingameComponents/ScoreCard";
import TimingFunction from "../../components/common/TimingFunction";

export default function EndResults({ navigation }) {
  useConfirmLeaveLobby();
  const roomState = useRoomStateStore((state) => state.roomState);
  const theme = useTheme();
  const userId = useAuth().user.id;
  const projectId = roomState.projectId;
  //lowest to highest and only the first five  players
  const sortedPlayers = roomState.players
    .sort((p1, p2) => p1.score - p2.score)
    .slice(-5) as {
    id: string;
    username: string;
    score: number;
    currentCorrect: boolean;
    currentTimeNeeded: number;
    position?: number;
  }[];

  //add attribute position to players
  sortedPlayers.forEach((player, index) => {
    player.position = sortedPlayers.length - index;
  });
  function reSortPlayers(
    players /*players already have to be sorted ascending by score*/,
  ) {
    const result = [];
    let i = 0;
    while (i < players.length) {
      result.push(players[i]);
      i += 2;
    }
    players.length % 2 === 0
      ? (i = players.length - 1)
      : (i = players.length - 2);
    while (i > 0) {
      result.push(players[i]);
      i -= 2;
    }
    return result;
  }
  const reSortedPlayers = useMemo(
    () => reSortPlayers(sortedPlayers),
    [roomState],
  );

  const highestScore = sortedPlayers[sortedPlayers.length - 1].score * 2;
  let maxheight = 1;
  if (highestScore > 250) {
    maxheight = 250 / highestScore;
  }
  const MemoTimer = useMemo(() => <BottomTimer />, [roomState?.roundEndsAt]);
  function BottomTimer() {
    const amountOfSeconds = useMemo(() => 10, [roomState.roundEndsAt]);
    const [remainingTime, setRemainingTime] = useState<number>(amountOfSeconds);
    return (
      <>
        <TimingFunction
          amountOfSeconds={amountOfSeconds}
          intervall={1000}
          sendUpdate={(newTime) => {
            setRemainingTime(newTime);
          }}
        />
        <Text
          variant="bodySmall"
          style={{
            textAlign: "center",
            color: theme.colors.onSecondaryContainer,
            marginTop: 10,
          }}
        >
          Returning to lobby after {remainingTime}s...
        </Text>
      </>
    );
  }
  return (
    <View
      style={{
        flex: 1,
        justifyContent: "flex-start",
        marginTop: 100,
        alignItems: "center",
      }}
    >
      <View
        style={{
          justifyContent: "flex-end",
          height: 250,
        }}
      >
        <View
          style={{
            flexDirection: "row",
            gap: 10,
            alignItems: "flex-end",
            paddingHorizontal: 10,
          }}
        >
          {reSortedPlayers.map((player, index) => {
            return (
              <ScorePedestal
                key={index}
                player={player}
                playerAmount={sortedPlayers.length}
                maxheight={maxheight}
              />
            );
          })}
        </View>
        <Divider style={{ backgroundColor: theme.colors.primary }} />
      </View>
      <ScrollView style={{ flexDirection: "column", marginTop: 30 }}>
        {sortedPlayers.reverse().map((player, index) => {
          return (
            <ScoreCard
              key={index}
              player={player}
              playerAmount={sortedPlayers.length}
            />
          );
        })}
        {roomState.round === roomState.totalRounds && (
          <View style={{ alignItems: "center", marginTop: 10 }}>
            <View
              style={{ flexDirection: "row", gap: 5, alignItems: "center" }}
            >
              <Text variant="bodySmall">Rate this project:</Text>
              <RateProjectComponent projectId={projectId} userId={userId} />
            </View>
            {MemoTimer}
          </View>
        )}
      </ScrollView>
    </View>
  );
}
