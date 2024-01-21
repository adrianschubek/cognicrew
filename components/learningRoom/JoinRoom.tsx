import * as React from "react";
import { TextInput, Text, Button } from "react-native-paper";
import { StyleProp, View, ViewStyle } from "react-native";
import { useState } from "react";
import { supabase } from "../../supabase";
import { useAlerts } from "react-native-paper-fastalerts";
import { useRoomStore } from "../../stores/RoomStore";

export default function JoinRoom(props: { style?: StyleProp<ViewStyle> }) {
  const [joinCode, setJoinCode] = useState("#");
  const { error: errorAlert } = useAlerts();
  const setRoom = useRoomStore((state) => state.setRoom);
  const join = async () => {
    const { data, error } = await supabase.rpc("quick_join_room", {
      p_share_code: +joinCode.substring(1),
    });
    if (!data?.id)
      return errorAlert({ title: "Error", message: "Room not found." });
    //@ts-ignore it works, database function is just to lazy to specify the return type
    setRoom(data);
  };
  return (
    <View style={props.style}>
      <Text variant="titleSmall">Join Room via code</Text>
      <View
        style={{
          flexDirection: "row",
          alignItems: "center",
          width: "100%",
          gap: 5,
        }}
      >
        <TextInput
          editable
          placeholder="#"
          value={joinCode}
          error={joinCode.length > 1 && joinCode.length !== 7}
          maxLength={7}
          inputMode="numeric"
          mode="outlined"
          style={{
            height: 40,
            textAlign: "center",
            textAlignVertical: "center",
            flex: 1,
          }}
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
          onSubmitEditing={join}
        />
        <Button mode="contained-tonal" onPress={join}>
          Join
        </Button>
      </View>
    </View>
  );
}
