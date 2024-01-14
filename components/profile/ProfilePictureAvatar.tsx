import { Avatar } from "react-native-paper";
import { StyleProp, ViewStyle } from "react-native";
import { usePublicFileUrl } from "../../utils/hooks";
import { useEffect, useRef, useState } from "react";
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
  const [avatarTimestamp, setAvatarTimestamp] = useState<number>(null);
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
          filter: "key=eq." + userId,
        },
        (payload) => {
          //console.log(avatarTimestamp);
          fetch(originalUrlRef.current, {
            headers: {
              "Cache-Control": "no-cache",
            },
          }).then((response) => {
            response.ok
              ? setAvatarTimestamp(Date.now())
              : setAvatarTimestamp(null);
          });
        },
      )
      .subscribe();
  }, []);

  useEffect(() => {
    if (!data || data === "not found") return;
    originalUrlRef.current = data;
    fetch(data, {
      headers: {
        "Cache-Control": "no-cache",
      },
    }).then((response) => {
      if (response.ok) {
        setAvatarTimestamp(Date.now());
      } else {
        setAvatarTimestamp(null);
      }
    });
  }, [data]);
  
  if (isLoading) return <LoadingOverlay visible={isLoading} />;
  return avatarTimestamp ? (
    <Avatar.Image
      {...props}
      key={`image-${avatarTimestamp}`}
      style={style}
      size={size}
      source={{ uri: originalUrlRef.current + "?t=" + avatarTimestamp }}
    />
  ) : (
    <Avatar.Text
      {...props}
      key={`text-${username}`}
      style={style}
      size={size}
      label={username.substring(0, 2)}
    />
  );
}
