import { NAVIGATION } from "../types/common";
import AccountSettings from "./AccountSettings";
import { createMaterialTopTabNavigator } from "@react-navigation/material-top-tabs";
import ManageFriends from "./ManageFriends";
import Achievements from "./Achievements";
import React from "react";
import { useSoundSystem1 } from "../utils/hooks";
import { Icon, Text, useTheme } from "react-native-paper";

const Top = createMaterialTopTabNavigator();
export default function AccountManage({ navigation }) {
  useSoundSystem1();
  const theme = useTheme();

  return (
    <Top.Navigator
      screenOptions={{
        tabBarLabelStyle: { textTransform: "none" },
        tabBarItemStyle: { flexDirection: "row" },        
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
              source={"help"}
              // source={"trophy"}
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
              {/* Achievements */}
              Secret Feature
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
