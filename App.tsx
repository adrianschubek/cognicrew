import * as React from "react";
import "react-native-get-random-values";
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
import { useCallback, useEffect, useMemo, useRef, useState } from "react";
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
  const music = useRef(new Audio.Sound());

  const {
    inGame,
    musicVolume,
    soundEffectVolume,
    masterVolume,
    playButtonSoundEffect,
    setPlayButtonSoundEffect,
  } = useSoundsStore();

  //MUSIC

  async function playMusic() {
    if (music.current._loaded) {
      await music.current.stopAsync();
      await music.current.unloadAsync();
    }
    try {
      if (!inGame) {
        await music.current.loadAsync(
          require("./assets/sounds/lobby_song.m4a"),
        );
      } else {
        await music.current.loadAsync(require("./assets/sounds/game_song.m4a"));
      }
      await music.current.setIsLoopingAsync(true);
      await music.current.playAsync();
      await music.current.setVolumeAsync(musicVolume * masterVolume);
    } catch (error) {
      console.error("Error playing audio", error);
    }
  }

  async function changeMusicVolume() {
    if (music.current._loaded) {
      try {
        await music.current.setVolumeAsync(musicVolume * masterVolume);
      } catch (error) {
        console.error("Error changing volume", error);
      }
    }
  }

  useEffect(() => {
    playMusic();
  }, [inGame]);

  useEffect(() => {
    changeMusicVolume();
  }, [musicVolume, masterVolume]);

  //SOUNDEFFECTS

  const [getSoundEffect, setSoundEffect] = useState(null);

  async function playSoundButton() {
    const { sound } = await Audio.Sound.createAsync(
      require("./assets/sounds/button_click_effect.m4a"),
    );
    setSoundEffect(sound);
    await sound.playAsync();
    await sound.setVolumeAsync(soundEffectVolume * masterVolume);
  }

  useEffect(() => {
    return getSoundEffect
      ? () => {
          console.log("Unloading Sound");
          getSoundEffect.unloadAsync();
        }
      : undefined;
  }, [getSoundEffect]);

  useEffect(() => {
    if (playButtonSoundEffect) {
      playSoundButton();
      setPlayButtonSoundEffect(false);
    }
  }, [playButtonSoundEffect]);

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
