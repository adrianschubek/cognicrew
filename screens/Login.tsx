import * as React from "react";
import { useState } from "react";
import {
  TextInput,
  Text,
  Button,
  IconButton,
} from "react-native-paper";
import { expo } from ".././app.json";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, Image, Pressable } from "react-native";
import Modal from "react-native-modal";
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
  const [text, setText] = React.useState("");
  const [text2, setText2] = React.useState("");
  const [showPasswordForgotten, setShowPasswordForgotten] = useState(false);
  const [showRegister, setShowRegister] = useState(false);
  return (
    <SafeAreaView style={styles.container}>
      <Register showRegister={showRegister} close={() => setShowRegister(false)}/>
      <PasswordForgotten
        showPasswordForgotten={showPasswordForgotten}
        close={() => setShowPasswordForgotten(false)}
      />
      <View style={styles.topIcons}>
        <Image
          source={require("../assets/icon.png")}
          style={{ width: 100, height: 100 }}
        />
      </View>
      <View style={styles.container}>
        <Text style={styles.titleText}>Welcome to CogniCrew!</Text>
      </View>
      <View style={styles.container}>
        <Text style={styles.baseText}>
          Your favorite place to supercharge {"\n"}
          your learning, collaborate with peers, and {"\n"}
          unlock your full potential. {"\n"}
        </Text>
      </View>
      <View style={styles.container}>
        <TextInput
          style={styles.dataInput}
          label="Username or E-mail address:"
          placeholder="Max Mustermann"
          value={text}
          onChangeText={(text) => setText(text)}
        />
      </View>
      <View style={styles.container}>
        <TextInput
          style={styles.dataInput}
          label="Password"
          placeholder="angola15"
          secureTextEntry={true}
          value={text2}
          onChangeText={(text2) => setText2(text2)}
        />
      </View>
      <View style={styles.container}>
        <Text>
          Your first time? You can register{" "}
          <Pressable onPress={() => setShowRegister(true)}>
            <Text>here!</Text>
          </Pressable>
        </Text>

        <Button
          onPress={() => {
            setShowPasswordForgotten(true);
            console.log("Login screen pressed");
          }}
        >
          Password forgotten?
        </Button>
        <StatusBar style="auto" />
      </View>
      <Button
        style={styles.dataInput}
        mode="contained"
        onPress={async () => {
          const {data} = await supabase.auth.signInWithPassword({
            email: text,
            password: text2,
          });
          // console.log(data);
        }}
      >
        Login
      </Button>
    </SafeAreaView>
  );
}
const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
  topIcons: {
    flex: 1,
    bottom: 0,
    alignItems: "flex-start",
    flexDirection: "row",
    justifyContent: "space-between",
    width: "100%", // add width
  },
  baseText: {
    fontSize: 18,
  },
  titleText: {
    fontSize: 24,
    fontWeight: "bold",
  },
  dataInput: {
    width: responsiveWidth(80),
  },
  oneLine: {
    flexDirection: "row",
  },
  noHover: {
  },
  leftSide: {
    flexDirection: "row",
    justifyContent: "flex-start",
    alignContent: "flex-start",
    margin: 10,
  },
  whiteModal: {
  },
});
