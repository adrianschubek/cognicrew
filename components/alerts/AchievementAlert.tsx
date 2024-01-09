import { useEffect, useState } from "react";
import AchievementNotification from "../dialogues/AchievementNotification";
import { supabase } from "../../supabase";
import { useAchievement, useUsername } from "../../utils/hooks";
import { Portal } from "react-native-paper";
import { usePreferencesStore } from "../../stores/PreferencesStore";

export default function AchievementAlert(props: { userId: string }) {
  const [achievementVisible, setAchievementVisible] = useState(false);
  const [achievementId, setAchievementId] = useState<number>(0);
  const [achievementName, setAchievementName] = useState<string>("");
  const [achievementIconName, setAchievementIconName] = useState<string>("");
  const { data: username } = useUsername(props.userId);
  const { data, error, isLoading, mutate } = useAchievement(achievementId);

  useEffect(() => {
    if (!data) return;
    setAchievementName(data[0].name);
    setAchievementIconName(data[0].icon_name);
    setAchievementVisible(true);
    setTimeout(() => setAchievementVisible(false), 5500);
  }, [data]);
  useEffect(() => {
    const achievementTracker = supabase
      .channel(`${username}-achievement-tracker`)
      .on(
        "postgres_changes",
        {
          event: "INSERT", // should be "INSERT" when everything is set up
          schema: "public",
          table: "user_achievements",
          filter: "user_id=eq." + props.userId,
        },
        (payload) => {
          setAchievementId(payload.new.achievement_id);
          //console.log("achievement Id: ", payload.new.achievement_id);
        },
      )
      .subscribe();
  }, []);
  //console.log("achievementVisible: ", achievementVisible);
  return (
    <Portal>
      {achievementVisible && (
        <AchievementNotification
          achievementIconName={achievementIconName}
          achievementName={achievementName}
        />
      )}
    </Portal>
  );
}
