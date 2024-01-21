import { StyleProp, ViewStyle, View } from "react-native";
import { Card, Text, useTheme } from "react-native-paper";

export default function AnswerCard(props: {
  answer: {
    answer: string;
    explanation?: string;
    percentage: number;
    isCorrect: boolean;
  };
  userInput: string;
  numberOfLines?: number;
  style?: StyleProp<ViewStyle>;
}) {
  const theme = useTheme();
  const { answer, userInput, numberOfLines, style } = props;
  return (
    <View
      style={[
        {
          width: "100%",
          height: "auto",
        },
        style,
      ]}
    >
      <Card
        mode="outlined"
        style={[
          answer.isCorrect
            ? { backgroundColor: "#4CAF50" }
            : { backgroundColor: theme.colors.elevation.level2 },
          answer.answer.trim() === userInput.trim()
            ? { borderColor: theme.colors.primary }
            : {
                borderColor: theme.colors.onSurfaceDisabled,
              },
        ]}
      >
        <Card.Content
          style={{
            marginLeft: 5,
            flexDirection: "row",
            justifyContent: "space-between",
            alignItems: "center",
            gap: 5,
          }}
        >
          <Text
            variant="titleMedium"
            numberOfLines={numberOfLines}
            style={[
              {
                flex: 6,
                textAlign: "left",
                textAlignVertical: "center",
              },
              answer.isCorrect
                ? { color: theme.colors.onBackground }
                : { color: theme.colors.onErrorContainer },
            ]}
          >
            {answer.answer.trim()}
          </Text>
          <Text
            variant="titleMedium"
            style={[
              {
                flex: 1,
                textAlignVertical: "center",
              },
              answer.isCorrect
                ? { color: theme.colors.onBackground }
                : { color: theme.colors.onErrorContainer },
            ]}
          >
            {" "}
            {answer.percentage}
          </Text>
        </Card.Content>
      </Card>
    </View>
  );
}
