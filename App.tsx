import * as React from "react";
import { AppRegistry } from "react-native";
import { DefaultTheme, MD3DarkTheme, PaperProvider } from "react-native-paper";
import { expo } from "./app.json";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import { Button } from "react-native-paper";
import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import { supabase } from "./supabase";
import HomeScreen from "./screens/Home";
import ManageFriends from "./screens/ManageFriends";
import LearningProjects from "./screens/LearningProjects";

import { createMaterialBottomTabNavigator } from "@react-navigation/material-bottom-tabs";
import { SafeAreaView } from "react-native-safe-area-context";
import Settings from "./screens/AccountSettings";

const Tab = createMaterialBottomTabNavigator();

const Stack = createNativeStackNavigator();

function MainTab() {
  return (
    <Stack.Navigator>
      <Stack.Screen name="Home" component={HomeScreen} />
      <Stack.Screen name="ManageFriends" component={ManageFriends} />
      <Stack.Screen name="LearningProjects" component={LearningProjects} />
    </Stack.Navigator>
  );
}

function SettingsTab() {
  return (
    <Stack.Navigator>
      <Stack.Screen name="Settings" component={Settings} />
    </Stack.Navigator>
  );
}

export default function App() {
  supabase.auth
    .signInWithPassword({
      email: "foo@bar.de",
      password: "123456",
    })
    .catch((error) => {
      console.log(error);
    });

  return (
    <PaperProvider    
      theme={{
        ...DefaultTheme,
        roundness: 2,
        ...require("./theme-light.json"),
      }}
    >
      <NavigationContainer>
        <Tab.Navigator initialRouteName="Home" shifting={true} sceneAnimationEnabled={true}>
          <Tab.Screen
            name="Home"
            options={{ tabBarIcon: "home" }}
            component={MainTab}
          />
          <Tab.Screen
            name="Settings"
            options={{ tabBarIcon: "cogs" }}
            component={SettingsTab}
          />
        </Tab.Navigator>
      </NavigationContainer>
    </PaperProvider>
  );
}
/*
//we need global styles 
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
}); */
