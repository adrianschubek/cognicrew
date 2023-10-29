import React from "react";
import { Card, Button, useTheme, Avatar } from "react-native-paper";
const Danger = (props) => <Avatar.Icon {...props} icon="alert" />;

export default function DangerZone(props) {
  const theme = useTheme();
  return (
    <Card {...props} mode="contained">
      <Card.Title title="Danger Zone" left={Danger} />
      <Card.Content>
        <Button
          buttonColor={theme.colors.error}
          textColor="white"
          mode="contained-tonal"
        >
          Terminate Account
        </Button>
      </Card.Content>
    </Card>
  );
}
