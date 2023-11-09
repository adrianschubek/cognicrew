import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import ProjectGroups from "../components/learningProjects/ProjectGroups";
import { Tooltip, IconButton } from "react-native-paper";
import { NAVIGATION } from "../types/common";
import { useAlerts } from "../utils/hooks";
import { useEffect } from "react";
import Discover from "./Discover";


export default function LearningProjects({ navigation }) {
  const { info } = useAlerts();

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

  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <ProjectGroups/>
    </View>
    // <Tab.Navigator initialRouteName={"default_my_projects"}>
    //   <Tab.Screen name={NAVIGATION.DISCOVER} component={Discover} />
    //   <Tab.Screen
    //     name={"default_my_projects"}
    //     component={ProjectGroups}
    //     options={{ title: "My projects" }}
    //   />
    // </Tab.Navigator>
  );
}

// FIXED use other package instead of material top tabs
// apk crashes on pojects tab!! 
// problem, is tob tab navigator, not animated
// @react-navigation/material-top-tabs package is broken!

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
});
