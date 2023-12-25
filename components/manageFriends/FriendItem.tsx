import * as React from "react";
import { StyleSheet, View, Image } from "react-native";
import { Checkbox, IconButton, Text, useTheme } from "react-native-paper";
import {
  responsiveFontSize,
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import { useUsername } from "../../utils/hooks";
import { useState } from "react";
import ProfilePictureAvatar from "../profile/ProfilePictureAvatar";
/**
 * `getFriendIconUrl` - Returns a URL for a friend's icon.
 * NOTE: This should be replaced with actual logic to retrieve the friend's profile image.
 * @param {string} friendName - The name of the friend whose icon URL is requested.
 * @returns {string} The URL of the friend's profile icon.
 */
// use once database is ready: const getFriendIconUrl = (friendName) => `path_to_user's profile icons/${friendName}.png`;
const getFriendIconUrl = (friendName) =>
  `https://support.discord.com/hc/user_images/yVOeDzOpxgO8ODSf9bDQ-g.png`;

export default function FriendItem(props: {
  icon: string;
  secondIcon?: string;
  friendId: string;
  friendName?: string;
  onIconPress;
  onSecondIconPress?;
  showCheckbox?: boolean;
  onCheck?: () => void;
  [name: string]: any;
}) {
  const theme = useTheme();
  const [checked, setChecked] = useState(false);
  const friendName = props.friendName
    ? props.friendName
    : useUsername(props.friendId).data;
  console.log(friendName);
  return (
    <View
      style={[
        styles.item,
        {
          backgroundColor: theme.colors.background,
          shadowColor: theme.colors.shadow,
        },
      ]}
    >
      {props.showCheckbox && (
        <Checkbox
          status={checked ? "checked" : "unchecked"}
          onPress={props.onCheck ? props.onCheck : () => {}}
          color={theme.colors.primary}
        />
      )}
      <ProfilePictureAvatar
        {...props}
        size={40}
        style={{ marginRight: 10 }}
        username={friendName ?? ""}
        userId={props.friendId}
      />
      {/* <Image
        source={{ uri: getFriendIconUrl(props.friendId) }}
        style={styles.profileIcon}
      /> */}

      <Text variant="titleMedium" style={{ flex: 1 }}>
        {friendName}
      </Text>
      <IconButton
        icon={props.icon}
        size={responsiveFontSize(3)}
        onPress={props.onIconPress}
      />
      {props.secondIcon && (
        <IconButton
          icon={props.secondIcon}
          size={responsiveFontSize(3)}
          onPress={props.onSecondIconPress}
        />
      )}
    </View>
  );
}
const styles = StyleSheet.create({
  item: {
    flexDirection: "row",
    alignItems: "center",
    marginBottom: responsiveHeight(0.8),
    paddingHorizontal: responsiveWidth(2),
    paddingVertical: responsiveHeight(0.8),
    borderRadius: 5,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.22,
    shadowRadius: 2.22,
    elevation: 3,
  },
});
