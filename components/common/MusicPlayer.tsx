import { useEffect, useRef, useState } from "react";
import {
  usePersistingSoundsStore,
  useSoundsStore,
} from "../../stores/SoundsStore";
import { Audio } from "expo-av";

export default function MusicPlayer() {
  const music = useRef(new Audio.Sound());
  const { inGame } = useSoundsStore();
  const { musicVolume } = usePersistingSoundsStore();
  const [isLoading, setIsLoading] = useState(false);
  async function stopMusic() {
    if (music.current._loaded) {
      await music.current.stopAsync();
      await music.current.unloadAsync();
    }
  }
  async function playMusic() {
    if (isLoading) return;
    setIsLoading(true);
    stopMusic();
    try {
      if (!inGame) {
        await music.current.loadAsync(
          require("../../assets/sounds/lobby_song.m4a"),
        );
      } else {
        await music.current.loadAsync(
          require("../../assets/sounds/game_song.m4a"),
        );
      }
      await music.current.setIsLoopingAsync(true);
      await music.current.setVolumeAsync(musicVolume);
      await music.current.playAsync();
    } catch (error) {
      console.error("Error playing audio", error);
    }
    setIsLoading(false);
  }

  async function changeMusicVolume() {
    if (music.current._loaded) {
      try {
        await music.current.setVolumeAsync(musicVolume);
      } catch (error) {
        console.error("Error changing volume", error);
      }
    }
  }

  useEffect(() => {
    return () => {
      stopMusic();
    };
  }, []);
  useEffect(() => {
    playMusic();
  }, [inGame]);

  useEffect(() => {
    changeMusicVolume();
  }, [musicVolume]);
  return null;
}
