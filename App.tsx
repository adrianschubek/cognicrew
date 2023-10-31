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
import { useCallback, useMemo, useState } from "react";
import { PreferencesContext } from "./stores/PreferencesContext";
import HomeScreen from "./screens/Home";
import ManageFriends from "./screens/ManageFriends";
import LearningProjects from "./screens/LearningProjects";
import LearningProject from "./screens/LearningProject";
import Settings from "./screens/AccountSettings";
import Login from "./screens/Login";
import LearningRoom from "./screens/LearningRoom";
import { usePreferencesStore } from "./stores/PreferencesStore";

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
  // const [isThemeDark, setIsThemeDark] = useState(false);

  let theme = darkmode ? CombinedDarkTheme : CombinedDefaultTheme;

  const toggleTheme = useCallback(
    () => setDarkmode(!darkmode),
    [darkmode],
  );

  const preferences = useMemo(
    () => ({
      toggleTheme,
      darkmode,
    }),
    [toggleTheme, darkmode],
  );

  return (
    <PreferencesContext.Provider value={preferences}>
      <PaperProvider theme={theme}>
        <NavigationContainer theme={theme}>
          <Tab.Navigator initialRouteName="Home" shifting={true}>
            <Tab.Screen
              name="HomeTab"
              options={{ tabBarIcon: "home", title: "Home" }}
              component={MainTab}
            />
            <Tab.Screen
              name="SettingsTab"
              options={{ tabBarIcon: "cogs", title: "Settings" }}
              component={SettingsTab}
            />
          </Tab.Navigator>
        </NavigationContainer>
      </PaperProvider>
    </PreferencesContext.Provider>
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
