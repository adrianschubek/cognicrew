import * as React from "react";
import { StyleSheet } from "react-native";
import ProjectGroups from "../components/learningProjects/ProjectGroups";
import { Tooltip, IconButton, Icon, useTheme, Text } from "react-native-paper";
import { NAVIGATION } from "../types/common";
import { useAlerts } from "react-native-paper-fastalerts";
import { useEffect } from "react";
import Discover from "./Discover";

import { createMaterialTopTabNavigator } from "@react-navigation/material-top-tabs";

const Tab = createMaterialTopTabNavigator();

export default function LearningProjects({ navigation }) {
  const theme = useTheme();

  const { info } = useAlerts();

  useEffect(() => {
    navigation.setOptions({
      headerShadowVisible: false,

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
          {/* <Tooltip title="Invite users">
            <IconButton
              icon="filter"
              onPress={() => {
                info({
                  title: "Not implemented",
                  message: "This feature is not implemented yet.",
                });
              }}
            ></IconButton>
          </Tooltip> */}
        </>
      ),
    });
  }, []);

  return (
    <Tab.Navigator
      initialRouteName={"default_my_projects"}
      screenOptions={{
        tabBarLabelStyle: { textTransform: "capitalize" },
        tabBarItemStyle: { flexDirection: "row" },
      }}
    >
      <Tab.Screen
        options={{
          tabBarIcon: ({ focused }) => (
            <Icon
              color={focused ? theme.colors.primary : theme.colors.secondary}
              source={"creation"}
              size={24}
            />
          ),
          tabBarLabel: ({ focused }) => (
            <Text
              variant="labelMedium"
              style={{
                color: focused ? theme.colors.primary : theme.colors.secondary,
              }}
            >
              {" "}
              Discover
            </Text>
          ),
        }}
        name={NAVIGATION.DISCOVER}
        component={Discover}
      />
      <Tab.Screen
        name={"default_my_projects"}
        component={ProjectGroups}
        options={{
          tabBarIcon: ({ focused }) => (
            <Icon
              color={focused ? theme.colors.primary : theme.colors.secondary}
              source={"book-multiple"}
              size={24}
            />
          ),
          tabBarLabel: ({ focused }) => (
            <Text
              variant="labelMedium"
              style={{
                color: focused ? theme.colors.primary : theme.colors.secondary,
              }}
            >
              {" "}
              My Projects
            </Text>
          ),
        }}
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
