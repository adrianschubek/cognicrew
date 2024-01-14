import { StatusBar } from "expo-status-bar";
import { KeyboardAvoidingView, Platform, ScrollView } from "react-native";
import { Divider, useTheme } from "react-native-paper";
import MusicSettings from "../components/settings/Music";
import PasswordChange from "../components/settings/PasswordChange";
import EmailChange from "../components/settings/EmailChange";
import AccountInfo from "../components/settings/AccountInfo";
import DangerZone from "../components/settings/DangerZone";
import Visual from "../components/settings/Visual";
import NameChange from "../components/settings/NameChange";
import TagsSettings from "../components/settings/Tags";

export default function AccountSettings() {
  const theme = useTheme();
  return (
    <>
      {/* makes content avoid keyboard, extra space between TextInput and keyboard would be cool, 
      idk how to do this without additional library like 'react-native-keyboard-aware-scroll-view' */}
      <KeyboardAvoidingView
        behavior={Platform.OS === "ios" ? "padding" : "height"}
        style={{ flex: 1 }}
      >
        <ScrollView
          style={{
            gap: 10,
            padding: 10,
          }}
        >
          <StatusBar style="auto" />
          <AccountInfo style={{ backgroundColor: theme.colors.surface }} />
          <Divider />
          <Visual
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
          <Divider />
          <MusicSettings
            style={{
              marginTop: 10,
              marginBottom: 20,
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
      </KeyboardAvoidingView>
    </>
  );
}
