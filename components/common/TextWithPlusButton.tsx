import * as React from "react";
import { StyleSheet, View } from "react-native";
import { Button, Text } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
function doNothing() {
  return;
}
export default function TextWithPlusButton(props) {
  return (
    <Button
      icon="plus"
      mode="text"
      labelStyle={{
        textAlignVertical: "center",
        fontSize: 28,
      }}
      contentStyle={{ flexDirection: "row-reverse" }}
      onPress={props.function || doNothing()}
    >
      <Text style={{ fontSize: 16 }}>
        {props.text}
      </Text>
    </Button>
  );
}
const styles = StyleSheet.create({});
 