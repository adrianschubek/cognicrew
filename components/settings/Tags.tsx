import React, { useState } from "react";
import { Avatar, Button, Card, HelperText, TextInput } from "react-native-paper";
import { supabase } from "../../supabase";
import { useAlerts } from "react-native-paper-fastalerts";
import { useAuth } from "../../providers/AuthProvider";

const Tags = (props) => <Avatar.Icon {...props} icon="tag-multiple" />;

export default function TagsSettings(props) {

  const { success, error: errorAlert } = useAlerts();
  const [tags, setTags] = useState("");
  const { user } = useAuth();

  const updateTags = async () => {
    const { data, error } = await supabase
    .from("profiles")
    .update(({user_tags: tags }) as { [key: string]: any }) 
    .eq("id", user.id)
    .select();

    if (error)
      errorAlert({
        message: error.message,
      });
    else
      success({
        message:
          "Tags updated successfully.",
      });
  }

  return (
    <Card {...props} mode="contained">
      <Card.Title title="Interests" left={Tags} />
      <Card.Content>
        <TextInput
          style={{ marginTop: 10 }}
          theme={{ roundness: 10 }}
          label="Tags"
          value={tags}
          onChangeText={(text) => setTags(text)}
        />
        <HelperText type="info">
          Add tags separated by commas that match your interests to get a
          personalized discovery page
        </HelperText>
      </Card.Content>
      <Card.Actions>
        <Button
          mode="contained-tonal"
          onPress={() => updateTags()}
        >
          Update Tags
        </Button>
      </Card.Actions>
    </Card>
  );
}
