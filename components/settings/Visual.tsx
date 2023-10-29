import React, { useContext } from "react";
import { Appearance } from "react-native";
import { Card, Button, useTheme, Avatar } from "react-native-paper";
import { PreferencesContext } from "../../stores/PreferencesContext";
const Icon = (props) => <Avatar.Icon {...props} icon="palette" />;

export default function Visual(props) {
  const theme = useTheme();
  const { toggleTheme, isThemeDark } = useContext(PreferencesContext);

  return (
    <Card {...props} mode="contained">
      <Card.Title title="Design" left={Icon} />
      <Card.Content>
        <Button
          icon="weather-night"
          mode="contained-tonal"
          onPress={() => toggleTheme()}
        >
          Enable Darkmode
        </Button>
      </Card.Content>
    </Card>
  );
}
