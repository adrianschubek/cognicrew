import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import ProjectGroups from "../components/learningProjects/ProjectGroups";
import { Tooltip, IconButton,Text } from "react-native-paper";
import { NAVIGATION } from "../types/common";
import { useAlerts } from "../utils/hooks";
import { useEffect } from "react";
import Discover from "./Discover";

import { createMaterialTopTabNavigator } from "@react-navigation/material-top-tabs";
import PagerView from "react-native-pager-view";
const Tab = createMaterialTopTabNavigator();

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
    // <View style={styles.container}>
    //   <StatusBar style="auto" />
    //   <ProjectGroups/>
    // </View>
    // <Tab.Navigator initialRouteName={"default_my_projects"}>
    //   <Tab.Screen name={NAVIGATION.DISCOVER} component={Discover} />
    //   <Tab.Screen
    //     name={"default_my_projects"}
    //     component={ProjectGroups}
    //     options={{ title: "My projects" }}
    //   />
    // </Tab.Navigator>
    <PagerView style={styles.pagerView} initialPage={0}>
    <View key="1">
      <Text>First page</Text>
    </View>
    <View key="2">
      <Text>Second page</Text>
    </View>
  </PagerView>
  );
}

// package:  react-native-pager-view
// crash: Invariant Violation: requireNativeComponent: "RNCViewPager" was not found in the UIManager.
// apk crashes on projects tab
// problem, is top tab navigator, not reanimated
// @react-navigation/material-top-tabs package is broken

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  }, pagerView: {
    flex: 1,
  },
});
