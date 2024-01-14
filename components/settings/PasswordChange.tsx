import { useState } from "react";
import {
  Avatar,
  Button,
  Card,
  TextInput,
  HelperText,
} from "react-native-paper";
import { supabase } from "../../supabase";
import { useAlerts } from "react-native-paper-fastalerts";

const Icon = (props) => <Avatar.Icon {...props} icon="key" />;

export default function PasswordChange(props) {
  const [pw1, setPw1] = useState("");
  const [pw2, setPw2] = useState("");

  const pwLength = pw1.length >= 9 && pw1.length < 64;
  const validator = pw1 === pw2 && pw1.length >= 9 && pw1.length < 64;
  const { success, error: errorAlert } = useAlerts();
  const update = async () => {
    const { data, error } = await supabase.auth.updateUser({ password: pw1 });

    if (error) errorAlert({ message: error.message });
    else success({ message: "Password updated successfully" });
  };
  const pw1NotValid = !pwLength && pw1 !== "";
  const pw2NotValid = pw1 !== pw2 && pw2 !== "";
  return (
    <Card {...props} mode="contained">
      <Card.Title title="Change Password" left={Icon} />
      <Card.Content>
        <TextInput
          theme={{
            roundness: 10,
          }}
          value={pw1}
          onChangeText={(t) => setPw1(t)}
          label={"New Password"}
          secureTextEntry={true}
          error={pw1NotValid}
        />
        {pw1NotValid && (
          <HelperText type="error" variant="bodyMedium">
            New Password has to be longer than 8.
          </HelperText>
        )}
        <TextInput
          style={{ marginTop: 10 }}
          theme={{
            roundness: 10,
          }}
          value={pw2}
          onChangeText={(t) => setPw2(t)}
          label={"Confirm New Password"}
          secureTextEntry={true}
          error={pw2NotValid}
        />
        {pw2NotValid && (
          <HelperText type="error" variant="bodyMedium">
            Password needs to match.
          </HelperText>
        )}
      </Card.Content>
      <Card.Actions>
        <Button disabled={!validator} mode="contained-tonal" onPress={update}>
          Update Password
        </Button>
      </Card.Actions>
    </Card>
  );
}
