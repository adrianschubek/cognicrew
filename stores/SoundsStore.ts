import { create } from "zustand";


type SoundsStoreType = {
  inGame: boolean;
  setInGame: (audioSource: any) => void;

  musicVolume: number;
  setMusicVolume: (volume: number) => void;
};

export const useSoundsStore = create<SoundsStoreType>((set, get) => ({

  inGame: false,
  setInGame: (inGame) => set({ inGame }),

  musicVolume: 0,
  setMusicVolume: (volume: number) => set({ musicVolume: volume }),
}));
