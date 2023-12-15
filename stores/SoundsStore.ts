import { create } from "zustand";


type SoundsStoreType = {
  inGame: boolean;
  setInGame: (audioSource: any) => void;
};

export const useSoundsStore = create<SoundsStoreType>((set, get) => ({

  inGame: false,
  setInGame: (inGame) => set({ inGame }),

}));
