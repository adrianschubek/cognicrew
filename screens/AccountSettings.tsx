import { StatusBar } from "expo-status-bar";
import { useState } from "react";
import { View } from "react-native";
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

const Account = (props) => <Avatar.Icon {...props} icon="account" />;
const Music = (props) => <Avatar.Icon {...props} icon="music" />;
const KeyIcon = (props) => <Avatar.Icon {...props} icon="key" />;
const Danger = (props) => <Avatar.Icon {...props} icon="alert" />;

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
              onPress={() => {
                setShowConfirm(false);
                // TODO: supabase.auth.signOut();
              }}
            >
              Logout
            </Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
      <IconButton
        mode="outlined"
        iconColor={theme.colors.error}
        style={{
          borderColor: theme.colors.error,
          marginRight: 10,
          borderRadius: 10,
        }}
        icon="logout"
        onPress={() => {
          setShowConfirm(true);
        }}
      />
    </>
  );
};

const data = {
  name: "John Doe",
  email: "foo@bar.de",
};

export default function AccountSettings({ nav }) {
  const theme = useTheme();
  return (
    <View
      style={{
        flex: 1,
        gap: 10,
        padding: 10,
      }}
    >
      <StatusBar style="auto" />
      <Card>
        <Card.Title
          title="Account Information"
          left={Account}
          right={LogoutButton}
        />
        <Card.Content>
          <Text variant="bodyLarge">{data.name}</Text>
          <Text variant="bodyMedium">{data.email}</Text>
          <Text variant="bodyMedium">Account created on XXXXXXX</Text>
        </Card.Content>
      </Card>
      <Card>
        <Card.Title title="Sounds" left={Music} />
        <Card.Content>
          <Text variant="titleLarge">Sounds</Text>
          <Text variant="bodyMedium">Card content</Text>
        </Card.Content>
      </Card>
      <Card>
        <Card.Title title="Change Passsword" left={KeyIcon} />
        <Card.Content>
          <Text variant="titleLarge">Password</Text>
          <Text variant="bodyMedium">Card content</Text>
        </Card.Content>
        <Card.Actions>
          <Button>Cancel</Button>
          <Button>Ok</Button>
        </Card.Actions>
      </Card>
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
        {/* <Card.Actions> */}
        {/* </Card.Actions> */}
      </Card>
    </View>
  );
}
