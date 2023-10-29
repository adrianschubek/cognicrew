import React from "react";
import { Card, Button, useTheme, Avatar } from "react-native-paper";
const Icon = (props) => <Avatar.Icon {...props} icon="draw" />;

export default function Visual(props) {
  const theme = useTheme();
  return (
    <Card {...props} mode="contained">
      <Card.Title title="Design" left={Icon} />
      <Card.Content>
          <Button icon="weather-night" mode="contained-tonal">Enable Darkmode</Button>
      </Card.Content>
    </Card>
  );
}
