import { create } from "zustand";
import { Audio } from 'expo-av';
import { usePreferencesStore } from "./PreferencesStore";


type SoundsStoreType = {
  isLoaded: boolean;
  isLoaded2: boolean;
  sound: Audio.Sound | null;
  loadSound1: (audioSource: any) => void;
  loadSound2: (audioSource: any) => void;
  playSound: () => void;
  stopSound: () => void;
};

export const useSoundsStore = create<SoundsStoreType>((set, get) => ({
  
  isLoaded: false,
  isLoaded2: false,
  sound: null,

  getValueAFromStoreA: () => usePreferencesStore.getState().masterVolume,
  
  loadSound1: async (audioSource) => {
    try {
      console.log("LOADED SOUND 1");
      const { sound } = await Audio.Sound.createAsync(audioSource);
      set({ sound, isLoaded: true, isLoaded2: false });
      get().playSound(); 
    } catch (error) {
      console.error("Error loading sound:", error);
    }
  },

  loadSound2: async (audioSource) => {
    try {
      console.log("LOADED SOUND 2");
      const { sound } = await Audio.Sound.createAsync(audioSource);
      set({ sound, isLoaded2: true, isLoaded: false });
      get().playSound();
    } catch (error) {
      console.error("Error loading sound:", error);
    }
  },
  playSound: async () => {
    const { sound, isLoaded, isLoaded2 } = get();
    if (isLoaded && sound || isLoaded2 && sound) {
      console.log(usePreferencesStore.getState().masterVolume)
      await sound.setVolumeAsync(usePreferencesStore.getState().musicVolume[0]);
      await sound.playAsync();
    } 
  },
  stopSound: async () => {
    const { sound, isLoaded, isLoaded2 } = get();
    if (isLoaded && sound || isLoaded2 && sound) {
      await sound.stopAsync();
    } 
  },
}));
