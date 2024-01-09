import AsyncStorage from "@react-native-async-storage/async-storage";
import { create } from "zustand";
import { createJSONStorage, persist } from "zustand/middleware";

type PreferencesStore = {
  darkmode: boolean;
  // TODO: use secure store for auth "remember me" data
  rememberMe: boolean;
  email: string;
  password: string;
  unlockedAchievementIds: number[];
  achievementSignal: boolean;
  setDarkmode: (darkmode: boolean) => void;
  setRememberMe: (rememberMe: boolean) => void;
  setEmail: (email: string) => void;
  setPassword: (password: string) => void;
  setUnlockedAchievementIds: (unlockedAchievementIds: number[]) => void;
  setAchievementSignal: (value: boolean) => void;
};

export const usePreferencesStore = create<PreferencesStore>()(
  persist(
    (set, get) => ({
      darkmode: false,
      rememberMe: false,
      email: "",
      password: "",
      unlockedAchievementIds: [],
      achievementSignal: false,
      setDarkmode: (darkmode: boolean) => set({ darkmode: darkmode }),
      setRememberMe: (rememberMe: boolean) => set({ rememberMe: rememberMe }),
      setEmail: (email: string) => set({ email: email }),
      setPassword: (password: string) => set({ password: password }),
      setUnlockedAchievementIds: (unlockedAchievementIds: number[]) =>
        set({ unlockedAchievementIds: unlockedAchievementIds }),
      setAchievementSignal: (value) => set({ achievementSignal: value }),
    }),

    {
      name: "preferences",
      storage: createJSONStorage(() => AsyncStorage),
    },
  ),
);
