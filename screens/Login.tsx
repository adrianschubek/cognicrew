import { useState } from "react";
import {
  TextInput,
  Text,
  Button,
  IconButton,
  Portal,
  Dialog,
} from "react-native-paper";
import { StatusBar } from "expo-status-bar";
import {
  StyleSheet,
  View,
  Image,
  Pressable,
  TouchableOpacity,
  KeyboardAvoidingView,
} from "react-native";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import PasswordForgotten from "../components/dialogues/PasswordForgotten";
import Register from "../components/dialogues/Register";
import { SafeAreaView } from "react-native-safe-area-context";
import { supabase } from "../supabase";
export default function Login({ navigation }) {
  const [text, setText] = useState("foo@bar.de");
  const [text2, setText2] = useState("foobar");
  const [showPasswordForgotten, setShowPasswordForgotten] = useState(false);
  const [showRegister, setShowRegister] = useState(false);
  const [loginDisabled, setLoginDisabled] = useState(false);
  const [error, setError] = useState(null);
  return (
    <SafeAreaView style={styles.container}>
      <StatusBar style="auto" />
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
          label="Username or E-mail address:"
          placeholder="Max Mustermann"
          value={text}
          onChangeText={(text) => setText(text)}
        />
        <TextInput
          style={[styles.dataInput, { marginTop: responsiveHeight(1) }]}
          label="Password"
          placeholder="your password"
          onSubmitEditing={async () => {
            setLoginDisabled(true);
            const { data } = await supabase.auth.signInWithPassword({
              email: text,
              password: text2,
            });
            if (data || error) {
              setError(error?.message ?? "Unknown error");
              setLoginDisabled(false);
            }
          }}
          secureTextEntry={true}
          value={text2}
          onChangeText={(text2) => setText2(text2)}
        />
        <View
          style={{ flexDirection: "row", marginTop: responsiveHeight(0.2) }}
        ></View>
        <TouchableOpacity
          style={{
            alignSelf: "flex-start",
            marginTop: responsiveHeight(0.5),
          }}
          onPress={() => {
            setShowPasswordForgotten(true);
          }}
        >
          <Text>Forgot password?</Text>
        </TouchableOpacity>
        <Button
          style={[styles.dataInput, { marginTop: responsiveHeight(1.5) }]}
          mode="contained"
          disabled={loginDisabled}
          onPress={async () => {
            setLoginDisabled(true);
            const { data, error } = await supabase.auth.signInWithPassword({
              email: text,
              password: text2,
            });
            if (data || error) {
              setError(error?.message ?? "Unknown error");
              setLoginDisabled(false);
            }
          }}
        >
          Login
        </Button>
        <Button
          style={[styles.dataInput, { marginTop: responsiveHeight(1.5) }]}
          mode="contained-tonal"
          onPress={() => {
            setShowRegister(true);
          }}
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
