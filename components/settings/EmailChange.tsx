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
import { supabase } from "../../supabase";
import { useAlerts } from "../../utils/hooks";

const Icon = (props) => <Avatar.Icon {...props} icon="email" />;

export default function EmailChange(props) {
  const theme = useTheme();
  const [mail, setMail] = useState("");

  const validator = mail.length > 0 && mail.includes("@");

  const { success, error: errorAlert } = useAlerts();
  const update = async () => {
    const { data, error } = await supabase.auth.updateUser({ email: mail });

    if (error) errorAlert(error?.message);
    else success("E-Mail updated.", "Success");
  };

  return (
    <Card {...props} mode="contained">
      <Card.Title title="Change E-Mail" left={Icon} />
      <Card.Content>
        <TextInput
          theme={{ roundness: 10 }}
          keyboardType="email-address"
          onChangeText={(e) => setMail(e)}
          label={"New E-Mail"}
          error={mail.length > 0 && !validator}
        ></TextInput>
      </Card.Content>
      <Card.Actions>
        <Button disabled={!validator} mode="contained-tonal" onPress={update}>
          Update E-Mail
        </Button>
      </Card.Actions>
    </Card>
  );
}
