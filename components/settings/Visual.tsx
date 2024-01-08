import React, { useContext } from "react";
import { Card, Button, Avatar } from "react-native-paper";
import { PreferencesContext } from "../../stores/PreferencesContext";
import { useAchievementsOld, useUnlockAchievement } from "../../utils/hooks";

const Icon = (props) => <Avatar.Icon {...props} icon="palette" />;

export default function Visual(props: {
  sendAchievementData: (
    achievementName: string,
    achievementIconName: string,
    achievementVisible: boolean,
  ) => void;
  [name: string]: any;
}) {
  const { toggleTheme, darkmode } = useContext(PreferencesContext);
  const unlockAchievement = useUnlockAchievement();
  const { data: achievementsData } = useAchievementsOld();

  const handleToggleTheme = async () => {
    toggleTheme();
    const achievementId = 9;
    const { success, data } = await unlockAchievement(achievementId);

    if (success && !darkmode) {
      console.log("JA");
      const achievement = achievementsData?.find(
        (ach) => ach.id === achievementId,
      );
      props.sendAchievementData(
        achievement?.name || "",
        achievement?.icon_name || "",
        true,
      );
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
