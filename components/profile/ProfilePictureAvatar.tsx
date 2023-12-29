import { Avatar } from "react-native-paper";
import { StyleProp, ViewStyle } from "react-native";
import { usePublicFileUrl } from "../../utils/hooks";
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
  const { data, error, isLoading, mutate } = usePublicFileUrl(
    `${userId}`,
    "profile-pictures",
  );

  useEffect(() => {
    if (!data) return;
    const timestamp = Date.now();
    const url = `${data}/avatar?${timestamp}`;
    fetch(url)
      .then((res) => {
        if (!res.ok) {
          throw new Error("Network response was not ok");
        }
        setAvatarUrl(url);
        console.log("matching image");
      })
      .catch(() => {
        setAvatarUrl("");
        console.log("no matching image");
      });
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
