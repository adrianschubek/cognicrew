import * as React from "react";
import { StyleSheet, View } from "react-native";
import {
  Dialog,
  Portal,
  Button,
} from "react-native-paper";
import { StrokeSettings } from "../learningRoom/DrawingSettings";
import { useWhiteboardStore } from "../../stores/WhiteboardStore";

export default function CreateDrawing({ showDrawing, close }) {
  const { color, setColor, setStroke, stroke } = useWhiteboardStore();
  return (
    <>
      <Portal>
        <Dialog visible={showDrawing} onDismiss={close} style={styles.all}>
          <Dialog.Icon icon="pencil"/>
          <Dialog.Title style={styles.title}>Drawing</Dialog.Title>
          <Dialog.Content style ={styles.container}>
            <StrokeSettings
              strokeWidth={stroke}
              currentColor={color}
              onChangeColor={setColor}
              onChangeStroke={setStroke}
            />
            <View style={styles.container}>
            <Button style={styles.done}
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

const styles = StyleSheet.create({
  title: {
    textAlign: 'center',
  },
  container: {
    flexDirection: "column",
  },
  all: {
    flexDirection: "column",
  },
  done: {
    marginTop: 50
  }
});
