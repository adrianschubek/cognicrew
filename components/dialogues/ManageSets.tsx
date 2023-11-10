import * as React from "react";
import { StyleSheet, View, ScrollView, Keyboard } from "react-native";
import {
  Button,
  Dialog,
  List,
  Portal,
  Text,
  TextInput,
  useTheme,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { useState } from "react";
import SearchWithList from "../common/SearchWithList";
import { useSets } from "../../utils/hooks";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { ManagementType } from "../../types/common";

export default function ManageSets({ showManageSets, close, type }) {
  const theme = useTheme();
  return (
    <Portal>
      <Dialog
        style={{ alignItems: "center" }}
        visible={showManageSets}
        onDismiss={() => {
          close();
          Keyboard.dismiss();
        }}
      >
        <SearchWithList
          type={type}
          mode="edit"
          searchPlaceholder={"Search for " + (type === ManagementType.FLASHCARD ? "flashcard" : "exercise") + " set"}
          creationOption={true}
        />
        <Dialog.Actions>
          <Button
            style={{ width: responsiveWidth(70) }}
            onPress={() => {
              close(), Keyboard.dismiss();
            }}
            mode="contained"
          >
            Done
          </Button>
        </Dialog.Actions>
      </Dialog>
    </Portal>
  );
}

const styles = StyleSheet.create({
  textInputStyle: {
    marginBottom: responsiveHeight(1),
    width: responsiveWidth(70),
  },
});
