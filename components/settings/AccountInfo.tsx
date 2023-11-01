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

const data = {
  name: "John Doe",
  email: "foo@bar.de",
};

export default function AccountInfo(props) {
  const theme = useTheme();
  return (
    <Card {...props} mode="contained">
      <Card.Title
        title="Account Information"
        left={Account}
        right={LogoutButton}
      />
      <Card.Content>
        <Text variant="bodyLarge">{data.name}</Text>
        <Text variant="bodyMedium">{data.email}</Text>
        <Text variant="bodyMedium">Account created on XX.XX.XXXX</Text>
        <Text variant="bodyMedium">Last login on XX.XX.XXXX HH:mm:ss</Text>
      </Card.Content>
    </Card>
  );
}
