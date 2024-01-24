import { useEffect, useState } from "react";
import { View, Text } from "react-native";
import { TextInput, useTheme } from "react-native-paper";

export default function PrioritySelector(props: {
  priority: number;
  sendPriority: (priority: number) => void;
  refetchedPrio: number;
}) {
  const theme = useTheme();
  const {
    priority,
    sendPriority,
    refetchedPrio,
  } = props;
  const [priorityStringified, setPriorityStringified] = useState<string>(
    priority < 10 ? "0" + priority : priority.toString(),
  );
  function stringyfyPriority(priority: number) {
    return priority < 10 ? "0" + priority : priority.toString();
  }
  const isInvalid = (number: number) => {
    return number < 0 || number > 10;
  };
  useEffect(() => {
    if (refetchedPrio === null) return;
    setPriorityStringified(stringyfyPriority(refetchedPrio));
  }, [refetchedPrio]);

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
          let prioNumber = parseInt(prio);
          if (!isInvalid(prioNumber)) {
            prio !== "" && sendPriority(prioNumber);
          }
          setPriorityStringified(prio);
        }}
        onBlur={() => {
          setPriorityStringified(
            priorityStringified.length === 1
              ? "0" + priorityStringified
              : priorityStringified,
          );
        }}
      />
    </>
  );
}
