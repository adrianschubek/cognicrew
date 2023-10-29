import { Slider } from "@miblanchard/react-native-slider";
import { useState } from "react";
import { Avatar, Button, Card, Text, TextInput, useTheme } from "react-native-paper";

const Icon = (props) => <Avatar.Icon {...props} icon="key" />;

export default function EmailChange(props) {
  const theme = useTheme();
  const [masterVolume, setMasterVolume] = useState(0.5);
  const [musicVolume, setMusicVolume] = useState(0.5);
  const [soundsVolume, setSoundsVolume] = useState(0.5);

  return (
    <Card {...props} mode="contained">
      <Card.Title title="Change Password" left={Icon} />
      <Card.Content>
        <TextInput label={"New email"}></TextInput>
        <TextInput label={"Confirm New email"}></TextInput>
      </Card.Content>
      <Card.Actions>
        <Button mode="contained-tonal">Update Email</Button>
      </Card.Actions>
    </Card>
  );
}
