import React, { useState } from "react";
import {
  Portal,
  Dialog,
  Button,
  TextInput,
  Text,
  IconButton,
} from "react-native-paper";
import { StyleSheet, View } from "react-native";
import {
  responsiveFontSize,
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";

export default function Register({ showRegister, close }) {
  const [text3, setText3] = React.useState("");
  const [emailInputPasswordForgotten, setEmailInputPasswordForgotten] =
    React.useState("");
  const [text5, setText5] = React.useState("");
  const [text6, setText6] = React.useState("");
  return (
    <Portal>
      <Dialog
        style={{ alignItems: "center" }}
        visible={showRegister}
        onDismiss={() => close()}
      >
        <Dialog.Content style={{}}>
          <Text>
            If you havent already got an account please fill in the form below:
          </Text>
          <TextInput
            style={styles.textInputStyle}
            label="Username:"
            value={text3}
            onChangeText={(text3) => setText3(text3)}
          />
          <TextInput
            style={styles.textInputStyle}
            label="E-mail:"
            inputMode="email"
            keyboardType="email-address"
            placeholder="max-mustermann@gmail.com"
            value={emailInputPasswordForgotten}
            onChangeText={(emailInputPasswordForgotten) =>
              setEmailInputPasswordForgotten(emailInputPasswordForgotten)
            }
          />
          <TextInput
            style={styles.textInputStyle}
            label="Password:"
            placeholder="angola15"
            value={text5}
            secureTextEntry={true}
            onChangeText={(text5) => setText5(text5)}
          />
          <TextInput
            style={styles.textInputStyle}
            label="Repeat password:"
            placeholder="angola15"
            value={text6}
            secureTextEntry={true}
            onChangeText={(text6) => setText6(text6)}
          />
          <View style={{ alignItems: "center", alignSelf: "flex-start" }}>
            <Text style={{ marginTop: responsiveHeight(2) }}>Upload icon:</Text>
            <IconButton
              style={{}}
              icon="file-png-box"
              size={responsiveFontSize(7)}
            />
          </View>
        </Dialog.Content>
        <Dialog.Actions style={{ alignSelf: "flex-end" }}>
          <Button mode="contained" onPress={() => close()}>
            Submit form
          </Button>
        </Dialog.Actions>
      </Dialog>
    </Portal>
  );
}

const styles = StyleSheet.create({
  textInputStyle: {
    marginTop: responsiveHeight(1),
  },
});
