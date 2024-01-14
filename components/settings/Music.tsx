import { Slider } from "@miblanchard/react-native-slider";
import { Avatar, Card, Text } from "react-native-paper";
import { useSoundsStore } from "../../stores/SoundsStore";

const Music = (props) => <Avatar.Icon {...props} icon="music" />;

export default function MusicSettings(props) {
  const { musicVolume, setMusicVolume } = useSoundsStore();
  return (
    <Card {...props} mode="contained">
      <Card.Title title="Sounds" left={Music} />
      <Card.Content>
        <Text variant="bodyMedium">
          {"Music"} ({(musicVolume * 100).toFixed(0) + "%"})
        </Text>
        <Slider
          step={0.05}
          value={musicVolume}
          // @ts-ignore
          onSlidingComplete={(v) => {
            const volumeToSet = Array.isArray(v) ? v[0] : v;
            setMusicVolume(volumeToSet);
            console.log(musicVolume);
          }}
        />
      </Card.Content>
    </Card>
  );
}
