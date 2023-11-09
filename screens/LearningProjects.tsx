import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import ProjectGroups from "../components/learningProjects/ProjectGroups";
import { Tooltip, IconButton } from "react-native-paper";
import { NAVIGATION } from "../types/common";
import { useAlerts } from "../utils/hooks";
import { useEffect } from "react";
import { createMaterialTopTabNavigator } from "@react-navigation/material-top-tabs";
import Discover from "./Discover";

export default function LearningProjects({ navigation }) {
  const { info } = useAlerts();
  const Tab = createMaterialTopTabNavigator();

  useEffect(() => {
    navigation.setOptions({
      title: "Projects",
      headerRight: () => (
        <>
          <Tooltip title="Project settings">
            <IconButton
              icon="plus"
              onPress={() => {
                navigation.navigate(NAVIGATION.CREATEEDIT_PROJECT, {
                  edit: null,
                });
              }}
            ></IconButton>
          </Tooltip>
          <Tooltip title="Invite users">
            <IconButton
              icon="filter"
              onPress={() => {
                info("Coming soon!", "Not implemented");
              }}
            ></IconButton>
          </Tooltip>
        </>
      ),
    });
  }, []);
  
  // <View style={styles.container}>
  return (
      <Tab.Navigator>
        <Tab.Screen name="Discover" component={Discover} />
        <Tab.Screen name="My Projects" component={ProjectGroups} />
      </Tab.Navigator>
      // <StatusBar style="auto" />
      // <ProjectGroups />
      );
      // </View>
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
});
