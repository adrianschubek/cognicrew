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
  const { email, password, setEmail, setPassword, rememberMe, setRememberMe } = usePreferencesStore();
  // const [text, setText] = useState("foo@bar.de");
  // const [text2, setText2] = useState("foobar");
  const [showPasswordForgotten, setShowPasswordForgotten] = useState(false);
  const [showRegister, setShowRegister] = useState(false);
  const [loginDisabled, setLoginDisabled] = useState(false);

  const { error: errorAlert, alert, warning } = useAlerts();

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
          placeholder="Max Mustermann"
          value={email}
          onChangeText={(text) => setEmail(text)}
        />
        <TextInput
          style={[styles.dataInput, { marginTop: responsiveHeight(1) }]}
          label="Password"
          placeholder="your password"
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
        <View
          style={{ flexDirection: "row", marginTop: responsiveHeight(0.2) }}
        >
          <TouchableOpacity
            style={{
              alignSelf: "flex-start",
              marginTop: responsiveHeight(0.5),
            }}
            onPress={() => {
              setShowPasswordForgotten(true);
            }}
          >
            <Button>Forgot password?</Button>
          </TouchableOpacity>
          <TouchableOpacity
            style={{
              display: "flex",
              alignItems: "center",
              flexDirection: "row",
              marginLeft: "auto",
              marginTop: responsiveHeight(0.5),
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
          style={[styles.dataInput, { marginTop: responsiveHeight(1.5) }]}
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
          style={[styles.dataInput, { marginTop: responsiveHeight(1.5) }]}
          mode="contained-tonal"
          onPress={() => {
            // setShowRegister(true); /* TODO remove */

            alert({
              title: "Create your account",
              message: "Please enter your data",
              okAction(values) {
                alert({
                  title: "Confirm account",
                  message:
                    "Please enter the verification code you received in your email.",
                  dismissable: false,
                  okText: "Confirm",
                  cancelText: "Cancel",
                  fields: [
                    {
                      label: "Verification Code",
                      type: "number",
                    },
                  ],
                });
              },
            });
          }}
          testID="register-button"
        >
          Register
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
