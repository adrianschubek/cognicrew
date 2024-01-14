import { create } from "zustand";
import { createJSONStorage, persist } from "zustand/middleware";
import AsyncStorage from "@react-native-async-storage/async-storage";

type SoundsStoreType = {
  inGame: boolean;
  musicVolume: number;
  loaded: boolean;
  setInGame: (audioSource: any) => void;
  setMusicVolume: (volume: number) => void;
  setLoaded: (loaded: boolean) => void;
};

export const useSoundsStore = create<SoundsStoreType>()(
  persist(
    (set, get) => ({
      inGame: false,
      musicVolume: 0,
      loaded: false,
      setInGame: (inGame) => set({ inGame }),
      setMusicVolume: (volume: number) => set({ musicVolume: volume }),
      setLoaded: (loaded: boolean) => set({ loaded }),
    }),
    {
      name: "sounds",
      storage: createJSONStorage(() => AsyncStorage),
      onRehydrateStorage: () => (state) => state && state.setLoaded(true),
    },
  ),
);
