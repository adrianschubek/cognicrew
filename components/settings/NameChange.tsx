import { Slider } from "@miblanchard/react-native-slider";
import { useState } from "react";
import {
  Avatar,
  Button,
  Card,
  Text,
  TextInput,
  useTheme,
} from "react-native-paper";

const Icon = (props) => <Avatar.Icon {...props} icon="account-edit" />;

export default function NameChange(props) {
  const theme = useTheme();
  const [name, setName] = useState("");

  const validator = name.length > 4 && name.length < 32;

  return (
    <Card {...props} mode="contained">
      <Card.Title title="Change Username" left={Icon} />
      <Card.Content>
        <TextInput
          theme={{ roundness: 10 }}
          onChangeText={(e) => setName(e)}
          label={"New Username"}
          error={name.length > 0 && !validator}
        ></TextInput>
      </Card.Content>
      <Card.Actions>
        <Button disabled={!validator} mode="contained-tonal">
          Update Username
        </Button>
      </Card.Actions>
    </Card>
  );
}
