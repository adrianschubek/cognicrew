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
import { supabase } from "../../supabase";
import { useAlerts } from "../../utils/hooks";

export default function Register({ showRegister, close }) {
  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [password2, setPassword2] = useState("");
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(false);
  const [success, setSuccess] = useState(false);

  const validators: ((input: string) => boolean)[] = [
    (username) => username.length >= 4 && username.length <= 24,
    (email) => email.length > 0 && email.includes("@") && email.length <= 64,
    (password) => password.length >= 8 && password.length <= 32,
    (password2) => password2 === password,
  ];

  const { error: errorAlert, success: successAlert } = useAlerts();

  const createAccount = async () => {
    setLoading(true);
    const { data, error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: {
          username,
        },
      },
    });

    if (error) {
      errorAlert(error?.message ?? "Unknown error", "Sign up failed");
    } else {
      successAlert(
        "Account created successfully. You may login now.",
        "Account created",
      );
    }
    setLoading(false);
  };

  return (
    <>
      <Portal>
        <Dialog
          style={{ alignItems: "center" }}
          visible={showRegister}
          onDismiss={() => close()}
        >
          <Dialog.Content style={{}}>
            <Text>
              If you havent already got an account please fill in the form
              below:
            </Text>
            <TextInput
              style={styles.textInputStyle}
              label="Username"
              value={username}
              error={username.length > 0 && !validators[0](username)}
              onChangeText={(text3) => setUsername(text3)}
              testID="username-input-register"
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
              testID="email-input-register"
            />
            <TextInput
              style={styles.textInputStyle}
              label="Password"
              value={password}
              secureTextEntry={true}
              error={password.length > 0 && !validators[2](password)}
              onChangeText={(text5) => setPassword(text5)}
              testID="password-input-register"
            />
            <TextInput
              style={styles.textInputStyle}
              label="Repeat Password"
              value={password2}
              secureTextEntry={true}
              error={password2.length > 0 && !validators[3](password2)}
              onChangeText={(text6) => setPassword2(text6)}
              testID="password2-input-register"
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
              testID="register-button-modal"
            >
              Sign up
            </Button>
          </Dialog.Content>
        </Dialog>
      </Portal>
      <Portal>
        <Dialog visible={error} onDismiss={() => setError(null)}>
          <Dialog.Icon icon="alert" />
          <Dialog.Title>Error</Dialog.Title>
          <Dialog.Content>
            <Text variant="bodyMedium">{error}</Text>
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={() => setError(null)}>OK</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
      <Portal>
        <Dialog
          visible={success}
          onDismiss={() => {
            setSuccess(false);
            close();
          }}
        >
          <Dialog.Icon icon="check" />
          <Dialog.Title>Success</Dialog.Title>
          <Dialog.Content>
            <Text variant="bodyMedium">
              Account created successfully. You may login now.
            </Text>
          </Dialog.Content>
          <Dialog.Actions>
            <Button
              onPress={() => {
                setSuccess(false);
                close();
              }}
            >
              OK
            </Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
    </>
  );
}

const styles = StyleSheet.create({
  textInputStyle: {
    marginTop: responsiveHeight(1),
  },
});
