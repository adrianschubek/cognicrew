import { useState } from "react";
import { TextInput, Text, Button, Checkbox, Icon } from "react-native-paper";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, Image, TouchableOpacity } from "react-native";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import PasswordForgotten from "../components/dialogues/PasswordForgotten";
import Register from "../components/dialogues/Register";
import { SafeAreaView } from "react-native-safe-area-context";
import { supabase } from "../supabase";
import { useAlerts } from "../utils/hooks";
import { usePreferencesStore } from "../stores/PreferencesStore";
export default function Login({ navigation }) {
  // TODO: only save password when "remember me" is checked
  const { email, password, setEmail, setPassword, rememberMe, setRememberMe } =
    usePreferencesStore();
  // const [text, setText] = useState("foo@bar.de");
  // const [text2, setText2] = useState("foobar");
  const [showPasswordForgotten, setShowPasswordForgotten] = useState(false);
  const [showRegister, setShowRegister] = useState(false);
  const [loginDisabled, setLoginDisabled] = useState(false);

  const { error: errorAlert, alert, warning, success } = useAlerts();

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar style="auto" />
      <Register
        showRegister={showRegister}
        close={() => setShowRegister(false)}
      />
      <PasswordForgotten
        showPasswordForgotten={showPasswordForgotten}
        close={() => setShowPasswordForgotten(false)}
      />
      <View style={styles.upperContainer}>
        <Image
          source={require("../assets/icon.png")}
          style={{
            width: responsiveFontSize(15),
            height: responsiveFontSize(15),
          }}
        />
      </View>
      <View style={styles.textContainer}>
        <Text style={styles.titleText}>Welcome to CogniCrew!</Text>
        <Text style={styles.baseText}>
          Your favorite place to supercharge {"\n"}
          your learning, collaborate with peers, and {"\n"}
          unlock your full potential. {"\n"}
        </Text>
      </View>
      <View style={styles.loginContainer}>
        <TextInput
          style={styles.dataInput}
          label="E-Mail"
          value={email}
          onChangeText={(text) => setEmail(text)}
        />
        <TextInput
          style={[styles.dataInput, { marginTop: 8 }]}
          label="Password"
          onSubmitEditing={async () => {
            setLoginDisabled(true);
            const { error, data } = await supabase.auth.signInWithPassword({
              email,
              password,
            });
            if (error)
              errorAlert({
                message: error?.message ?? "Unknown error",
              });
            if (data || error) {
              setLoginDisabled(false);
            }
          }}
          secureTextEntry={true}
          value={password}
          onChangeText={(text2) => setPassword(text2)}
        />
        <View style={{ flexDirection: "row", marginTop: 2 }}>
          <TouchableOpacity
            style={{
              alignSelf: "flex-start",
              marginTop: 4,
            }}
            onPress={() => {
              //setShowPasswordForgotten(true);
            }}
          >
            <Button
              onPress={() => {
                alert({
                  icon: "lock-reset",
                  title: "Reset password",
                  message:
                    "Please insert your e-mail address and a mail will be sent to your address with the option to change your password.",
                  okText: "Next",
                  cancelText: "Cancel",
                  async okAction(values) {
                    const { data, error } =
                      await supabase.auth.resetPasswordForEmail(values[0]);
                    if (error) return error?.message ?? "Unknown error";
                    alert({
                      icon: "account-check",
                      title: "Confirm Email-address",
                      message:
                        "Please enter the verification code you received in your email.",
                      dismissable: false,
                      okText: "Confirm",
                      async okAction(verification) {
                        const { data, error } = await supabase.auth.verifyOtp({
                          email: values[0],
                          token: verification[0],
                          type: "recovery",
                        });
                        //console.log(data, error);
                        if (error) return error?.message ?? "Unknown error";
                        else {
                          return alert({
                            cover: true,
                            icon: "lock-reset",
                            title: "Reset password",
                            message: "Enter your new password:",
                            async okAction(password) {
                              const { data, error } =
                                await supabase.auth.updateUser({
                                  password: password[0],
                                });
                              if (error)
                                return error?.message ?? "Unknown error";
                              success({
                                title: "Password reset",
                                message: "Password reset successfully!",
                              });
                            },
                            fields: [
                              {
                                label: "Password",
                                type: "password",
                                required: true,
                                validator(value, allValues) {
                                  return value.length >= 8;
                                },
                                errorText:
                                  "Password must be at least 8 characters long.",
                              },
                              {
                                label: "Confirm Password",
                                type: "password",
                                required: true,
                                validator(value, allValues) {
                                  return value === allValues[0];
                                },
                                errorText: "Passwords do not match.",
                              },
                            ],
                          });
                        }
                      },
                      fields: [
                        {
                          label: "Verification Code",
                          type: "number",
                        },
                        {
                          label: "resend code",
                          type: "button",
                          action: async () => {
                            const { data, error } = await supabase.auth.resend({
                              type: "email_change",
                              email: values[0],
                            });
                            if (error) return error?.message ?? "Unknown error";
                            return "";
                          },
                        },
                      ],
                    });
                  },
                  fields: [
                    {
                      label: "E-Mail",
                      type: "text",
                      required: true,
                      validator(value) {
                        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
                      },
                      errorText: "Please enter a valid email address.",
                    },
                  ],
                });
              }}
              testID="register-button"
            >
              Forgot password?
            </Button>
          </TouchableOpacity>
          <TouchableOpacity
            style={{
              display: "flex",
              alignItems: "center",
              flexDirection: "row",
              marginLeft: "auto",
              marginTop: 4,
            }}
            onPress={() => {
              if (!rememberMe) {
                warning({
                  title: "Remember me",
                  message:
                    "This will save your email and password in the app. Only use this feature on your personal device.",
                  okText: "Save",
                  cancelText: "Don't save",
                  okAction() {
                    setRememberMe(true);
                  },
                });
              } else {
                setRememberMe(false);
                setEmail("");
                setPassword("");
              }
            }}
          >
            <Text>Remember me</Text>
            <Checkbox
              status={rememberMe ? "checked" : "unchecked"}
              onPress={() => setRememberMe(!rememberMe)}
            ></Checkbox>
          </TouchableOpacity>
        </View>
        <Button
          style={[styles.dataInput, { marginTop: 12 }]}
          mode="contained"
          disabled={loginDisabled}
          onPress={async () => {
            setLoginDisabled(true);
            const { data, error } = await supabase.auth.signInWithPassword({
              email,
              password,
            });
            if (error) errorAlert({ message: error.message });
            if (data || error) {
              setLoginDisabled(false);
            }
          }}
          testID="login-button"
        >
          Login
        </Button>
        <Button
          style={[styles.dataInput, { marginTop: 12 }]}
          mode="contained-tonal"
          onPress={() => {
            alert({
              icon: "account-plus",
              title: "Create your account",
              message: "Please enter your data",
              dismissable: false,
              okText: "Next",
              cancelText: "Cancel",
              async okAction(values) {
                const { data, error } = await supabase.auth.signUp({
                  email: values[1],
                  password: values[2],
                  options: {
                    data: {
                      username: values[0],
                    },
                  },
                });

                if (error) return error?.message ?? "Unknown error";

                alert({
                  icon: "account-check",
                  title: "Confirm account",
                  message:
                    "Please enter the verification code you received in your email.",
                  dismissable: false,
                  okText: "Confirm",
                  async okAction(verification) {
                    const { data, error } = await supabase.auth.verifyOtp({
                      email: values[1],
                      token: verification[0],
                      type: "email",
                    });
                    if (error) return error?.message ?? "Unknown error";
                    success({
                      title: "Account created",
                      message: "Account created successfully!",
                    });
                  },
                  fields: [
                    {
                      label: "Verification Code",
                      type: "number",
                    },
                    {
                      label: "resend code",
                      type: "button",
                      action: async () => {
                        const { data, error } = await supabase.auth.resend({
                          type: "email_change",
                          email: values[1],
                        });
                        if (error) return error?.message ?? "Unknown error";
                        return "";
                      },
                    },
                  ],
                });
              },
              fields: [
                {
                  label: "Username",
                  type: "text",
                  required: true,
                  validator(value, allValues) {
                    return (
                      value.length < 32 &&
                      value.length > 4 &&
                      /^[a-zA-Z0-9_]+$/.test(value)
                    );
                  },
                  errorText:
                    "Username must be between 4 and 32 characters long and may only contain letters, numbers and underscores.",
                },
                {
                  label: "E-Mail",
                  type: "text",
                  required: true,
                  validator(value, allValues) {
                    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
                  },
                  errorText: "Please enter a valid email address.",
                },
                {
                  label: "Password",
                  type: "password",
                  required: true,
                  validator(value, allValues) {
                    return value.length >= 8;
                  },
                  errorText: "Password must be at least 8 characters long.",
                },
                {
                  label: "Confirm Password",
                  type: "password",
                  required: true,
                  validator(value, allValues) {
                    return value === allValues[2];
                  },
                  errorText: "Passwords do not match.",
                },
              ],
            });
          }}
          testID="register-button"
        >
          Sign up
        </Button>
      </View>
    </SafeAreaView>
  );
}
const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
  upperContainer: {
    flex: 0,
    alignItems: "flex-start",
    flexDirection: "row",
    justifyContent: "space-between",
    width: responsiveWidth(100),
    marginLeft: responsiveWidth(5),
  },
  textContainer: {
    flex: 1,
    marginTop: responsiveHeight(10),
  },
  loginContainer: {
    flex: 3,
  },
  baseText: {
    fontSize: responsiveFontSize(2.2),
  },
  titleText: {
    fontSize: responsiveFontSize(3),
    fontWeight: "bold",
  },
  dataInput: {
    width: responsiveWidth(80),
  },
});
