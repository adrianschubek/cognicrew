import { useEffect, useState } from "react";
import { View, Text } from "react-native";
import { TextInput, useTheme } from "react-native-paper";

export default function PrioritySelector(props: {
  priority: number;
  setPriority: (priority: number) => void;
  onStartEditing: () => any;
  onFinishEditing: () => any;
}) {
  const theme = useTheme();
  const { priority, setPriority, onStartEditing, onFinishEditing } = props;
  const [priorityStringified, setPriorityStringified] = useState<string>("00");
  function isBetweenZeroAndTen(number: number) {
    return number >= 0 && number <= 10;
  }
  const isInvalid = (number: number) => {
    return !isBetweenZeroAndTen(number);
  };
  const addZeroWhenNecessary = (number: number) => {
    return number < 10 ? "0" + number : number.toString();
  };
  useEffect(() => {
    if (!priority) return;
    setPriority(priority);
    priority < 10
      ? setPriorityStringified("0" + priority.toString())
      : setPriorityStringified(priority.toString());
  }, [priority]);
  return (
    <>
      <View
        style={{
          flexDirection: "column",
          alignSelf: "center",
          justifyContent: "center",
        }}
      >
        <Text
          style={{
            opacity: 0.7,
            marginRight: 8,
            color: theme.colors.onBackground,
          }}
        >
          Priority:
        </Text>
        <Text
          style={{
            opacity: 0.7,
            marginRight: 8,
            color: theme.colors.onBackground,
          }}
        >
          0-10
        </Text>
      </View>
      <TextInput
        label=""
        mode="outlined"
        value={priorityStringified}
        multiline={false}
        maxLength={2}
        error={isInvalid(parseInt(priorityStringified))}
        outlineColor={theme.colors.primary}
        inputMode="numeric"
        style={{ backgroundColor: null, width: 50, flex: 0 }}
        contentStyle={{}}
        onChangeText={(prio) => {
          setPriorityStringified(prio);
        }}
        onFocus={onStartEditing}
        onBlur={() => {
          let prioNumber = parseInt(priorityStringified);
          priorityStringified !== "" && !isInvalid(prioNumber)
            ? priorityStringified.length === 2 && prioNumber < 10
              ? setPriority(parseInt(priorityStringified[1]))
              : setPriority(prioNumber)
            : setPriorityStringified(addZeroWhenNecessary(priority));

          !isInvalid(prioNumber) &&
            setPriorityStringified(addZeroWhenNecessary(prioNumber));
          onFinishEditing();
        }}
      />
    </>
  );
}
