import { FC } from "react";
import { View } from "react-native";

export const StrokeView = ({ color, size }) => {
  return (
    <View
      style={{
        backgroundColor: color,
        width: size,
        height: size,
        borderRadius: size,
      }}
    />
  );
};
