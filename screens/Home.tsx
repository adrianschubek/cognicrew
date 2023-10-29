import * as React from "react";
import {
  Dialog,
  PaperProvider,
  Portal,
  TextInput,
  Text,
} from "react-native-paper";
import { expo } from ".././app.json";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, Image } from "react-native";
import { Button } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { useState } from "react";

export default function HomeScreen({ navigation }) {
  const [joinCode, setJoinCode] = useState("#");
  const [showErrorJoin, setShowErrorJoin] = useState(false);

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
              height: responsiveFontSize(12),
              width: responsiveFontSize(12),
            }}
          />
          <View style={styles.rightUpperContainerChild}>
            <Text
              style={{
                paddingTop: responsiveHeight(1.5),
                paddingRight: responsiveWidth(1),
              }}
            >
              Hello, username
            </Text>
            <Image
              source={require("../assets/3d_avatar_10.png")}
              style={{
                height: responsiveFontSize(6),
                width: responsiveFontSize(6),
              }}
            />
          </View>
        </View>
        <View style={styles.middleContainerChild}>
          <Text
            style={{
              fontSize: responsiveFontSize(2.5),
              paddingBottom: responsiveHeight(1),
            }}
          >
            Join room via ID:
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
              navigation.navigate("LearningProjects");
              console.log("Home Screen Pressed");
            }}
          >
            Learning Projects
          </Button>
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
