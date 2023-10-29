import * as React from "react";
import { PaperProvider } from "react-native-paper";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View, ScrollView } from "react-native";
import { Button, Avatar, Card } from "react-native-paper";
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
const dummyProjectGroups = [
  { name: "WiSe21/22" },
  { name: "SoSe22" },
  { name: "WiSe22/23" },
];
export default function LearningProjects({ navigation }) {
  return (
    <View style={styles.container}>
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
        {dummyProjectGroups.map((projectGroup) => (
          <Card style={styles.projectGroup}>
            <Card.Title title={projectGroup.name} />
            <Card.Content style={styles.projectGroupContent}>
              {dummyProjects.map((project) => (
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
              ))}
            </Card.Content>
          </Card>
        ))}
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
  projectGroup: {
    marginBottom: responsiveFontSize(1),
  },
  projectGroupContent: {
    flexDirection: "row",
    flexWrap: "wrap",
    justifyContent: "flex-start",
  },
  projectElement: {
    width: responsiveWidth(27),
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
