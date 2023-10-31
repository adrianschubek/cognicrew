import AsyncStorage from "@react-native-async-storage/async-storage";
import { create } from "zustand";
import { persist } from "zustand/middleware";

type PreferencesStore = {
  darkmode: boolean;
  setDarkmode: (darkmode: boolean) => void;
};

export const usePreferencesStore = create<PreferencesStore>()(
  persist(
    (set, get) => ({
      darkmode: false,
      setDarkmode: (darkmode: boolean) => set({ darkmode: darkmode }),
    }),
    {
      name: "preferences",
      getStorage: () => AsyncStorage,
    },
  ),
);
