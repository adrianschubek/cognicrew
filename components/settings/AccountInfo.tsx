import React, { useState } from "react";
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
import { supabase } from "../../supabase";
import { useAuth } from "../../providers/AuthProvider";
import { useUsername } from "../../utils/hooks";

const Account = (props) => <Avatar.Icon {...props} icon="account" />;

const LogoutButton = () => {
  const theme = useTheme();
  const [showConfirm, setShowConfirm] = useState(false);

  return (
    <>
      <Portal>
        <Dialog visible={showConfirm} onDismiss={() => setShowConfirm(false)}>
          <Dialog.Title>Confirm</Dialog.Title>
          <Dialog.Content>
            <Text variant="bodyMedium">Are you sure you want to logout?</Text>
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={() => setShowConfirm(false)}>Cancel</Button>
            <Button
              onPress={async () => {
                setShowConfirm(false);
                await supabase.auth.signOut();
              }}
            >
              Logout
            </Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
      <Button
        mode="outlined"
        textColor={theme.colors.error}
        style={{
          borderColor: theme.colors.error,
          marginRight: 10,
          borderRadius: 10,
        }}
        icon="logout"
        onPress={() => {
          setShowConfirm(true);
        }}
      >
        Logout
      </Button>
    </>
  );
};

export default function AccountInfo(props) {
  const { user } = useAuth();
  const username = useUsername();
  return (
    <Card {...props} mode="contained">
      <Card.Title title="Account" left={Account} right={LogoutButton} />
      <Card.Content>
        <Text variant="bodyMedium">{username}</Text>
        <Text variant="bodyMedium">{user.email}</Text>
        <Text variant="bodyMedium">
          Account created on {new Date(user.created_at).toLocaleDateString()}
        </Text>
        <Text variant="bodyMedium">
          Last login at {new Date(user.last_sign_in_at).toLocaleString()}
        </Text>
      </Card.Content>
    </Card>
  );
}
