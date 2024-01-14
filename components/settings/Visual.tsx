import React, { useContext } from "react";
import { Card, Button, Avatar } from "react-native-paper";
import { PreferencesContext } from "../../stores/PreferencesContext";
import { usePreferencesStore } from "../../stores/PreferencesStore";
import { supabase } from "../../supabase";

const Icon = (props) => <Avatar.Icon {...props} icon="palette" />;

export default function Visual(props: { [name: string]: any }) {
  const { toggleTheme, darkmode } = useContext(PreferencesContext);
  const unlockedAchievementIds = usePreferencesStore(
    (state) => state.unlockedAchievementIds,
  );
  const handleToggleTheme = async () => {
    toggleTheme();
    if (!darkmode) {
      if (!unlockedAchievementIds.includes(9)) {
        const error = await supabase.rpc("insert_achievement", { id: 9 });
        console.log("error: ", error);
      }
    }
  };

  return (
    <Card {...props} mode="contained">
      <Card.Title title="Design" left={Icon} />
      <Card.Content>
        <Button
          icon={darkmode ? "weather-sunny" : "weather-night"}
          mode="contained-tonal"
          onPress={handleToggleTheme}
        >
          {darkmode ? "Lightmode" : "Darkmode"}
        </Button>
      </Card.Content>
    </Card>
  );
}
