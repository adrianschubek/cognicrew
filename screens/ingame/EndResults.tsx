import { View } from "react-native";
import { Button, Text, useTheme } from "react-native-paper";
import { PublicRoomState, ScreenState } from "../../functions/rooms";
import { useAlerts } from "../../utils/hooks";
import { useEffect, useMemo, useState } from "react";
import Animated, {
  useAnimatedStyle,
  withTiming,
} from "react-native-reanimated";
import { useSharedValue } from "react-native-reanimated";
import { all } from "cypress/types/bluebird";
import { useFocusEffect } from "@react-navigation/native";
export default function EndResults({
  route,
}: {
  route: { params: { roomState: PublicRoomState; user_id: string } };
}) {
  const theme = useTheme();
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
    score: 125,
    currentCorrect: false,
    currentDone: false,
  };
  const otherPlayers = [
    {
      id: "1",
      username: "Player 1",
      score: 2,
      currentCorrect: false,
      currentDone: false,
    },
    {
      id: "2",
      username: "Player 2",
      score: 100,
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
  const allPlayers = [...otherPlayers, self];
  //lowest to highest
  const sortedPlayers = allPlayers.sort((p1, p2) => p1.score - p2.score);
  function reSortPlayers(
    players /*players already have to be sorted ascending by score*/,
  ) {
    const result = [];
    let i = 0;
    while (i < players.length) {
      result.push(players[i]);
      i += 2;
    }
    i = players.length - 2;
    while (i > 0) {
      result.push(players[i]);
      i -= 2;
    }
    return result;
  }
  const reSortedPlayers = useMemo(
    () => reSortPlayers(sortedPlayers),
    [route.params.roomState],
  );

  const highestScore = sortedPlayers[sortedPlayers.length - 1].score * 2;
  let maxheight = 1;
  if (highestScore > 250) {
    maxheight = 250 / highestScore;
  }
  useFocusEffect(() => {});

  return (
    <View
      style={{
        flex: 1,
        justifyContent: "flex-start",
        marginTop: 200,
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
            //backgroundColor: "red",
          }}
        >
          {reSortedPlayers.map((player) => {
            const height = useSharedValue(0);
            useEffect(() => {
              height.value = withTiming(
                (player.score < 10 ? 10 : player.score) * 2 * maxheight,
                {
                  duration: 1000,
                },
              );
            }, []);
            const animatedStyles = useAnimatedStyle(() => {
              return {
                height: height.value,
              };
            });
            return (
              <Animated.View
                key={player.id}
                style={[
                  {
                    width: 60,

                    backgroundColor: theme.colors.primary,
                    justifyContent: "flex-end",
                    alignItems: "center",
                  },
                  animatedStyles,
                ]}
              >
                <Text
                  variant="bodyMedium"
                  style={{ color: theme.colors.background }}
                >
                  {player.username}
                </Text>
              </Animated.View>
            );
          })}
        </View>
      </View>
      {/* <Text variant="headlineSmall" style={{ fontWeight: "bold" }}>
        Your score: {self.score}
      </Text>
      <Text
        variant="bodyMedium"
        style={{ textAlign: "center", marginBottom: 70 }}
      >
        You are more important than the others, {"\n"}thats why your score is
        big and bold
      </Text>
      {otherPlayers.map((player) => (
        <Text variant="titleMedium" key={player.id}>
          {player.username}s score: {player.score} {"\n \n"}
        </Text>
      ))} */}
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
