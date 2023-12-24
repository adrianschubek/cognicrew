import * as React from "react";
import { StyleSheet, View } from "react-native";
import { Dialog, Portal, Button } from "react-native-paper";
import { StrokeSettings } from "../learningRoom/DrawingSettings";
import { useWhiteboardStore } from "../../stores/WhiteboardStore";

/**
 * @deprecated delete this. useAlerts hook instead
 */
export default function CreateDrawing({ showDrawing, close }) {
  const { color, setColor, setStroke, stroke } = useWhiteboardStore();
  return (
    <>
      <Portal>
        <Dialog
          visible={showDrawing}
          onDismiss={close}
          style={{ flexDirection: "column" }}
        >
          <Dialog.Icon icon="pencil" />
          <Dialog.Title style={{ textAlign: "center" }}>Drawing</Dialog.Title>
          <Dialog.Content style={{ flexDirection: "column" }}>
            <StrokeSettings
              strokeWidth={stroke}
              currentColor={color}
              onChangeColor={setColor}
              onChangeStroke={setStroke}
            />
            <View style={{ flexDirection: "column" }}>
              <Button
                style={{ marginTop: 50 }}
                onPress={() => {
                  close();
                }}
              >
                Done
              </Button>
            </View>
          </Dialog.Content>
        </Dialog>
      </Portal>
    </>
  );
}
