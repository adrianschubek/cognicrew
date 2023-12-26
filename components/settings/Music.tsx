import { Slider } from "@miblanchard/react-native-slider";
import { Fragment } from "react";
import { Avatar, Card, Text } from "react-native-paper";
import { usePreferencesStore } from "../../stores/PreferencesStore";
import { useSoundsStore } from "../../stores/SoundsStore";

const Music = (props) => <Avatar.Icon {...props} icon="music" />;

export default function MusicSettings(props) {
  const {
    masterVolume,
    setMasterVolume,
  } = usePreferencesStore();

  const {musicVolume, setMusicVolume, soundEffectVolume, setSoundEffectVolume} = useSoundsStore();

  const soundCategories = [
    {
      title: "Master",
      volume: masterVolume,
      setVolume: setMasterVolume,
    },
    {
      title: "Music",
      volume: musicVolume,
      setVolume: setMusicVolume,
    },
    {
      title: "Effects",
      volume: soundEffectVolume,
      setVolume: setSoundEffectVolume,
    },
  ] as { title: string; volume: number; setVolume: (v: number) => void }[];
  return (
    <Card {...props} mode="contained">
      <Card.Title title="Sounds" left={Music} />
      <Card.Content>
        {soundCategories.map((category, index) => {
          return (
            <Fragment key={index}>
              <Text variant="bodyMedium">
                {category.title} ({(category.volume * 100).toFixed(0) + "%"})
              </Text>
              <Slider
                step={0.05}
                value={category.volume}
                // @ts-ignore
                onSlidingComplete={(v) => { const volumeToSet = Array.isArray(v) ? v[0] : v; category.setVolume(volumeToSet); console.log(category.volume)}}
              ></Slider>
            </Fragment>
          );
        })}
      </Card.Content>
    </Card>
  );
}
