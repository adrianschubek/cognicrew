import { ScrollView, View } from "react-native";
import { Avatar, Card, Divider, Text, useTheme } from "react-native-paper";
import { PublicRoomState } from "../../functions/rooms";
import { useEffect, useMemo, useState } from "react";
import Animated, {
  Easing,
  useAnimatedStyle,
  withDelay,
  withSpring,
  withTiming,
} from "react-native-reanimated";
import { useSharedValue } from "react-native-reanimated";
import {
  responsiveHeight,
  responsiveScreenHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
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
      score: 3,
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
    {
      id: "5",
      username: "Player 5",
      score: 50,
      currentCorrect: false,
      currentDone: false,
    },
  ];
  const allPlayers = [...otherPlayers, self];
  //lowest to highest and only the first five  players
  const sortedPlayers = allPlayers
    .sort((p1, p2) => p1.score - p2.score)
    .slice(-5);

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
            paddingHorizontal: 10,
          }}
        >
          {reSortedPlayers.map((player, index) => {
            const height = useSharedValue(0);
            const opacity = useSharedValue(0);
            useEffect(() => {
              opacity.value = 1;
              height.value =
                (player.score < 10 ? 10 : player.score) * 2 * maxheight;
            }, []);
            const animatedStyles = useAnimatedStyle(() => {
              return {
                height: withDelay(
                  400 * (sortedPlayers.length - player.position),
                  withTiming(height.value, {
                    duration: 1200,
                    easing: Easing.inOut(Easing.poly(3)),
                  }),
                ),
              };
            });
            const animatedAvatarStyles = useAnimatedStyle(() => {
              return {
                opacity: withDelay(
                  400 + 400 * (sortedPlayers.length - player.position),
                  withTiming(opacity.value, {
                    duration: 1000,
                    //easing: Easing.inOut(Easing.cubic),
                  }),
                ),
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
                <Animated.View style={[animatedAvatarStyles]}>
                  <Avatar.Icon icon="account" size={35} />
                </Animated.View>
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
                    {player.position === 1
                      ? "st"
                      : player.position === 2
                      ? "nd"
                      : player.position === 3
                      ? "rd"
                      : "th"}
                  </Text>
                </Animated.View>
              </View>
            );
          })}
        </View>
        <Divider
          //bold={true}
          style={{ backgroundColor: theme.colors.primary }}
        />
      </View>
      <ScrollView style={{ flexDirection: "column", marginTop: 30 }}>
        {sortedPlayers.reverse().map((player, index) => {
          const translateY = useSharedValue(-70);
          const opacity = useSharedValue(0);
          useEffect(() => {
            (translateY.value += 70), (opacity.value = 1);
          }, []);
          const animatedStyles = useAnimatedStyle(() => ({
            opacity: withDelay(
              400 * (sortedPlayers.length - (index + 1)),
              withTiming(opacity.value, { duration: 2000 }),
            ),
            transform: [
              {
                translateY: withDelay(
                  400 * (sortedPlayers.length - (index + 1)),
                  withTiming(translateY.value * 2, { duration: 1000 }),
                ),
              },
            ],
          }));
          return (
            <Animated.View
              key={index}
              style={[
                {
                  width: 350,
                  height: 70,
                  marginBottom: 10,
                },
                animatedStyles,
              ]}
            >
              <Card
                mode="outlined"
                style={[{ borderColor: theme.colors.primary }]}
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
      </ScrollView>
    </View>
  );
}
