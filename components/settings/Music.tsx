import { Slider } from "@miblanchard/react-native-slider";
import { Fragment } from "react";
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
      volume: effectsVolume,
      setVolume: setEffectsVolume,
    },
  ];
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
                // you are aware that all the volumes (i.e. musicVolume) are actually number[]?
                // @ts-ignore
                onSlidingComplete={(v) => category.setVolume(v)}
              ></Slider>
            </Fragment>
          );
        })}
      </Card.Content>
    </Card>
  );
}
