import React,{ useState }    from "react";
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
    { name: "WiSe21/22" },
    { name: "SoSe22" },
    { name: "WiSe22/23" },
  ];
export default function ProjectGroups(){
return(
    dummyProjectGroups.map((projectGroup, i) => (
      <Card style={styles.projectGroup} key={i}>
        <Card.Title title={projectGroup.name}
        right={() => 
     <IconButton
     icon="plus"
     size={responsiveFontSize(3.5)}
     onPress={() => {
        dummyProjects.push({name: "German"})
     }}
   /> 
    }/>
        <Card.Content style={styles.projectGroupContent}>
          <ProjectElement/>
        </Card.Content>
      </Card>
    ))
)
}

const styles = StyleSheet.create({
    projectGroup: {

        marginTop: responsiveFontSize(1),
        fontSize: responsiveFontSize(2.2),
      },
      projectGroupContent: {
        flexDirection: "row",
        flexWrap: "wrap",
        justifyContent: "flex-start",
      },
})