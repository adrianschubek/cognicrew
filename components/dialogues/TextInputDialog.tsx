import React, { useState } from "react";
import { StyleSheet } from "react-native";
import {
  Dialog,
  Portal,
  Button,
  TextInput,
  useTheme,
} from "react-native-paper";
import { responsiveHeight } from "react-native-responsive-dimensions";

const TextInputDialog = ({ isVisible, onClose, onSubmit }) => {
  const theme = useTheme();
  const [text, setText] = useState("");

  const handleSubmit = () => {
    onSubmit(text);
    setText("");
    onClose();
  };

  return (
    <Portal>
      <Dialog visible={isVisible} onDismiss={onClose}>
        <Dialog.Title>Keyboard</Dialog.Title>
        <Dialog.Content>
          <TextInput
            onChangeText={setText}
            value={text}
            placeholder="Enter text here"
          />
          <Button mode="contained" onPress={handleSubmit} style={styles.button}>
            OK
          </Button>
        </Dialog.Content>
      </Dialog>
    </Portal>
  );
};

const styles = StyleSheet.create({
  button: {
    marginTop: responsiveHeight(1.3),
  },
});

export default TextInputDialog;
