import * as React from "react";
import {
  MD3DarkTheme,
  MD3LightTheme,
  PaperProvider,
  adaptNavigationTheme,
} from "react-native-paper";
import {
  NavigationContainer,
  DarkTheme as NavigationDarkTheme,
  DefaultTheme as NavigationDefaultTheme,
} from "@react-navigation/native";
import { colors as lightColors } from "./theme-light.json";
import { colors as darkColors } from "./theme-dark.json";
import { createMaterialBottomTabNavigator } from "@react-navigation/material-bottom-tabs";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import { useCallback, useEffect, useMemo, useState } from "react";
import { PreferencesContext } from "./stores/PreferencesContext";
import { usePreferencesStore } from "./stores/PreferencesStore";
import HomeScreen from "./screens/Home";
import ManageFriends from "./screens/ManageFriends";
import LearningProjects from "./screens/LearningProjects";
import LearningProject from "./screens/LearningProject";
import Settings from "./screens/AccountSettings";
import Login from "./screens/Login";
import LearningRoom from "./screens/LearningRoom";
import FlashcardManagement from "./screens/projectManagement/FlashcardManagement";
import LinkManagement from "./screens/projectManagement/LinkManagement";
import Achievements from "./screens/Achievements";
import { AuthContext, AuthProvider, useAuth } from "./providers/AuthProvider";
import { View, Text } from "react-native";
import MainNav from "./components/MainNav";
const Tab = createMaterialBottomTabNavigator();

const Stack = createNativeStackNavigator();

function MainTab() {
  return (
    <Stack.Navigator>
      <Stack.Screen
        name="Home"
        component={HomeScreen}
        options={{ title: "CogniCrew" }}
      />
      <Stack.Screen name="Login" component={Login} />
      <Stack.Screen name="ManageFriends" component={ManageFriends} />
      <Stack.Screen name="LearningProjects" component={LearningProjects} />
      <Stack.Screen name="LearningProject" component={LearningProject} />
      <Stack.Screen name="LearningRoom" component={LearningRoom} />
      <Stack.Screen
        name="FlashcardManagement"
        component={FlashcardManagement}
      />
      <Stack.Screen name="LinkManagement" component={LinkManagement} />
      <Stack.Screen name="Achievements" component={Achievements} />
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

const { LightTheme, DarkTheme } = adaptNavigationTheme({
  reactNavigationLight: NavigationDefaultTheme,
  reactNavigationDark: NavigationDarkTheme,
});

const CombinedDefaultTheme = {
  ...MD3LightTheme,
  ...LightTheme,
  roundness: 2,
  colors: {
    ...MD3LightTheme.colors,
    ...LightTheme.colors,
    ...lightColors,
  },
};
const CombinedDarkTheme = {
  ...MD3DarkTheme,
  ...DarkTheme,
  roundness: 2,
  colors: {
    ...MD3DarkTheme.colors,
    ...DarkTheme.colors,
    ...darkColors,
  },
};

export default function App() {
  const { darkmode, setDarkmode } = usePreferencesStore();
  let theme = darkmode ? CombinedDarkTheme : CombinedDefaultTheme;
  const toggleTheme = useCallback(() => setDarkmode(!darkmode), [darkmode]);
  const preferences = useMemo(
    () => ({ toggleTheme, darkmode }),
    [toggleTheme, darkmode],
  );

  return (
    <PreferencesContext.Provider value={preferences}>
      <PaperProvider theme={theme}>
        <NavigationContainer theme={theme}>
          <AuthProvider>
            <MainNav />
          </AuthProvider>
        </NavigationContainer>
      </PaperProvider>
    </PreferencesContext.Provider>
  );
}
