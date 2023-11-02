import React, { useState } from "react";
import { Portal, Dialog, Button, TextInput, Text } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";

export default function PasswordForgotten({ showPasswordForgotten, close }) {
  const [emailInputPasswordForgotten, setEmailInputPasswordForgotten] =
    React.useState("");
  return (
    <Portal>
      <Dialog
        style={{ alignItems: "center" }}
        visible={showPasswordForgotten}
        onDismiss={() => close()}
      >
        <Dialog.Content>
          <Text>
            Please insert your e-mail address and a mail will be sent to your
            address with the option to change your password.
          </Text>
          <TextInput
            style={{ marginTop: responsiveHeight(2) }}
            label="E-mail:"
            inputMode="email"
            keyboardType="email-address"
            placeholder="max-mustermann@gmail.com"
            value={emailInputPasswordForgotten}
            onChangeText={(emailInputPasswordForgotten) =>
              setEmailInputPasswordForgotten(emailInputPasswordForgotten)
            }
          />
        </Dialog.Content>
        <Dialog.Actions>
          <Button
            style={{ width: responsiveWidth(70) }}
            onPress={() => close()}
            mode="contained"
          >
            Send new password
          </Button>
        </Dialog.Actions>
      </Dialog>
    </Portal>
  );
}
