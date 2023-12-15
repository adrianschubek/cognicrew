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
import { useEffect, useState } from "react";
import SearchWithList from "../common/SearchWithList";
import { useAlerts } from "react-native-paper-fastalerts";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { ManagementType } from "../../types/common";

/**
 * @deprecated delete this. useAlerts hook instead
 */
export default function ManageSets(props: {
  showManageSets: boolean;
  close: () => any;
  type: ManagementType;
}) {
  const theme = useTheme();
  const [creationOptionFocused, setCreationOptionFocused] =
    useState<boolean>(false);
  const [showManageSets, setShowManageSets] = useState<boolean>(
    props.showManageSets,
  );
  useEffect(() => {
    setShowManageSets(props.showManageSets);
  }, [props.showManageSets]);
  const { confirm } = useAlerts();
  return (
    <Portal>
      <Dialog
        style={{ alignItems: "center" }}
        visible={showManageSets}
        onDismiss={() => {
          props.close();
          Keyboard.dismiss();
        }}
      >
        <SearchWithList
          type={props.type}
          mode="edit"
          searchPlaceholder={
            "Search for " +
            (props.type === ManagementType.FLASHCARD
              ? "flashcard"
              : "exercise") +
            " set"
          }
          creationOption={true}
          creationOptionFocused={(boolean) => {
            setCreationOptionFocused(boolean);
          }}
          close={props.close}
        />
        <Dialog.Actions>
          <Button
            style={{ width: responsiveWidth(70), marginTop: 10 }}
            onPress={() => {
              creationOptionFocused
                ? (setShowManageSets(false),
                  confirm({
                    icon: "alert-circle",
                    title: "Are you sure to leave?",
                    message:
                      "Your currently entered set will be lost. Please make sure to save it before pressing 'Done'",
                    okText: "Accept",
                    cancelText: "Cancel",
                    cancelAction: () => {
                      setShowManageSets(true);
                    },
                    okAction: () => {
                      props.close(), Keyboard.dismiss();
                    },
                  }),
                  setCreationOptionFocused(false))
                : props.close(),
                Keyboard.dismiss();
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
