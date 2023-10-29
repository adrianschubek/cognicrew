import * as React from "react";
import { StyleSheet, Text, View } from "react-native";
import { Avatar } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";

const dummyProjects = [
  { name: "Psycholgy" },
  { name: "Biology" },
  { name: "Sex Education" },
  { name: "Kynology" },
  { name: "Spanish" },
];

export default function ProjectElements() {
  return dummyProjects.map((project) => (
    <View style={styles.projectElement}>
      <Avatar.Text
        style={styles.avatar}
        size={responsiveFontSize(10)}
        label={project.name.substring(0, 2)}
      />
      <Text style={styles.textStyle}>
        {project.name.length > 15
          ? project.name.substring(0, 13) + "..."
          : project.name.substring(0, 13)}
      </Text>
    </View>
  ));
}

const styles = StyleSheet.create({
  projectElement: {
    width: responsiveWidth(27),
    paddingBottom: responsiveFontSize(1),
    //backgroundColor: "red",
  },
  textStyle: {
    fontSize: responsiveFontSize(2),
    fontWeight: "bold",
    textAlign: "center",
  },
  avatar: {
    alignSelf: "center",
  },
});
