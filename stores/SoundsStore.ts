import { create } from "zustand";
import { createJSONStorage, persist } from "zustand/middleware";
import AsyncStorage from "@react-native-async-storage/async-storage";

type PersistingSoundsStoreType = {
  musicVolume: number;
  loaded: boolean;
  setMusicVolume: (volume: number) => void;
  setLoaded: (loaded: boolean) => void;
};

export const usePersistingSoundsStore = create<PersistingSoundsStoreType>()(
  persist(
    (set, get) => ({
      musicVolume: 0,
      loaded: false,
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

type SoundsStoreType = {
  inGame: boolean;
  setInGame: (audioSource: any) => void;
};

export const useSoundsStore = create<SoundsStoreType>()((set, get) => ({
  inGame: false,
  setInGame: (inGame) => set({ inGame }),
}));
