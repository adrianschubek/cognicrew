import { useState } from "react";
import { Avatar, Button, Card, TextInput, useTheme } from "react-native-paper";
import { useAuth } from "../../providers/AuthProvider";
import { supabase } from "../../supabase";
import { useAlerts } from "react-native-paper-fastalerts";

const Icon = (props) => <Avatar.Icon {...props} icon="key" />;

export default function PasswordChange(props) {
  const theme = useTheme();
  const [pw1, setPw1] = useState("");
  const [pw2, setPw2] = useState("");

  const validator = pw1 === pw2 && pw1.length > 8 && pw1.length < 64;

  const { user } = useAuth();
  const { success, error: errorAlert } = useAlerts();
  const update = async () => {
    const { data, error } = await supabase.auth.updateUser({ password: pw1 });

    if (error) errorAlert({ message: error.message });
    else success({ message: "Password updated successfully" });
  };

  return (
    <Card {...props} mode="contained">
      <Card.Title title="Change Password" left={Icon} />
      <Card.Content>
        <TextInput
          theme={{ roundness: 10 }}
          value={pw1}
          onChangeText={(t) => setPw1(t)}
          label={"New Password"}
          secureTextEntry={true}
          error={pw1.length > 0 && !validator}
        ></TextInput>
        <TextInput
          style={{ marginTop: 10 }}
          theme={{ roundness: 10 }}
          value={pw2}
          onChangeText={(t) => setPw2(t)}
          label={"Confirm New Password"}
          secureTextEntry={true}
          error={pw2.length > 0 && !validator}
        ></TextInput>
      </Card.Content>
      <Card.Actions>
        <Button disabled={!validator} mode="contained-tonal" onPress={update}>
          Update Password
        </Button>
      </Card.Actions>
    </Card>
  );
}
