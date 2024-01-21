import { StyleProp, Touchable, View, ViewStyle } from "react-native";
import { Card, Icon, Text, useTheme } from "react-native-paper";
import { ScreenState } from "../../functions/rooms";
import { PublicRoomState } from "../../functions/rooms";
import { TouchableOpacity } from "react-native-gesture-handler";
export default function ExerciseRadioButton(props: {
  option: [string, number];
  index: number;
  disabled: boolean;
  checked: number[];
  roomState: PublicRoomState;
  numberOfLines?: number;
  style?: StyleProp<ViewStyle>;
  onPress: () => void;
}) {
  const theme = useTheme();
  const {
    roomState,
    index,
    disabled,
    checked,
    option,
    numberOfLines,
    style,
    onPress,
  } = props;
  return (
    <TouchableOpacity
      disabled={disabled}
      onPress={onPress}
      style={[
        {
          margin: 10,
          marginVertical: 5,
          borderRadius: 10,
        },
        style,
      ]}
    >
      <Card
        mode="contained"
        style={[
          roomState.screen === ScreenState.ROUND_SOLUTION
            ? {
                borderColor: checked.includes(option[1])
                  ? theme.colors.primary
                  : undefined,
                borderWidth: checked.includes(option[1]) ? 3 : 0,
                backgroundColor:
                  roomState.userAnswers[option[1]].isCorrect === true
                    ? /* theme.colors.primaryContainer */ "#4CAF50" /* theme.colors.primaryContainer */
                    : theme.colors.elevation.level2,
              }
            : {
                backgroundColor: checked.includes(option[1])
                  ? theme.colors.primary
                  : theme.colors.secondaryContainer,
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
              {
                color:
                  roomState.screen === ScreenState.ROUND_SOLUTION
                    ? roomState.userAnswers[option[1]].isCorrect === true
                      ? theme.colors.onPrimaryContainer
                      : theme.colors.onErrorContainer
                    : checked.includes(option[1])
                    ? theme.colors.onPrimary
                    : theme.colors.onSecondaryContainer,
              },
            ]}
          >
            {`${String.fromCharCode(65 + index)}) ${option[0]}`}
          </Text>
          <Text
            variant="titleMedium"
            style={[
              {
                flex: 1,
                textAlignVertical: "center",
                textAlign: "center",
              },
              {
                color:
                  roomState.screen === ScreenState.ROUND_SOLUTION
                    ? roomState.userAnswers[option[1]].isCorrect === true
                      ? theme.colors.onPrimaryContainer
                      : theme.colors.onErrorContainer
                    : checked.includes(option[1])
                    ? theme.colors.onPrimary
                    : theme.colors.onSecondaryContainer,
              },
            ]}
          >
            {" "}
            {roomState.screen === ScreenState.ROUND_SOLUTION &&
              roomState.userAnswers[option[1]].percentage}
          </Text>
          <View style={{ width: 28, height: 28 }}>
            <Icon
              size={28}
              source={checked.includes(option[1]) ? "check" : ""}
              color={theme.colors.onPrimaryContainer}
            />
          </View>
        </Card.Content>
      </Card>
    </TouchableOpacity>
  );
}
