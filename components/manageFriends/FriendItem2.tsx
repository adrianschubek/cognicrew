import * as React from "react";
import { StyleSheet, View, Image } from "react-native";
import { IconButton, Text, useTheme, Checkbox } from "react-native-paper";
import {
  responsiveFontSize,
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import { useUsername } from "../../utils/hooks";

// will be replaced with real icon of user once backend is ready for it
const getFriendIconUrl = (friendName) =>
  `https://support.discord.com/hc/user_images/yVOeDzOpxgO8ODSf9bDQ-g.png`;


// FriendItem2 is similar to FriendItem, but with added prop for checkbox state and added prop for checkbox press handler
export default function FriendItem2(props: {
  icon: string;
  friend: string;
  onIconPress;
  checked: boolean;
  onCheck: () => void;
  [name: string]: any;
}) {
  const theme = useTheme();
  const username = useUsername(props.friend);

  return (
    <View
      style={[
        styles.item,
        { backgroundColor: theme.colors.background, shadowColor: theme.colors.shadow },
      ]}
    >
      {/* Checkbox added to the left of the IconButton */}
      <Checkbox
        status={props.checked ? 'checked' : 'unchecked'}
        onPress={props.onCheck}
        color={theme.colors.primary}
      />

      <Image
        source={{ uri: getFriendIconUrl(props.friend) }}
        style={styles.profileIcon}
      />
      <Text style={styles.itemText}>{username.data}</Text>

      <IconButton
        icon={props.icon}
        size={responsiveFontSize(3)}
        onPress={props.onIconPress}
      />
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
