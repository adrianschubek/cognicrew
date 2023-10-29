import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View, ScrollView } from "react-native";
import { Button } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import ProjectGroup from "../components/learningProjects/ProjectGroup";

export default function LearningProjects({ navigation }) {
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <View style={styles.upperContainerChild}>
        <Button
          icon="plus"
          mode="text"
          labelStyle={{
            textAlignVertical: "center",
            fontSize: responsiveFontSize(3),
          }}
          contentStyle={{ flexDirection: "row-reverse" }}
        >
          <Text style={{ fontSize: responsiveFontSize(2) }}>
            create new project
          </Text>
        </Button>
      </View>
      <View  style={styles.bottomContainerChild}>
      <ScrollView>
        <ProjectGroup/>
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
    flex: 7,
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
