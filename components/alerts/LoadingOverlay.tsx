import React from "react";
import { SafeAreaView } from "react-native-safe-area-context";
import {
  ActivityIndicator,
  MD3Colors,
  Text,
  useTheme,
} from "react-native-paper";

export default function LoadingOverlay({ visible }: { visible: boolean }) {
  const theme = useTheme();

  return (
    <SafeAreaView
      style={{
        position: "absolute",
        zIndex: 9999,
        backgroundColor: theme.colors.backdrop,
        width: "100%",
        height: "100%",
        opacity: 1,
        display: visible ? "flex" : "none",
        alignContent: "center",
        justifyContent: "center",
        alignItems: "center",
      }}
    >
      <ActivityIndicator size={"large"} animating={true} color={theme.colors.onBackground} />
    </SafeAreaView>
  );
}
