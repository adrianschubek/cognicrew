import { Slider } from "@miblanchard/react-native-slider";
import { StatusBar } from "expo-status-bar";
import { useState } from "react";
import { ScrollView, View } from "react-native";
import {
  Avatar,
  Button,
  Card,
  Dialog,
  IconButton,
  Portal,
  Text,
  useTheme,
} from "react-native-paper";
import MusicSettings from "../components/settings/Music";
import PasswordChange from "../components/settings/PasswordChange";
import EmailChange from "../components/settings/EmailChange";

const Danger = (props) => <Avatar.Icon {...props} icon="alert" />;

export default function AccountSettings({ nav }) {
  const theme = useTheme();

  return (
    <ScrollView
      style={{
        flex: 1,
        gap: 10,
        padding: 10,
      }}
    >
      <StatusBar style="auto" />
      
      <MusicSettings
        style={{ marginTop: 10, backgroundColor: theme.colors.surface }}
      />
      <PasswordChange
        style={{ marginTop: 10, backgroundColor: theme.colors.surface }}
      />
      <EmailChange
        style={{ marginTop: 10, backgroundColor: theme.colors.surface }}
      />
      <Card style={{ backgroundColor: theme.colors.errorContainer }}>
        <Card.Title title="Danger Zone" left={Danger} />
        <Card.Content>
          <Button
            buttonColor={theme.colors.error}
            textColor="white"
            mode="contained-tonal"
          >
            Terminate Account
          </Button>
        </Card.Content>
      </Card>
    </ScrollView>
  );
}
