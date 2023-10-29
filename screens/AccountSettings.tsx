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
import AccountInfo from "../components/settings/AccountInfo";
import DangerZone from "../components/settings/DangerZone";
import Visual from "../components/settings/Visual";

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
      <AccountInfo style={{ backgroundColor: theme.colors.surface }} />
      <Visual
        style={{ marginTop: 10, backgroundColor: theme.colors.surface }}
      />
      <MusicSettings
        style={{ marginTop: 10, backgroundColor: theme.colors.surface }}
      />
      <PasswordChange
        style={{ marginTop: 10, backgroundColor: theme.colors.surface }}
      />
      <EmailChange
        style={{ marginTop: 10, backgroundColor: theme.colors.surface }}
      />
      <DangerZone
        style={{
          marginTop: 10,
          marginBottom: 10,
          backgroundColor: theme.colors.errorContainer,
        }}
      />
    </ScrollView>
  );
}
