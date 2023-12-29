import { Avatar } from "react-native-paper";
import { StyleProp, ViewStyle } from "react-native";
import { usePrivateFileUrl } from "../../utils/hooks";
import { useEffect, useState } from "react";
import LoadingOverlay from "../alerts/LoadingOverlay";

export default function ProfilePictureAvatar(props: {
  username: string;
  userId: string;
  size?: number;
  style?: StyleProp<ViewStyle>;
  [name: string]: any;
}) {
  /*maybe use global state for own avatar, so the fast-alert doesnt always refetch when opened */
  const [avatarUrl, setAvatarUrl] = useState<string>("");
  const { username, userId, size, style } = props;
  const { data, error, isLoading, mutate } = usePrivateFileUrl(
    `${userId}/avatar`,
    "profile-pictures",
  );

  useEffect(() => {
    if (!data) return;
    if (data === "not found") {
      setAvatarUrl("");
      return;
    }
    //console.log("In PPA: ", data);
    setAvatarUrl(data);
  }, [data]);
  if (isLoading) return <LoadingOverlay visible={isLoading} />;
  return avatarUrl ? (
    <Avatar.Image
      {...props}
      style={style}
      size={size}
      source={{ uri: avatarUrl }}
    />
  ) : (
    <Avatar.Text
      {...props}
      style={style}
      size={size}
      label={username.substring(0, 2)}
    />
  );
}
