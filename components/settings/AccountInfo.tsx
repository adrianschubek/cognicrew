import React, { useState } from "react";
import {
  Avatar,
  Button,
  Card,
  IconButton,
  Text,
  useTheme,
} from "react-native-paper";
import { supabase } from "../../supabase";
import { useAuth } from "../../providers/AuthProvider";
import { useAlerts, useUsername } from "../../utils/hooks";
import { mutate } from "swr";
import { NAVIGATION } from "../../types/common";
import { useNavigation } from "@react-navigation/native";
import { View } from "react-native";

const Account = (props) => <Avatar.Icon {...props} icon="account" />;

export const LogoutButton = () => {
  const theme = useTheme();
  const { confirm } = useAlerts();

  return (
    <>
      <IconButton
        mode="contained"
        style={{
          borderColor: theme.colors.primary,
          marginRight: 10,
          borderRadius: 10,
        }}
        icon="logout"
        onPress={() => {
          confirm({
            title: "Logout",
            icon: "logout",
            message: "Are you sure you want to logout?",
            okText: "Logout",
            okAction: async () => {
              await supabase.auth.signOut();
              mutate(/* match all keys */ () => true, undefined, false);
            },
          });
        }}
        testID="logout-button"
      />
    </>
  );
};

export default function AccountInfo(props) {
  const { user } = useAuth();
  const { data, isLoading } = useUsername();

  const navigation = useNavigation<any>();

  return (
    <Card {...props} mode="contained">
      <Card.Title title="Account" left={Account} />
      <Card.Content>
        <Text variant="bodyMedium">{isLoading ? "..." : data}</Text>
        <Text variant="bodyMedium">{user.email}</Text>
        <Text variant="bodyMedium">
          Account created on {new Date(user.created_at).toLocaleDateString()}
        </Text>
        <Text variant="bodyMedium">
          Last login at {new Date(user.last_sign_in_at).toLocaleString()}
        </Text>
        <Button
          onPress={() => {
            navigation.navigate(NAVIGATION.GLOBAL_STATISTICS);
          }}
          icon={"chart-bar"}
          mode="contained-tonal"
          style={{ marginTop: 20 }}
        >
          Global Statistics
        </Button>
      </Card.Content>
    </Card>
  );
}
