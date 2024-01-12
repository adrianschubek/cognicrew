import { Button, Card, IconButton, Text, useTheme } from "react-native-paper";
import { supabase } from "../../supabase";
import { useAuth } from "../../providers/AuthProvider";
import { useAlerts } from "react-native-paper-fastalerts";
import { useUsername } from "../../utils/hooks";
import { mutate } from "swr";
import { NAVIGATION } from "../../types/common";
import { useNavigation } from "@react-navigation/native";
import { TouchableOpacity, View } from "react-native";
import { selectAndUploadImage } from "../../utils/FileFunctions";
import ProfilePictureAvatar from "../profile/ProfilePictureAvatar";
import { useSoundsStore } from "../../stores/SoundsStore";


const Account = (props) => {
  const { confirm } = useAlerts();
  const { user } = useAuth();
  const username = user.user_metadata.username as string;
  const filePath = `${user.id}`;
  const icon = "image-edit"; //avatarUrl ? "image-edit" : "image-plus";

  return (
    <TouchableOpacity
      onPress={() => {
        return confirm({
          icon: icon,
          title: "Change your avatar",
          okText: "Done",
          cancelText: "",
          fields: [
            {
              type: "custom",
              render() {
                return (
                  <ProfilePictureAvatar
                    {...props}
                    style={{ alignSelf: "center", marginBottom: 10 }}
                    username={username}
                    userId={user.id}
                    size={200}
                  />
                );
              },
            },
            {
              label: "Remove avatar",
              type: "button",
              icon: "image-remove",
              action: async () => {
                await supabase.storage
                  .from("profile-pictures")
                  .remove([filePath + "/avatar"]);
              },
              errorText: "Could not remove image",
            },
            {
              label: "Upload image",
              type: "button",
              icon: "image-plus",
              action: async () => {
                await selectAndUploadImage(filePath, {
                  bucketName: "profile-pictures",
                  fileName: "avatar",
                });
              },
              errorText: "Could not upload image",
            },
          ],
        });
      }}
    >
      <ProfilePictureAvatar {...props} username={username} userId={user.id} />
    </TouchableOpacity>
  );
};

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
  
  const {setPlayButtonSoundEffect} = useSoundsStore();

  return (
    <Card {...props} mode="contained">
      <Card.Title title="◀ Change Avatar" left={Account} />
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
            //setPlayButtonSoundEffect(true); //Will later be added to new Button component
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
