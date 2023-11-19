import { Icon } from "react-native-paper";
import { NAVIGATION } from "../types/common";
import AccountSettings from "./AccountSettings";
import { createMaterialTopTabNavigator } from "@react-navigation/material-top-tabs";
import ManageFriends from "./ManageFriends";
import Achievements from "./Achievements";
import { useSoundsStore } from "../stores/SoundsStore";
import { useFocusEffect } from "@react-navigation/native";
import React from "react";

const Top = createMaterialTopTabNavigator();
export default function AccountManage({ navigation }) {

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

  return (
    <Top.Navigator
      screenOptions={{
        tabBarLabelStyle: { textTransform: "none" },
      }}
      initialRouteName={NAVIGATION.MANAGE_FRIENDS}
    >
      <Top.Screen
        name={NAVIGATION.ACHIEVEMENTS}
        component={Achievements}
        options={{
          // tabBarIcon: () => <Icon size={24} source="trophy" />,
        }}
      />
      <Top.Screen
        name={NAVIGATION.MANAGE_FRIENDS}
        component={ManageFriends}
        options={{
          title: "Friends",
          // tabBarIcon: () => <Icon size={24} source="account-group" />,
        }}
      />
      <Top.Screen
        name={NAVIGATION.SETTINGS}
        component={AccountSettings}
        options={{
          // tabBarIcon: () => <Icon size={24} source="cogs" />,
        }}
      />
    </Top.Navigator>
  );
}
