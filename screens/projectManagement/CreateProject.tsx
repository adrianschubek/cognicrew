import { StatusBar } from "expo-status-bar";
import React from "react";
import { View } from "react-native";
import { Text } from "react-native-paper";

export default function CreateProject({ navigation, route }) {
  /**
   * edit == null => create new project
   * edit == number => edit project
   * besser: edit = project objekt
   */
  const { edit } = route.params;

  navigation.setOptions({
    title: edit === null ? "Create Project" : "Edit Project",
  });

  return (
    <View>
      <StatusBar style="auto" />
      <Text>{edit === null ? "Create Project" : "Edit Project"}</Text>
    </View>
  );
}
