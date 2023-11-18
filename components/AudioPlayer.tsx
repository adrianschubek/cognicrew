// AudioPlayer.js
import React, { useState, useEffect } from 'react';
import { View, Button } from 'react-native';
import { Audio } from 'expo-av';

import { useSoundsStore } from "../stores/SoundsStore";

const AudioPlayer = ({ audioSource }) => {

  const [sound, setSound] = useState<Audio.Sound | undefined>(undefined);
  useEffect(() => {
    // Load the audio file when the component mounts
    const loadSound = async () => {
      const { sound } = await Audio.Sound.createAsync(
        audioSource
     );
      setSound(sound);
    };

    loadSound();

    // Clean up resources when the component unmounts
    return () => {
      if (sound) {
        sound.unloadAsync();
      }
    };
  }, [audioSource]);

  const playSound = async () => {
    if (sound) {
      await sound.playAsync();
    }
  };

  const stopSound = async () => {
    if (sound) {
      await sound.stopAsync();
    }
  };

  return (
    <View>
      <Button title="Play Sound" onPress={playSound} />
      <Button title="Stop Sound" onPress={stopSound} />
    </View>
  );
};

export default AudioPlayer;
