import { Slider } from "@miblanchard/react-native-slider";
import { useState } from "react";
import { Avatar, Card, Text } from "react-native-paper";
import { usePreferencesStore } from "../../stores/PreferencesStore";

const Music = (props) => <Avatar.Icon {...props} icon="music" />;

export default function MusicSettings(props) {
  const {
    musicVolume,
    setMusicVolume,
    effectsVolume,
    setEffectsVolume,
    masterVolume,
    setMasterVolume,
  } = usePreferencesStore();

  return (
    <Card {...props} mode="contained">
      <Card.Title title="Sounds" left={Music} />
      <Card.Content>
        <Text variant="bodyMedium">
          Master ({(masterVolume * 100).toFixed(0) + "%"})
        </Text>
        <Slider
          step={0.05}
          value={masterVolume}
          // @ts-ignore
          onSlidingComplete={(v) => setMasterVolume(v)}
        ></Slider>
        <Text variant="bodyMedium">
          Music ({(musicVolume * 100).toFixed(0) + "%"})
        </Text>
        <Slider
          step={0.05}
          value={musicVolume}
          // @ts-ignore
          onSlidingComplete={(v) => setMusicVolume(v)}
        ></Slider>
        <Text variant="bodyMedium">
          Effects ({(effectsVolume * 100).toFixed(0) + "%"})
        </Text>
        <Slider
          step={0.05}
          value={effectsVolume}
          // @ts-ignore
          onSlidingComplete={(v) => setEffectsVolume(v)}
        ></Slider>
      </Card.Content>
    </Card>
  );
}
