import React, { useContext } from "react";
import { Card, Button, Avatar } from "react-native-paper";
import { PreferencesContext } from "../../stores/PreferencesContext";
import { useAchievementsOld, useUnlockAchievement } from "../../utils/hooks";

const Icon = (props) => <Avatar.Icon {...props} icon="palette" />;

export default function Visual(props: { [name: string]: any }) {
  const { toggleTheme, darkmode } = useContext(PreferencesContext);
  const unlockAchievement = useUnlockAchievement();

  const handleToggleTheme = async () => {
    toggleTheme();
    const achievementId = 9;
    const { success, data } = await unlockAchievement(achievementId);
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
