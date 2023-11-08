import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import { Button, IconButton, Text, Tooltip } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import LearningProjectCategory from "../components/learningProject/LearningProjectCategory";
import { NAVIGATION } from "../types/common";

export default function LearningProject({ navigation }) {
  navigation.setOptions({
    title: "Learning Projects",
    headerRight: () => (
      <>
        <Tooltip title="Project settings">
          <IconButton
            icon="cog"
            onPress={() => {
              // @ts-ignore
              navigation.navigate(NAVIGATION.CREATEEDIT_PROJECT, {
                edit: -1, // TODO
              });
            }}
          ></IconButton>
        </Tooltip>
        <Tooltip title="Invite users">
          <IconButton
            icon="account-plus"
            onPress={() => {
              // @ts-ignore
              navigation.navigate(NAVIGATION.CREATEEDIT_PROJECT, {
                edit: null, // TODO
              });
            }}
          ></IconButton>
        </Tooltip>
      </>
    ),
  });

  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <LearningProjectCategory
        path={require("../assets/cards_symbol.png")}
        name={"Cognicards"}
        function={() => {
          navigation.navigate(NAVIGATION.FLASHCARD_MANAGEMENT);
        }}
      />
      <LearningProjectCategory
        path={require("../assets/completed_task_symbol.png")}
        name={"Cognicises"}
        function={() => {
          navigation.navigate(NAVIGATION.EXERCISE_MANAGEMENT);
        }}
      />
      <LearningProjectCategory
        path={require("../assets/camera_symbol.png")}
        name={"Cognilinks"}
        function={() => {
          navigation.navigate(NAVIGATION.LINK_MANAGEMENT);
        }}
      />
      <LearningProjectCategory
        path={require("../assets/files_symbol.png")}
        name={"Cognifiles"}
      />
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
