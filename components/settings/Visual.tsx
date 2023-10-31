import React, { useContext } from "react";
import { Appearance } from "react-native";
import { Card, Button, useTheme, Avatar } from "react-native-paper";
import { PreferencesContext } from "../../stores/PreferencesContext";
import { usePreferencesStore } from "../../stores/PreferencesStore";
const Icon = (props) => <Avatar.Icon {...props} icon="palette" />;

export default function Visual(props) {
  const theme = useTheme();
  const { toggleTheme, darkmode } = useContext(PreferencesContext);

  return (
    <Card {...props} mode="contained">
      <Card.Title title="Design" left={Icon} />
      <Card.Content>
        <Button
          icon={darkmode ? "weather-sunny" : "weather-night"}
          mode="contained-tonal"
          onPress={() => toggleTheme()}
        >
          {darkmode ? "Lightmode" : "Darkmode"}
        </Button>
      </Card.Content>
    </Card>
  );
}
