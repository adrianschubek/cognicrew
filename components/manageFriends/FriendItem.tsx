import * as React from "react";
import { StyleSheet, View, Image, StyleProp, ViewStyle } from "react-native";
import { Card, Checkbox, IconButton, Text, useTheme } from "react-native-paper";
import {
  responsiveFontSize,
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import { useUsername } from "../../utils/hooks";
import { useState } from "react";
import ProfilePictureAvatar from "../profile/ProfilePictureAvatar";

export default function FriendItem(props: {
  icon: string;
  friendId: string;
  onIconPress;
  secondIcon?: string;
  friendName?: string;
  onSecondIconPress?;
  showCheckbox?: boolean;
  onCheck?: () => void;
  style?: StyleProp<ViewStyle>;
  [name: string]: any;
}) {
  const theme = useTheme();
  const [checked, setChecked] = useState(false);
  const friendName = props.friendName
    ? props.friendName
    : useUsername(props.friendId).data;
  return (
    <Card style={props.style}>
      <Card.Content style={styles.item}>
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
      </Card.Content>
    </Card>
  );
}
const styles = StyleSheet.create({
  item: {
    flexDirection: "row",
    alignItems: "center",
    paddingHorizontal: responsiveWidth(2),
    paddingVertical: responsiveHeight(0.8),
    elevation: 0,
    /*borderRadius: 5,
    marginBottom: responsiveHeight(0.8),
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.22,
    shadowRadius: 2.22,
    elevation: 3,*/
  },
});
