/**
 * UploadFile - Component for the file upload dialog.
 * @param {object} props - Contains properties for visibility control (visible), dismissal (onDismiss) and submission (onSubmit) actions.
 */

import React, { useState } from "react";
import { View, Keyboard, StyleSheet } from "react-native";
import { Dialog, Button, TextInput, Portal } from "react-native-paper";
import {
  responsiveWidth,
  responsiveHeight,
} from "react-native-responsive-dimensions";

export default function UploadFile({ visible, onDismiss, onSubmit }) {
  const [fileName, setFileName] = useState("");
  const [fileType, setFileType] = useState("");

  /**
   * handleSubmit - Submits the new file information and resets the form.
   */

  const handleSubmit = () => {
    onSubmit({ name: fileName, type: fileType });
    setFileName("");
    setFileType("");
    onDismiss();
    Keyboard.dismiss();
  };

  return (
    <Portal>
      <Dialog
        style={styles.dialogStyle}
        visible={visible}
        onDismiss={onDismiss}
      >
        <Dialog.Title>Upload File</Dialog.Title>
        <Dialog.Content>
          <TextInput
            style={styles.textInputStyle}
            label="File Name:"
            value={fileName}
            onChangeText={setFileName}
          />
          <TextInput
            style={styles.textInputStyle}
            label="File Type:"
            value={fileType}
            onChangeText={setFileType}
          />
        </Dialog.Content>
        <Dialog.Actions>
          <Button onPress={onDismiss}>Cancel</Button>
          <Button onPress={handleSubmit} mode="contained">
            Upload
          </Button>
        </Dialog.Actions>
      </Dialog>
    </Portal>
  );
}

const styles = StyleSheet.create({
  dialogStyle: {
    alignItems: "center",
  },
  textInputStyle: {
    marginBottom: responsiveHeight(1),
    width: responsiveWidth(70),
  },
});
