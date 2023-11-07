import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, ScrollView } from "react-native";
import { Button, Text } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import ProjectGroup from "../components/learningProjects/ProjectGroups";
import TextWithPlusButton from "../components/common/TextWithPlusButton";
import { NAVIGATION } from "../types/common";

export default function LearningProjects({ navigation }) {
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <View style={styles.bottomContainerChild}>
        <ScrollView>
          <ProjectGroup />
        </ScrollView>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
  upperContainerChild: {
    flex: 1,
    width: responsiveWidth(100),
    //backgroundColor: "red",
    alignItems: "flex-end",
  },
  bottomContainerChild: {
    flex: 8,
    //backgroundColor: "blue",
    width: responsiveWidth(100),
    padding: responsiveFontSize(1),
  },
  textStyle: {
    fontSize: responsiveFontSize(2),
    fontWeight: "bold",
    textAlign: "center",
  },
});
