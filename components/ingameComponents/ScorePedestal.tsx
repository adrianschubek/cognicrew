import { View } from "react-native";
import { Text, useTheme } from "react-native-paper";
import Animated, {
  Easing,
  useAnimatedStyle,
  useSharedValue,
  withDelay,
  withTiming,
} from "react-native-reanimated";
import { getRandomColor } from "../../utils/common";
import ProfilePictureAvatar from "../profile/ProfilePictureAvatar";
import { useEffect } from "react";

export default function ScorePedestal(props: {
  player: {
    id: string;
    username: string;
    score: number;
    currentCorrect: boolean;
    currentTimeNeeded: number;
    position?: number;
  };
  playerAmount: number;
  maxheight: number;
}) {
  const theme = useTheme();
  const { player, playerAmount, maxheight } = props;
  const height = useSharedValue(0);
  const opacity = useSharedValue(0);
  useEffect(() => {
    opacity.value = 1;
    height.value = (player.score < 10 ? 10 : player.score) * 2 * maxheight;
  }, []);
  const animatedStyles = useAnimatedStyle(() => {
    return {
      height: withDelay(
        400 * (playerAmount - player.position),
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
        400 + 400 * (playerAmount - player.position),
        withTiming(opacity.value, {
          duration: 1000,
        }),
      ),
    };
  });
  return (
    <View
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
      </Animated.View>
      <Animated.View
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
}
