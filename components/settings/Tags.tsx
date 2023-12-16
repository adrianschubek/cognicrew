import React, { useState } from "react";
import { Avatar, Button, Card, HelperText, TextInput } from "react-native-paper";

const Tags = (props) => <Avatar.Icon {...props} icon="tag-multiple" />;

export default function TagsSettings(props) {
  const [tags, setTags] = useState(null);

  const updateTags = async () => {
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
