import * as React from "react";
import { Dialog, Portal, TextInput, Text } from "react-native-paper";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, Image } from "react-native";
import { Button, Avatar } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { useEffect, useState } from "react";
import { useAuth } from "../providers/AuthProvider";
import { supabase } from "../supabase";

export default function HomeScreen({ navigation }) {
  const [joinCode, setJoinCode] = useState("#");
  const [showErrorJoin, setShowErrorJoin] = useState(false);

  const { user } = useAuth();

  const [achievements, setAchievements] = useState([]);
  useEffect(() => {
    const getAllAchievements = async () =>
      await supabase.from("achievements").select("*");

    getAllAchievements().then((achievements) => {
      setAchievements(achievements.data);
    });
  }, []);

  return (
    <>
      <Portal>
        <Dialog
          visible={showErrorJoin}
          onDismiss={() => setShowErrorJoin(false)}
        >
          <Dialog.Title>Invalid Code</Dialog.Title>
          <Dialog.Content>
            <Text>Please enter a valid code</Text>
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={() => setShowErrorJoin(false)}>Done</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
      <View style={styles.container}>
        <StatusBar style="auto" />

        <View style={styles.upperContainerChild}>
          <Image
            source={require("../assets/icon.png")}
            style={{
              height: responsiveFontSize(13),
              width: responsiveFontSize(13),
            }}
          />
          <View style={styles.rightUpperContainerChild}>
            <Text
              style={{
                paddingTop: responsiveHeight(1.8),
                paddingRight: responsiveWidth(1),
              }}
            >
              Hello, {user?.email}
            </Text>
            <Avatar.Text size={responsiveFontSize(6)} label={"Ti"} />
          </View>
        </View>
        <View style={styles.middleContainerChild}>
          <Text
            style={{
              fontSize: responsiveFontSize(2.5),
              paddingBottom: responsiveHeight(1),
            }}
          >
            Join room via ID: {JSON.stringify(achievements)}
          </Text>
          <TextInput
            editable
            placeholder="#"
            value={joinCode}
            error={joinCode.length > 1 && joinCode.length !== 7}
            onChangeText={(text) => {
              if (text === "") {
                text = "#";
              }
              // only allow numbers
              text = text.replace(/[^0-9]/g, "");
              // if the first character is not a #, add it.
              if (!text.includes("#")) {
                text = "#" + text;
              }
              setJoinCode(text);
            }}
            maxLength={7}
            inputMode="numeric"
            style={{ width: responsiveWidth(30), height: responsiveHeight(5) }}
          />
          <Button
            labelStyle={{ textAlignVertical: "center" }}
            style={[styles.buttonStyle, { width: responsiveWidth(40) }]}
            mode="contained"
            onPress={() => {
              if (joinCode.length !== 7) {
                setShowErrorJoin(true);
              } else {
                navigation.navigate("Room", { code: joinCode });
              }
            }}
          >
            Ask to join
          </Button>
        </View>
        <View style={[styles.bottomContainerChild]}>
          <Button
            style={styles.buttonStyle}
            labelStyle={styles.bigLabelStyle}
            icon="account-multiple"
            mode="contained"
            onPress={() => {
              navigation.navigate("ManageFriends");
              console.log("Home Screen Pressed");
            }}
          >
            Manage your friends!
          </Button>
          <Button
            style={styles.buttonStyle}
            onPress={() => {
              navigation.navigate("Login");
              console.log("Login screen pressed");
            }}
          >
            {" "}
            Test Login
          </Button>
          <Button
            style={styles.buttonStyle}
            onPress={() => {
              navigation.navigate("Achievements");
              console.log("Achievement screen pressed");
            }}
          >
            {" "}
            Test Achievements
          </Button>
        </View>
      </View>
    </>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: "column",
    justifyContent: "center",
    alignItems: "stretch",
  },
  containerChild: {
    flex: 1,
  },
  upperContainerChild: {
    flex: 1,
    justifyContent: "space-between",
    flexDirection: "row",
    //backgroundColor: "yellow",
  },
  rightUpperContainerChild: {
    flex: 0,
    //backgroundColor: "blue",
    flexDirection: "row",
    paddingTop: responsiveHeight(2),
    paddingRight: responsiveWidth(2),
  },
  middleContainerChild: {
    flex: 2,
    flexDirection: "column",
    justifyContent: "center",
    //backgroundColor: "red",
    alignItems: "center",
  },
  bottomContainerChild: {
    flex: 3,
    //backgroundColor: "green",
    alignItems: "center",
  },
  buttonStyle: {
    marginBottom: responsiveHeight(2.5),
    marginTop: responsiveHeight(1.5),
  },
  bigLabelStyle: {
    fontSize: responsiveFontSize(2.5),
    paddingBottom: responsiveHeight(0.5),
    paddingTop: responsiveHeight(0.5),
    height: responsiveHeight(5),
    textAlignVertical: "center",
  },
});
