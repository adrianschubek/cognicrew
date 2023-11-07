import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import ProjectGroup from "../components/learningProjects/ProjectGroups";

export default function LearningProjects({ navigation }) {
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <ProjectGroup />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
    
  },
});
