import React, { useContext, useState } from "react";
import { Appearance } from "react-native";
import { Card, Button, useTheme, Avatar } from "react-native-paper";
import { PreferencesContext } from "../../stores/PreferencesContext";
import { usePreferencesStore } from "../../stores/PreferencesStore";
import { useAchievements, useUnlockAchievement } from "../../utils/hooks";
import AchievementNotification from "../dialogues/AchievementNotification";

const Icon = (props) => <Avatar.Icon {...props} icon="palette" />;

export default function Visual(props) {
  const theme = useTheme();
  const { toggleTheme, darkmode } = useContext(PreferencesContext);
  const unlockAchievement = useUnlockAchievement();
  const [achievementVisible, setAchievementVisible] = useState(false);
  const { data: achievementsData } = useAchievements();
  const [achievementName, setAchievementName] = useState("");
  const [achievementIcon, setAchievementIcon] = useState("");

  const handleToggleTheme = async () => {
    toggleTheme();
    const achievementId = 9;
    const { success, data } = await unlockAchievement(achievementId);

    if (success && !darkmode) {
      console.log("JA");
      const achievement = achievementsData?.find(
        (ach) => ach.id === achievementId,
      );
      setAchievementName(achievement?.name || "");
      setAchievementIcon(achievement?.icon_name || "");
      setAchievementVisible(true);
      setTimeout(() => setAchievementVisible(false), 4000);
    }
  };

  return (
    <>
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
      <AchievementNotification
        isVisible={achievementVisible}
        achievementName={achievementName}
        achievementIconName={achievementIcon}
      />
    </>
  );
}
