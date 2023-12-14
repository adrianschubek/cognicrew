import * as React from "react";
import { StyleSheet, View } from "react-native";
import { TextInput, Text } from "react-native-paper";
import { useRef, useState } from "react";

export default function TimeSelection() {
  const minutesRef = useRef(null);
  const secondsRef = useRef(null);

  // Use separate states for minutes and seconds
  const [minutes, setMinutes] = useState("");
  const [seconds, setSeconds] = useState("");

  const handleTimeChange = (field, text) => {
    // Ensure that the input is in the format "00:00"
    const formattedText = text.replace(/[^0-9]/g, ""); // Remove non-numeric characters

    if (field === "minutes") {
      setMinutes(formattedText.slice(0, 2));
    } else if (field === "seconds") {
      setSeconds(formattedText.slice(0, 2));
    }
  };

  return (
    <React.Fragment>
      <Text style={styles.roundDurationStyle}> Round duration</Text>
      <View style={styles.timerContainer}>
        <TextInput
          label="Minutes"
          style={styles.timerInput}
          value={minutes}
          onChangeText={(text) => {
            handleTimeChange("minutes", text);
            if (text.length === 2) {
              secondsRef.current.focus();
            }
          }}
          ref={minutesRef}
        />
        <Text style={styles.timerSeparator}>:</Text>
        <TextInput
          label="Seconds"
          style={styles.timerInput}
          value={seconds}
          onChangeText={(text) => handleTimeChange("seconds", text)}
          ref={secondsRef}
        />
      </View>
    </React.Fragment>
  );
}

const styles = StyleSheet.create({
  roundDurationStyle: {
    fontSize: 16,
    marginBottom: -10,
    fontWeight: "bold",
  },
  timerContainer: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "center",
  },
  timerInput: {
    flex: 1,
    backgroundColor: null,
    marginBottom: 2,
  },
  timerSeparator: {
    fontSize: 20,
    fontWeight: "bold",
  },
});
