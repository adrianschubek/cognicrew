import React, { useState } from "react";
import { StyleSheet, View } from "react-native";
import { Button, Card, IconButton, Text } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import ProjectElement from "./ProjectElements";
const dummyProjects = [
  { name: "Psycholgy" },
  { name: "Biology" },
  { name: "Sex Education" },
  { name: "Kynology" },
  { name: "Spanish" },
];
const dummyProjectGroups = [
  { name: "WiSe21/22", id: 1 },
  { name: "SoSe22", id: 2 },
  { name: "WiSe22/23", id: 3 },
];
export default function ProjectGroups() {
  return dummyProjectGroups.map((projectGroup) => (
    <Card elevation={1} style={styles.projectGroup} key={projectGroup.id}>
      <Card.Title
        title={projectGroup.name}
        /*right={() => (
           <IconButton
            icon="plus"
            onPress={() => {
              dummyProjects.push({ name: "German" });
            }}
          /> 
          
        )}*/
            />
      <Card.Content style={styles.projectGroupContent}>
        <ProjectElement />
      </Card.Content>
    </Card>
  ));
}

const styles = StyleSheet.create({
  projectGroup: {
    marginTop: responsiveFontSize(1),
  },
  projectGroupContent: {
    flexDirection: "row",
    flexWrap: "wrap",
    justifyContent: "flex-start",
  },
});
