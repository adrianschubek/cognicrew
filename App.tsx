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
import { useCallback, useEffect, useMemo, useRef } from "react";
import { PreferencesContext } from "./stores/PreferencesContext";
import { usePreferencesStore } from "./stores/PreferencesStore";
import { AuthProvider } from "./providers/AuthProvider";
import MainNav from "./components/MainNav";
import { AlertContainer } from "react-native-paper-fastalerts";
import { SWRConfig } from "swr";
import GlobalLoadingOverlay from "./components/GlobalLoadingOverlay";
// import { Appearance, useColorScheme } from "react-native";
import { Audio } from "expo-av";
import { useSoundsStore } from "./stores/SoundsStore";

const { LightTheme, DarkTheme } = adaptNavigationTheme({
  reactNavigationLight: NavigationDefaultTheme,
  reactNavigationDark: NavigationDarkTheme,
});

const CombinedDefaultTheme = {
  ...MD3LightTheme,
  ...LightTheme,
  roundness: 5,
  colors: {
    ...MD3LightTheme.colors,
    ...LightTheme.colors,
    ...lightColors,
  },
};
const CombinedDarkTheme = {
  ...MD3DarkTheme,
  ...DarkTheme,
  roundness: 5,
  colors: {
    ...MD3DarkTheme.colors,
    ...DarkTheme.colors,
    ...darkColors,
  },
};

export default function App() {
  const sound = useRef(new Audio.Sound());
  const { inGame } = useSoundsStore();
  const { musicVolume } = usePreferencesStore();

  async function playSound() {
    if (sound.current._loaded) {
      await sound.current.stopAsync();
      await sound.current.unloadAsync();
    }
    try {
      if (!inGame) {
        await sound.current.loadAsync(
          require("./assets/sounds/musicmusicmusic.mp3"),
        );
      } else {
        await sound.current.loadAsync(require("./assets/sounds/Tetris.mp3"));
      }
      await sound.current.setIsLoopingAsync(true);
      await sound.current.playAsync();
      await sound.current.setVolumeAsync(musicVolume[0]);
    } catch (error) {
      console.error("Error playing audio", error);
    }
  }

  async function changeVolume() {
    if (sound.current._loaded) {
      try {
        await sound.current.setVolumeAsync(musicVolume[0]);
      } catch (error) {
        console.error("Error changing volume", error);
      }
    }
  }

  useEffect(() => {
    playSound();
  }, [inGame]);

  useEffect(() => {
    changeVolume();
  }, [musicVolume]);


  // TODO: useColorScheme to detect system theme and set it
  const { darkmode, setDarkmode } = usePreferencesStore();
  let theme = darkmode ? CombinedDarkTheme : CombinedDefaultTheme;
  const toggleTheme = useCallback(() => setDarkmode(!darkmode), [darkmode]);
  const preferences = useMemo(
    () => ({ toggleTheme, darkmode }),
    [toggleTheme, darkmode],
  );
  // useEffect(() => {
  //   const subscription = Appearance.addChangeListener(
  //     (preferences) => {
  //       const {colorScheme: scheme} = preferences;
  //       setDarkmode(scheme === 'dark');
  //     },
  //   );
  //   return () => subscription?.remove();
  // }, [setDarkmode]);

  return (
    <PreferencesContext.Provider value={preferences}>
      <PaperProvider theme={theme}>
        <NavigationContainer theme={theme}>
          <AuthProvider>
            <SWRConfig
              value={{
                provider: () => new Map(),
                isVisible: () => true,
                isOnline: () => true,
              }}
            >
              <AlertContainer />
              <GlobalLoadingOverlay />
              <MainNav />
            </SWRConfig>
          </AuthProvider>
        </NavigationContainer>
      </PaperProvider>
    </PreferencesContext.Provider>
  );
}
