import * as React from "react";
import { StyleSheet } from "react-native";
import { Button, Text } from "react-native-paper";
function doNothing() {
  return;
}
export default function TextWithPlusButton(props: {
  text: string;
  onPress?: () => any;
}) {
  return (
    <Button
      icon="plus"
      mode="text"
      labelStyle={{
        textAlignVertical: "center",
        fontSize: 28,
      }}
      contentStyle={{ flexDirection: "row-reverse" }}
      onPress={props.onPress() || doNothing()}
    >
      <Text style={{ fontSize: 16 }}>{props.text}</Text>
    </Button>
  );
}
const styles = StyleSheet.create({});
