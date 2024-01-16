import { ScrollView, View } from "react-native";
import { Avatar, Card, Divider, Text, useTheme } from "react-native-paper";
import { useEffect, useMemo } from "react";
import Animated, {
  Easing,
  useAnimatedStyle,
  withDelay,
  withTiming,
} from "react-native-reanimated";
import { useSharedValue } from "react-native-reanimated";
import { useRoomStateStore } from "../../stores/RoomStore";
import { getRandomColor } from "../../utils/common";
import { useConfirmLeaveLobby } from "../../utils/hooks";
import ProfilePictureAvatar from "../../components/profile/ProfilePictureAvatar";

export default function EndResults({ navigation }) {
  useConfirmLeaveLobby();

  const roomState = useRoomStateStore((state) => state.roomState);

  const theme = useTheme();
  const allPlayers = roomState.players;
  //const allPlayers = [...otherPlayers, self];
  //lowest to highest and only the first five  players
  const sortedPlayers = allPlayers
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
                  <ProfilePictureAvatar
                    userId={player.id}
                    username={player.username}
                    size={35}
                  />
                  {/*<Avatar.Icon
                    icon="account"
                    size={35}
                    theme={{
                      colors: { primary: getRandomColor(player.username) },
                    }}
                  />*/}
                </Animated.View>
                <Animated.View
                  key={index}
                  style={[
                    {
                      width: 65,
                      backgroundColor: getRandomColor(player.username),
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
                  <ProfilePictureAvatar
                    userId={player.id}
                    username={player.username}
                    size={35}
                  />
                  {/*<Avatar.Icon
                    icon="account"
                    size={35}
                    theme={{
                      colors: { primary: getRandomColor(player.username) },
                    }}
                  />*/}
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
        <Text
          variant="bodySmall"
          style={{
            textAlign: "center",
            color: theme.colors.onSecondaryContainer,
            marginTop: 20,
          }}
        >
          {roomState.round === roomState.totalRounds &&
            "Returning to lobby after 10s..."}
        </Text>
      </ScrollView>
    </View>
  );
}
