import { useState } from "react";
import {
  Avatar,
  Button,
  Card,
  HelperText,
  TextInput,
  useTheme,
} from "react-native-paper";
import { supabase } from "../../supabase";
import { useAuth } from "../../providers/AuthProvider";
import { useAlerts } from "react-native-paper-fastalerts";

const Icon = (props) => <Avatar.Icon {...props} icon="account-edit" />;

export default function NameChange(props) {
  const theme = useTheme();
  const { success, error: errorAlert } = useAlerts();
  const [name, setName] = useState("");

  const validator = name.length > 4 && name.length < 32;

  const { user } = useAuth();
  const updateUsername = async () => {
    const { data, error } = await supabase
      .from("profiles")
      .update({ username: name })
      .eq("id", user.id);

    if (error)
      errorAlert({
        message: error.message,
      });
    else
      success({
        message:
          "Username updated successfully. You may need to re-login to see changes.",
      });
  };

  return (
    <Card {...props} mode="contained">
      <Card.Title title="Change Username" left={Icon} />
      <Card.Content>
        <TextInput
          theme={{ roundness: 10 }}
          onChangeText={(e) => setName(e)}
          label={"New Username"}
          error={name.length > 0 && !validator}
        />
        {name.length > 0 && !validator && (
          <HelperText type="error" variant="bodyMedium">
            Name has to be longer than 4 and shorter than 32 characters.
          </HelperText>
        )}
      </Card.Content>
      <Card.Actions>
        <Button
          testID="update-username-button"
          disabled={!validator}
          mode="contained-tonal"
          onPress={() => updateUsername()}
        >
          Update Username
        </Button>
      </Card.Actions>
    </Card>
  );
}
