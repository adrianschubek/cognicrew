import { create } from "zustand";


type SoundsStoreType = {
  inGame: boolean;
  setInGame: (audioSource: any) => void;

  playButtonSoundEffect: boolean;
  setPlayButtonSoundEffect: (audioSource: any) => void;

  musicVolume: number;
  setMusicVolume: (volume: number) => void;

  soundEffectVolume: number;
  setSoundEffectVolume: (volume: number) => void;

  masterVolume: number;
  setMasterVolume: (volume: number) => void;
};

export const useSoundsStore = create<SoundsStoreType>((set, get) => ({

  inGame: false,
  setInGame: (inGame) => set({ inGame }),

  playButtonSoundEffect: false,
  setPlayButtonSoundEffect: (playButtonSoundEffect) => set({ playButtonSoundEffect }),

  musicVolume: 0,
  setMusicVolume: (volume: number) => set({ musicVolume: volume }),

  soundEffectVolume: 0.5,
  setSoundEffectVolume: (volume: number) => set({ soundEffectVolume: volume }),

  masterVolume: 1.0,
  setMasterVolume: (volume: number) => set({ masterVolume: volume }),
  
  
}));
