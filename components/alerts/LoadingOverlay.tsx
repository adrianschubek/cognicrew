import { ActivityIndicator, Portal, useTheme } from "react-native-paper";
import { View } from "react-native";

export default function LoadingOverlay({ visible }: { visible: boolean }) {
  const theme = useTheme();

  return (
    <Portal>
      <View
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
        <ActivityIndicator
          size={"large"}
          animating={true}
          color={theme.colors.onBackground}
        />
      </View>
    </Portal>
  );
}
