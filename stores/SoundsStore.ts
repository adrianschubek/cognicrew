import { create } from "zustand";

// CURRENTLY NOT IN USE

type SoundsStoreType = {
  sound: any,
  setSound: (path:any) => void,
};

export const useSoundsStore = create<SoundsStoreType>((set, get) => ({
  sound: null,
  setSound:  (sound) => set({ sound }),

}));
