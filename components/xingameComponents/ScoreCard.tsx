import { View } from "react-native";
import { Card, Text, useTheme } from "react-native-paper";
import Animated, {
  useAnimatedStyle,
  useSharedValue,
  withDelay,
  withTiming,
} from "react-native-reanimated";
import ProfilePictureAvatar from "../profile/ProfilePictureAvatar";
import { useEffect } from "react";

export default function ScoreCard(props: {
  player: {
    id: string;
    username: string;
    score: number;
    currentCorrect: boolean;
    currentTimeNeeded: number;
    position?: number;
  };
  playerAmount: number;
}) {
  const theme = useTheme();
  const { player, playerAmount } = props;
  const translateY = useSharedValue(-70);
  const opacity = useSharedValue(0);
  useEffect(() => {
    (translateY.value += 70), (opacity.value = 1);
  }, []);
  const animatedStyles = useAnimatedStyle(() => ({
    opacity: withDelay(
      400 * (playerAmount - player.position),
      withTiming(opacity.value, { duration: 2000 }),
    ),
    transform: [
      {
        translateY: withDelay(
          400 * (playerAmount - player.position),
          withTiming(translateY.value * 2, { duration: 1000 }),
        ),
      },
    ],
  }));
  return (
    <Animated.View
      style={[
        {
          width: 350,
          height: 70,
          marginBottom: 10,
        },
        animatedStyles,
      ]}
    >
      <Card mode="outlined" style={[{ borderColor: theme.colors.primary }]}>
        <Card.Content
          style={{
            flexDirection: "row",
            justifyContent: "flex-start",
            alignItems: "center",
            gap: 5,
          }}
        >
          <Text style={{ textAlign: "center" }}>
            {player.position}
            {player.position === 1
              ? "st"
              : player.position === 2
              ? "nd"
              : player.position === 3
              ? "rd"
              : "th"}{" "}
          </Text>
          <ProfilePictureAvatar
            userId={player.id}
            username={player.username}
            size={35}
          />
          <View
            style={{
              marginLeft: 5,
              justifyContent: "flex-start",
              alignItems: "flex-start",
            }}
          >
            <Text style={{ textAlign: "center" }}>{player.username}</Text>
            <Text style={{ textAlign: "center" }}>Score: {player.score}</Text>
          </View>
        </Card.Content>
      </Card>
    </Animated.View>
  );
}
