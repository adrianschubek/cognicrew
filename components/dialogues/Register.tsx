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
} from "react-native-responsive-dimensions";

export default function Register({ showRegister, close }) {
  const [username, setUsername] = useState("test1111");
  const [email, setEmail] = useState("a@b.c");
  const [password, setPassword] = useState("password");
  const [password2, setPassword2] = useState("password");

  const validators: ((input: string) => boolean)[] = [
    (username) => username.length >= 4 && username.length <= 24,
    (email) => email.length > 0 && email.includes("@") && email.length <= 64,
    (password) => password.length >= 8 && password.length <= 32,
    (password2) => password2 === password,
  ];

  const createAccount = async () => {
    alert("Not implemented yet");
  };

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
            label="Username"
            value={username}
            error={username.length > 0 && !validators[0](username)}
            onChangeText={(text3) => setUsername(text3)}
          />
          <TextInput
            style={styles.textInputStyle}
            label="E-Mail"
            inputMode="email"
            keyboardType="email-address"
            error={email.length > 0 && !validators[1](email)}
            value={email}
            onChangeText={(emailInputPasswordForgotten) =>
              setEmail(emailInputPasswordForgotten)
            }
          />
          <TextInput
            style={styles.textInputStyle}
            label="Password"
            value={password}
            secureTextEntry={true}
            error={password.length > 0 && !validators[2](password)}
            onChangeText={(text5) => setPassword(text5)}
          />
          <TextInput
            style={styles.textInputStyle}
            label="Repeat Password"
            value={password2}
            secureTextEntry={true}
            error={password2.length > 0 && !validators[3](password2)}
            onChangeText={(text6) => setPassword2(text6)}
          />
          <View style={{ alignItems: "center", alignSelf: "flex-start" }}>
            <Text style={{ marginTop: responsiveHeight(1) }}>
              Profile picture
            </Text>
            <IconButton
              style={{}}
              icon="file-png-box"
              size={responsiveFontSize(7)}
              disabled
              onPress={() => {}}
            />
          </View>
          <Button
            mode="contained"
            disabled={
              !validators[0](username) ||
              !validators[1](email) ||
              !validators[2](password) ||
              !validators[3](password2)
            }
            onPress={createAccount}
          >
            Sign up
          </Button>
        </Dialog.Content>
      </Dialog>
    </Portal>
  );
}

const styles = StyleSheet.create({
  textInputStyle: {
    marginTop: responsiveHeight(1),
  },
});
