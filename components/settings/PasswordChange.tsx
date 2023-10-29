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

const Icon = (props) => <Avatar.Icon {...props} icon="key" />;

export default function PasswordChange(props) {
  const theme = useTheme();
  const [pw1, setPw1] = useState("");
  const [pw2, setPw2] = useState("");

  const validator = pw1 === pw2 && pw1.length > 8 && pw1.length < 64;

  return (
    <Card {...props} mode="contained">
      <Card.Title title="Change Password" left={Icon} />
      <Card.Content>
        <TextInput
          value={pw1}
          onChangeText={(t) => setPw1(t)}
          label={"New Password"}
          secureTextEntry={true}
          error={pw1.length > 0 && !validator}
        ></TextInput>
        <TextInput
          value={pw2}
          onChangeText={(t) => setPw2(t)}
          label={"Confirm New Password"}
          secureTextEntry={true}
          error={pw1.length > 0 && !validator}
        ></TextInput>
      </Card.Content>
      <Card.Actions>
        <Button disabled={!validator} mode="contained-tonal">
          Update Password
        </Button>
      </Card.Actions>
    </Card>
  );
}
