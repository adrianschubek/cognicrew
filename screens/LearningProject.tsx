import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View} from "react-native";
import { Button, Text} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import LearningProjectCategory from "../components/learningProject/LearningProjectCategory";

export default function ManageFriends({ navigation }) {
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <LearningProjectCategory
      path={require("../assets/cards_symbol.png")}
      name={"Flashcards"}
      />
            <LearningProjectCategory
      path={require("../assets/completed_task_symbol.png")}
      name={"Exercises"}
      />
            <LearningProjectCategory
      path={require("../assets/camera_symbol.png")}
      name={"Videos"}
      />
            <LearningProjectCategory
      path={require("../assets/files_symbol.png")}
      name={"Files"}
      />
      <Button
        icon="home"
        mode="contained"
        style={{ marginTop: responsiveHeight(5) }}
        contentStyle={{
          height: responsiveHeight(10),
          /*backgroundColor:"yellow",*/ alignItems: "center",
        }}
        labelStyle={{
          lineHeight: responsiveFontSize(3.25),
          fontSize: responsiveFontSize(3),
          textAlignVertical: "center",
          padding: 0,
          height: responsiveFontSize(3),
          //backgroundColor:"red"
        }}
        onPress={() => {
          navigation.goBack();
        }}
      >
        Create Room
      </Button>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    width: responsiveWidth(100),
    height: responsiveHeight(100),
    flex: 1,
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "flex-start",
  },
});
