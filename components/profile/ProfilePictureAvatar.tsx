import { Avatar } from "react-native-paper";
import { StyleProp, ViewStyle } from "react-native";
import { usePrivateFileUrl, usePublicFileUrl } from "../../utils/hooks";
import { useEffect, useMemo, useRef, useState } from "react";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { supabase } from "../../supabase";
import { v4 as uuidv4 } from "uuid";
export default function ProfilePictureAvatar(props: {
  username: string;
  userId: string;
  size?: number;
  style?: StyleProp<ViewStyle>;
  [name: string]: any;
}) {
  /*maybe use global state for own avatar, so the fast-alert doesnt always refetch when opened */
  const [avatarTimestamp, setAvatarTimestamp] = useState<number>(Date.now());
  const originalUrlRef = useRef<string | undefined>();
  const { username, userId, size, style } = props;
  const { data, error, isLoading, mutate } = usePublicFileUrl(
    `${userId}/avatar`,
    "profile-pictures",
  );
  useEffect(() => {
    const uniqueId = uuidv4();
    const avatarTracker = supabase
      .channel(`files-${username}-tracker-${uniqueId}`)
      .on(
        "postgres_changes",
        {
          event: "*",
          schema: "public",
          table: "tracker",
          filter: "key=eq.profile-pictures",
        },
        (payload) => {
          setAvatarTimestamp(Date.now());
          //mutate();
        },
      )
      .subscribe();
  }, []);

  useEffect(() => {
    if (!data || data === "not found") return;
    originalUrlRef.current = data;
    setAvatarTimestamp(Date.now());
  }, [data]);

  if (isLoading) return <LoadingOverlay visible={isLoading} />;
  return avatarTimestamp ? (
    <Avatar.Image
      {...props}
      key={avatarTimestamp}
      style={style}
      size={size}
      source={{ uri: originalUrlRef.current + "?t=" + avatarTimestamp }}
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
