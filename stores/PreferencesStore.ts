import AsyncStorage from "@react-native-async-storage/async-storage";
import { create } from "zustand";
import { createJSONStorage, persist } from "zustand/middleware";

type PreferencesStore = {
  darkmode: boolean;
  setDarkmode: (darkmode: boolean) => void;
  masterVolume: number;
  musicVolume: number;
  effectsVolume: number;
  setMasterVolume: (volume: number) => void;
  setMusicVolume: (volume: number) => void;
  setEffectsVolume: (volume: number) => void;
};

export const usePreferencesStore = create<PreferencesStore>()(
  persist(
    (set, get) => ({
      darkmode: false,
      setDarkmode: (darkmode: boolean) => set({ darkmode: darkmode }),
      masterVolume: 1,
      musicVolume: 1,
      effectsVolume: 1,
      setMasterVolume: (volume: number) => set({ masterVolume: volume }),
      setMusicVolume: (volume: number) => set({ musicVolume: volume }),
      setEffectsVolume: (volume: number) => set({ effectsVolume: volume }),
    }),
    {
      name: "preferences",
      storage: createJSONStorage(() => AsyncStorage),
    },
  ),
);
