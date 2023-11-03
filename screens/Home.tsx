import * as React from "react";
import { Text } from "react-native-paper";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, Image } from "react-native";
import { Button, Avatar } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { useAuth } from "../providers/AuthProvider";
import JoinRoom from "../components/learningRoom/JoinRoom";
import { useUsername } from "../utils/hooks";

export default function HomeScreen({ navigation }) {
  const { user } = useAuth();
  const username = useUsername(user?.id);

  return (
    <>
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
              Hello, {username}
            </Text>
            <Avatar.Text size={responsiveFontSize(6)} label={"Ti"} />
          </View>
        </View>
        <View style={styles.middleContainerChild}>
          <JoinRoom navigation={navigation} />
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
