import * as React from "react";
import { StyleSheet } from "react-native";
import ProjectGroups from "../components/learningProjects/ProjectGroups";
import { Tooltip, IconButton } from "react-native-paper";
import { NAVIGATION } from "../types/common";
import { useAlerts } from "../utils/hooks";
import { useEffect } from "react";
import Discover from "./Discover";

import { createMaterialTopTabNavigator } from "@react-navigation/material-top-tabs";
import { useSoundsStore } from "../stores/SoundsStore";
import { useFocusEffect } from "@react-navigation/native";
const Tab = createMaterialTopTabNavigator();

export default function LearningProjects({ navigation }) {

  const { playSound, stopSound, loadSound1 } = useSoundsStore();
  useFocusEffect(
    React.useCallback(() => {
      const { isLoaded} = useSoundsStore.getState();
      if (!isLoaded) {
        const audioSource = require('../assets/sounds/musicmusicmusic.mp3');
        loadSound1(audioSource);
      } else {
        playSound();
      }
      return () => {
        stopSound();
      };
    }, [])
  );
  


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
                info({
                  title: "Not implemented",
                  message: "This feature is not implemented yet.",
                });
              }}
            ></IconButton>
          </Tooltip>
        </>
      ),
    });
  }, []);

  return (
    <Tab.Navigator
      initialRouteName={"default_my_projects"}
      screenOptions={{
        tabBarLabelStyle: { textTransform: "capitalize" },
      }}
    >
      <Tab.Screen name={NAVIGATION.DISCOVER} component={Discover} />
      <Tab.Screen
        name={"default_my_projects"}
        component={ProjectGroups}
        options={{ title: "My projects" }}
      />
    </Tab.Navigator>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
  pagerView: {
    flex: 1,
  },
});
