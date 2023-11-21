import * as React from "react";
import { Button, Text } from "react-native-paper";
function doNothing() {
  return;
}
export default function TextWithPlusButton(props: {
  text: string;
  onPress?: any;
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
      onPress={props.onPress !== undefined ? props.onPress : doNothing()}
    >
      <Text style={{ fontSize: 16 }}>{props.text}</Text>
    </Button>
  );
}
