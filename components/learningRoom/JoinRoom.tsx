import * as React from "react";
import { TextInput, Text } from "react-native-paper";
import { StyleProp, View, ViewStyle } from "react-native";
import { useState } from "react";
import { supabase } from "../../supabase";
import { useAlerts } from "react-native-paper-fastalerts";
import { useRoomStore } from "../../stores/RoomStore";

export default function JoinRoom(props: { style?: StyleProp<ViewStyle> }) {
  const [joinCode, setJoinCode] = useState("#");
  const { alert, error: errorAlert, info } = useAlerts();
  const setRoom = useRoomStore((state) => state.setRoom);
  return (
    <View style={props.style}>
      <Text variant="titleSmall">Join Room via code</Text>
      <TextInput
        editable
        placeholder="#"
        value={joinCode}
        error={joinCode.length > 1 && joinCode.length !== 7}
        maxLength={7}
        inputMode="numeric"
        mode="outlined"
        style={{ height: 40, width: "auto", textAlign: "center" }}
        onChangeText={(text) => {
          if (text === "") {
            text = "#";
          }
          // only allow numbers
          text = text.replace(/[^0-9]/g, "");
          // if the first character is not a #, add it.
          if (!text.includes("#")) {
            text = "#" + text;
          }
          setJoinCode(text);
        }}
        onSubmitEditing={async () => {
          const { data, error } = await supabase.rpc("quick_join_room", {
            p_share_code: +joinCode.substring(1),
          });
          if (!data?.id)
            return errorAlert({ title: "Error", message: "Room not found." });
          setRoom(data);
        }}
      />
    </View>
  );
}
