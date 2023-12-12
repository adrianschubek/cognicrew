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
import { useAlerts } from "react-native-paper-fastalerts";

const Icon = (props) => <Avatar.Icon {...props} icon="email" />;

export default function EmailChange(props) {
  const theme = useTheme();
  const [mail, setMail] = useState("");

  const validator = mail.length > 0 && mail.includes("@");

  const { success, error: errorAlert, alert } = useAlerts();

  const update = async () => {
    const { data, error } = await supabase.auth.updateUser({ email: mail });

    if (error)
      errorAlert({
        message: error.message,
      });
    else
      alert({
        icon: "account-check",
        title: "Enter code sent to your new mail: ",
        message:
          "Please enter the verification code you received in your email.",
        dismissable: false,
        okText: "Confirm",
        async okAction(verification) {
          const { data, error } = await supabase.auth.verifyOtp({
            email: mail,
            token: verification[0], 
            
            type: "email_change",
          });
          if (error) return error?.message ?? "Unknown error";
          success({
            message: "E-Mail updated successfully",
          });
        },
        fields: [
          {
            label: "Verification code:",
            type: "number",
          },
        ],
      });

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
