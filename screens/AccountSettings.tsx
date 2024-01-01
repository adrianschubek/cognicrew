import { StatusBar } from "expo-status-bar";
import { ScrollView } from "react-native";
import { Divider, useTheme } from "react-native-paper";
import MusicSettings from "../components/settings/Music";
import PasswordChange from "../components/settings/PasswordChange";
import EmailChange from "../components/settings/EmailChange";
import AccountInfo from "../components/settings/AccountInfo";
import DangerZone from "../components/settings/DangerZone";
import Visual from "../components/settings/Visual";
import NameChange from "../components/settings/NameChange";
import TagsSettings from "../components/settings/Tags";
import AchievementNotification from "../components/dialogues/AchievementNotification";
import { useEffect, useState } from "react";

export default function AccountSettings() {
  const theme = useTheme();
  const [achievementVisible, setAchievementVisible] = useState(false);
  const [achievementName, setAchievementName] = useState("");
  const [achievementIcon, setAchievementIcon] = useState("");
  useEffect(() => {
    if (achievementVisible) {
      setTimeout(() => setAchievementVisible(false), 5500);
    }
  }, [achievementVisible]);
  return (
    <>
      <ScrollView
        style={{
          flex: 1,
          gap: 10,
          padding: 10,
        }}
      >
        <StatusBar style="auto" />
        <AccountInfo style={{ backgroundColor: theme.colors.surface }} />
        <Divider />
        <Visual
          sendAchievementData={(
            achievementName,
            achievementIcon,
            achievementVisible,
          ) => {
            setAchievementName(achievementName);
            setAchievementIcon(achievementIcon);
            setAchievementVisible(achievementVisible);
          }}
          style={{ marginTop: 10, backgroundColor: theme.colors.surface }}
        />
        <Divider />
        <MusicSettings
          style={{ marginTop: 10, backgroundColor: theme.colors.surface }}
        />
        <Divider />
        <TagsSettings
          style={{ marginTop: 10, backgroundColor: theme.colors.surface }}
        />
        <Divider />
        <NameChange
          style={{ marginTop: 10, backgroundColor: theme.colors.surface }}
        />
        <Divider />
        <PasswordChange
          style={{ marginTop: 10, backgroundColor: theme.colors.surface }}
        />
        <Divider />
        <EmailChange
          style={{
            marginBottom: 10,
            marginTop: 10,
            backgroundColor: theme.colors.surface,
          }}
        />
        {/* <Divider />
      <DangerZone
        style={{
          marginTop: 10,
          marginBottom: 10,
          backgroundColor: theme.colors.errorContainer,
        }}
      /> */}
      </ScrollView>
      {achievementVisible && (
        <AchievementNotification
          isVisible={achievementVisible}
          achievementName={achievementName}
          achievementIconName={achievementIcon}
        />
      )}
    </>
  );
}
