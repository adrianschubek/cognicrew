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
  // TODO: use secure store for auth "remember me" data
  rememberMe: boolean;
  email: string;
  password: string;
  setEmail: (email: string) => void;
  setPassword: (password: string) => void;
  setRememberMe: (rememberMe: boolean) => void;
};

export const usePreferencesStore = create<PreferencesStore>()(
  persist(
    (set, get) => ({
      darkmode: false,
      setDarkmode: (darkmode: boolean) => set({ darkmode: darkmode }),
      masterVolume: 1,
      musicVolume: 0.5,
      effectsVolume: 1,
      setMasterVolume: (volume: number) => {set({ masterVolume: volume }); console.log(volume);},
      setMusicVolume: (volume: number) => set({ musicVolume: volume }),
      setEffectsVolume: (volume: number) => set({ effectsVolume: volume }),
      rememberMe: false,
      email: "",
      password: "",
      setEmail: (email: string) => set({ email: email }),
      setPassword: (password: string) => set({ password: password }),
      setRememberMe: (rememberMe: boolean) => set({ rememberMe: rememberMe }),
    }),
    {
      name: "preferences",
      storage: createJSONStorage(() => AsyncStorage),
    },
  ),
);
