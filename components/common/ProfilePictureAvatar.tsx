import { Avatar } from "react-native-paper";
import { useAvatarStore } from "../../stores/AvatarStore";
import { StyleProp, ViewStyle } from "react-native";
export default function ProfilePictureAvatar(props: {
  username: string;
  size?: number;
  style?: StyleProp<ViewStyle>;
  [name: string]: any;
}) {
  const { avatarUrl, urlHasMatchingImage } = useAvatarStore();
  const { username, size, style } = props;
  return urlHasMatchingImage ? (
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
