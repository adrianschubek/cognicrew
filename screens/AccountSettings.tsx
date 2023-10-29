import { View } from "react-native";
import { Avatar, Button, Card, Text } from "react-native-paper";
import { SafeAreaView } from "react-native-safe-area-context";

const Account = (props) => <Avatar.Icon {...props} icon="account" />;

const data = {
  name: "John Doe",
  email: "foo@bar.de",
};

export default function AccountSettings({ nav }) {
  return (
    <View
      style={{
        flex: 1,
        gap: 10,
        padding: 10,
      }}
    >
      <Card>
        <Card.Title title="Account information" left={Account} />
        <Card.Content>
          <Text variant="titleLarge">{data.name}</Text>
          <Text variant="bodyMedium">{data.email}</Text>
        </Card.Content>
      </Card>
      <Card>
        <Card.Title
          title="Card Title"
          subtitle="Card Subtitle"
          left={Account}
        />
        <Card.Content>
          <Text variant="titleLarge">Card title</Text>
          <Text variant="bodyMedium">Card content</Text>
        </Card.Content>
        <Card.Actions>
          <Button>Cancel</Button>
          <Button>Ok</Button>
        </Card.Actions>
      </Card>
    </View>
  );
}
