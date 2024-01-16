import React from "react";
import { StyleSheet } from "react-native";
import { MaterialIcons } from "@expo/vector-icons";
export default function Star(props: { starSelected: boolean; size?: number }) {
  const { starSelected, size } = props;
  return (
    <MaterialIcons
      name={starSelected ? "star" : "star-border"}
      size={size || 32}
      style={starSelected ? styles.starSelected : styles.starUnselected}
    />
  );
}
const styles = StyleSheet.create({
  starUnselected: {
    color: "#aaa",
  },
  starSelected: {
    color: "#ffb300",
  },
});
