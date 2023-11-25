import { View } from "react-native";
import { Avatar, Button, Card, Text, useTheme } from "react-native-paper";
import { PublicRoomState, ScreenState } from "../../functions/rooms";
import { useAlerts } from "../../utils/hooks";
import { useEffect, useMemo, useState } from "react";
import Animated, {
  Easing,
  useAnimatedStyle,
  withDelay,
  withSpring,
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
    [route.params.roomState],
  );

  const highestScore = sortedPlayers[sortedPlayers.length - 1].score * 2;
  let maxheight = 1;
  if (highestScore > 250) {
    maxheight = 250 / highestScore;
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
          }}
        >
          {reSortedPlayers.map((player, index) => {
            const height = useSharedValue(0);
            useEffect(() => {
              height.value = withTiming(
                (player.score < 10 ? 10 : player.score) * 2 * maxheight,
                {
                  duration: 1200,
                },
              );
            }, []);
            const animatedStyles = useAnimatedStyle(() => {
              return {
                height: height.value,
              };
            });
            return (
              <View
                key={player.id}
                style={{
                  flexDirection: "column",
                  alignItems: "center",
                  gap: 10,
                }}
              >
                <Avatar.Icon icon="account" size={35} />
                <Animated.View
                  key={index}
                  style={[
                    {
                      width: 65,
                      backgroundColor: theme.colors.primary,
                      justifyContent: "flex-end",
                      alignItems: "center",
                    },
                    animatedStyles,
                  ]}
                >
                  <Text
                    variant="bodyMedium"
                    style={{ color: theme.colors.background, paddingBottom: 4 }}
                  >
                    {player.position}
                  </Text>
                </Animated.View>
              </View>
            );
          })}
        </View>
      </View>
      <View style={{ flexDirection: "column", gap: 10, marginTop: 40 }}>
        {sortedPlayers.reverse().map((player, index) => {
          const translateY = useSharedValue(-70);
          const opacity = useSharedValue(0);
          useEffect(() => {
            (translateY.value += 70),
              (opacity.value = withDelay(
                400 * (sortedPlayers.length - (index + 1)),
                withTiming(1, { duration: 2000 }),
              ));
          }, []);
          const animatedStyles = useAnimatedStyle(() => ({
            opacity: opacity.value,
            //transform: [{ translateY: withSpring(translateY.value *5) }],
          }));
          return (
            <Animated.View key={index} style={[{}, animatedStyles]}>
              <Card
                mode="outlined"
                style={[
                  { width: 350, height: 70, borderColor: theme.colors.primary },
                ]}
              >
                <Card.Content
                  style={{
                    flexDirection: "row",
                    justifyContent: "flex-start",
                    alignItems: "center",
                    gap: 5,
                  }}
                >
                  <Text style={{ textAlign: "center" }}>
                    {index + 1}
                    {index === 0
                      ? "st"
                      : index === 1
                      ? "nd"
                      : index === 2
                      ? "rd"
                      : "th"}{" "}
                  </Text>
                  <Avatar.Icon icon="account" size={35} />
                  <View
                    style={{
                      marginLeft: 5,
                      justifyContent: "flex-start",
                      alignItems: "flex-start",
                    }}
                  >
                    <Text style={{ textAlign: "center" }}>
                      {player.username}
                    </Text>
                    <Text style={{ textAlign: "center" }}>
                      Score: {player.score}
                    </Text>
                  </View>
                </Card.Content>
              </Card>
            </Animated.View>
          );
        })}
      </View>
    </View>
  );
}
