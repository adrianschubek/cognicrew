import React, { useContext } from "react";
import { Card, Button, Avatar } from "react-native-paper";
import { PreferencesContext } from "../../stores/PreferencesContext";
import {
  useAchievement,
  useAchievementsOld,
  useInsertAchievement,
  useUnlockAchievement,
} from "../../utils/hooks";
import { useAuth } from "../../providers/AuthProvider";
import { usePreferencesStore } from "../../stores/PreferencesStore";

const Icon = (props) => <Avatar.Icon {...props} icon="palette" />;

export default function Visual(props: { [name: string]: any }) {
  const { user } = useAuth();
  const { toggleTheme, darkmode } = useContext(PreferencesContext);
  const unlockedAchievementIds = usePreferencesStore(
    (state) => state.unlockedAchievementIds,
  );
  //const unlockAchievement = useUnlockAchievement();
  const { trigger: unlockAchievement } = useInsertAchievement();
  const handleToggleTheme = async () => {
    toggleTheme();
    if (!darkmode) {
      if (!unlockedAchievementIds.includes(9)) {
        unlockAchievement({
          //@ts-expect-error
          achievement_id: 9, //achievementId
          user_id: user.id,
        });
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
