import { NAVIGATION } from "../types/common";
import AccountSettings from "./AccountSettings";
import { createMaterialTopTabNavigator } from "@react-navigation/material-top-tabs";
import ManageFriends from "./ManageFriends";
import Achievements from "./Achievements";
import React from "react";
import { Icon, Text, useTheme } from "react-native-paper";
import { usePreferencesStore } from "../stores/PreferencesStore";
import { Platform } from "react-native";

const Top = createMaterialTopTabNavigator();
export default function AccountManage({ navigation }) {
  const theme = useTheme();
  const unlockedAchievementIds = usePreferencesStore(
    (state) => state.unlockedAchievementIds,
  );
  return (
    <Top.Navigator
      screenOptions={{
        tabBarLabelStyle: { textTransform: "none" },
        tabBarItemStyle: { flexDirection: "row" },
        animationEnabled: Platform.OS === "ios",
      }}
      initialRouteName={NAVIGATION.MANAGE_FRIENDS}
    >
      <Top.Screen
        name={NAVIGATION.ACHIEVEMENTS}
        component={Achievements}
        options={{
          tabBarIcon: ({ focused }) => (
            <Icon
              color={focused ? theme.colors.primary : theme.colors.secondary}
              source={
                /*unlockedAchievementIds.length > 0*/ false
                  ? "trophy"
                  : "lock-question" //hiding achievements
              }
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
              {
                /*unlockedAchievementIds.length > 0*/ false
                  ? "Achievements"
                  : " ??? " //hiding achievements
              }
            </Text>
          ),
        }}
      />
      <Top.Screen
        name={NAVIGATION.MANAGE_FRIENDS}
        component={ManageFriends}
        options={{
          tabBarIcon: ({ focused }) => (
            <Icon
              color={focused ? theme.colors.primary : theme.colors.secondary}
              source={"account-group"}
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
              Friends
            </Text>
          ),
        }}
      />
      <Top.Screen
        name={NAVIGATION.SETTINGS}
        component={AccountSettings}
        options={{
          tabBarIcon: ({ focused }) => (
            <Icon
              color={focused ? theme.colors.primary : theme.colors.secondary}
              source={"cogs"}
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
              Settings
            </Text>
          ),
        }}
      />
    </Top.Navigator>
  );
}
