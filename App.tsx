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
import { useCallback, useMemo } from "react";
import { PreferencesContext } from "./stores/PreferencesContext";
import { usePreferencesStore } from "./stores/PreferencesStore";
import { AuthProvider } from "./providers/AuthProvider";
import MainNav from "./components/MainNav";
import AlertSyncZustand from "./components/alerts/AlertSyncZustand";
import { SWRConfig } from "swr";
import { AppState } from "react-native";

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
            <SWRConfig
              value={{
              /*   revalidateIfStale: false,
                revalidateOnFocus: false, */
                provider: () => new Map(),
                isVisible: () => true,
                isOnline: () => true,
                initFocus: (callback) => {
                  let appState = AppState.currentState;

                  const onAppStateChange = (nextAppState) => {
                    /* If it's resuming from background or inactive mode to active one */
                    if (
                      appState.match(/inactive|background/) &&
                      nextAppState === "active"
                    ) {
                      callback();
                    }
                    appState = nextAppState;
                  };

                  // Subscribe to the app state change events
                  const subscription = AppState.addEventListener(
                    "change",
                    onAppStateChange,
                  );

                  return () => subscription.remove();
                },
              }}
            >
              <AlertSyncZustand />
              <MainNav />
            </SWRConfig>
          </AuthProvider>
        </NavigationContainer>
      </PaperProvider>
    </PreferencesContext.Provider>
  );
}
