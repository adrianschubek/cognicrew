import * as React from "react";
import { AppRegistry } from "react-native";
import { PaperProvider } from "react-native-paper";
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
import BottomNav from "./components/BottomNav";
import Login from "./screens/Login";
import {
  MD3LightTheme as DefaultTheme,
} from 'react-native-paper';

import AwesomeIcon from 'react-native-vector-icons/AntDesign';

const Stack = createNativeStackNavigator();

const theme = {
  ...DefaultTheme,
    "colors": {
      "primary": "rgb(71, 85, 182)",
      "onPrimary": "rgb(255, 255, 255)",
      "primaryContainer": "rgb(223, 224, 255)",
      "onPrimaryContainer": "rgb(0, 13, 95)",
      "secondary": "rgb(91, 93, 114)",
      "onSecondary": "rgb(255, 255, 255)",
      "secondaryContainer": "rgb(224, 225, 249)",
      "onSecondaryContainer": "rgb(24, 26, 44)",
      "tertiary": "rgb(119, 83, 108)",
      "onTertiary": "rgb(255, 255, 255)",
      "tertiaryContainer": "rgb(255, 215, 240)",
      "onTertiaryContainer": "rgb(45, 18, 39)",
      "error": "rgb(186, 26, 26)",
      "onError": "rgb(255, 255, 255)",
      "errorContainer": "rgb(255, 218, 214)",
      "onErrorContainer": "rgb(65, 0, 2)",
      "background": "rgb(255, 251, 255)",
      "onBackground": "rgb(27, 27, 31)",
      "surface": "rgb(255, 251, 255)",
      "onSurface": "rgb(27, 27, 31)",
      "surfaceVariant": "rgb(227, 225, 236)",
      "onSurfaceVariant": "rgb(70, 70, 79)",
      "outline": "rgb(118, 118, 128)",
      "outlineVariant": "rgb(199, 197, 208)",
      "shadow": "rgb(0, 0, 0)",
      "scrim": "rgb(0, 0, 0)",
      "inverseSurface": "rgb(48, 48, 52)",
      "inverseOnSurface": "rgb(243, 240, 244)",
      "inversePrimary": "rgb(187, 195, 255)",
      "elevation": {
        "level0": "transparent",
        "level1": "rgb(246, 243, 251)",
        "level2": "rgb(240, 238, 249)",
        "level3": "rgb(235, 233, 247)",
        "level4": "rgb(233, 231, 246)",
        "level5": "rgb(229, 228, 245)"
      },
      "surfaceDisabled": "rgba(27, 27, 31, 0.12)",
      "onSurfaceDisabled": "rgba(27, 27, 31, 0.38)",
      "backdrop": "rgba(47, 48, 56, 0.4)"
  }
};

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
    theme={theme}
    settings={{
      icon: props => <AwesomeIcon {...props} />,
    }}>
      <NavigationContainer>
        <Stack.Navigator>
          <Stack.Screen name="Login" component={Login} />
          <Stack.Screen name="Home" component={HomeScreen} />
          <Stack.Screen name="ManageFriends" component={ManageFriends} />
          <Stack.Screen name="LearningProjects" component={LearningProjects} />
        </Stack.Navigator>
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
