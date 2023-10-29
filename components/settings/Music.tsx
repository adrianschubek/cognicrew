import { Slider } from "@miblanchard/react-native-slider";
import { useState } from "react";
import { Avatar, Card, Text } from "react-native-paper";

const Music = (props) => <Avatar.Icon {...props} icon="music" />;

export default function MusicSettings(props) {
  const [masterVolume, setMasterVolume] = useState(0.5);
  const [musicVolume, setMusicVolume] = useState(0.5);
  const [soundsVolume, setSoundsVolume] = useState(0.5);

  return (
    <Card {...props} mode="contained">
      <Card.Title title="Sounds" left={Music} />
      <Card.Content>
        <Text variant="bodyMedium">
          Master ({(masterVolume * 100).toFixed(0) + "%"})
        </Text>
        <Slider
          step={0.01}
          value={masterVolume}
          onValueChange={(v) => setMasterVolume(v)}
        ></Slider>
        <Text variant="bodyMedium">
          Music ({(musicVolume * 100).toFixed(0) + "%"})
        </Text>
        <Slider
          step={0.01}
          value={musicVolume}
          onValueChange={(v) => setMusicVolume(v)}
        ></Slider>
        <Text variant="bodyMedium">
          Sounds ({(soundsVolume * 100).toFixed(0) + "%"})
        </Text>
        <Slider
          step={0.01}
          value={soundsVolume}
          onValueChange={(v) => setSoundsVolume(v)}
        ></Slider>
      </Card.Content>
    </Card>
  );
}
