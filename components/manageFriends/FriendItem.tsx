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
  friend: string;
  onIconPress;
  onSecondIconPress?;
  showCheckbox?: boolean;
  onCheck?: () => void;
  [name: string]: any;
}) {
  const theme = useTheme();
  const [checked, setChecked] = useState(false);
  const friendName = useUsername(props.friend).data;
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
          onPress={props.onCheck? props.onCheck : () => {}}
          color={theme.colors.primary}
        />
      )}
      <Image
        source={{ uri: getFriendIconUrl(props.friend) }}
        style={styles.profileIcon}
      />
      <Text style={styles.itemText}>{friendName}</Text>
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
  profileIcon: {
    width: responsiveFontSize(5),
    height: responsiveFontSize(5),
    borderRadius: responsiveFontSize(3),
    marginRight: responsiveWidth(1),
  },
  itemText: {
    flex: 1,
    fontSize: responsiveFontSize(2),
  },
});
