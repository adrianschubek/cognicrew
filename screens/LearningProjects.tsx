import * as React from "react";
import { Platform, StyleSheet } from "react-native";
import ProjectGroups from "../components/learningProjects/ProjectGroups";
import { Tooltip, IconButton, Icon, useTheme, Text } from "react-native-paper";
import { NAVIGATION } from "../types/common";
import { useEffect } from "react";
import Discover from "./Discover";
import { createMaterialTopTabNavigator } from "@react-navigation/material-top-tabs";
import SearchProjects from "./SearchProjects";

const Tab = createMaterialTopTabNavigator();

export default function LearningProjects({ navigation }) {
  const theme = useTheme();
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
        animationEnabled: Platform.OS === "ios",
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
        options={{
          tabBarIcon: ({ focused }) => (
            <Icon
              color={focused ? theme.colors.primary : theme.colors.secondary}
              source={"search-web"}
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
              Search projects
            </Text>
          ),
        }}
        name={NAVIGATION.SEARCH_GLOBAL_PROJECTS}
        component={SearchProjects}
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
              My projects
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
