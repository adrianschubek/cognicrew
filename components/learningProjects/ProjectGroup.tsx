import * as React from "react";
import { StyleSheet, Text } from "react-native";
import { Button, Card } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import ProjectElement from "./ProjectElement";


const dummyProjectGroups = [
    { name: "WiSe21/22" },
    { name: "SoSe22" },
    { name: "WiSe22/23" },
  ];
export default function ProjectGroup(){
return(
    dummyProjectGroups.map((projectGroup) => (
      <Card style={styles.projectGroup}>
        <Card.Title title={projectGroup.name} />
        <Card.Content style={styles.projectGroupContent}>
          <ProjectElement/>
        </Card.Content>
      </Card>
    ))
)
}

const styles = StyleSheet.create({
    projectGroup: {
        marginBottom: responsiveFontSize(1),
      },
      projectGroupContent: {
        flexDirection: "row",
        flexWrap: "wrap",
        justifyContent: "flex-start",
      },
})