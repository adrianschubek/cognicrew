import * as React from "react";
import { Dialog, Portal, TextInput, Text } from "react-native-paper";
import { StyleSheet, View } from "react-native";
import { Button } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { useState } from "react";
import { useAuth } from "../../providers/AuthProvider";
import { supabase } from "../../supabase";

export default function JoinRoom({ navigation }) {
  const [joinCode, setJoinCode] = useState("#");
  const [showErrorJoin, setShowErrorJoin] = useState(false);
  return (
    <React.Fragment>
      <Portal>
        <Dialog
          visible={showErrorJoin}
          onDismiss={() => setShowErrorJoin(false)}
        >
          <Dialog.Title>Invalid Code</Dialog.Title>
          <Dialog.Content>
            <Text>Please enter a valid code</Text>
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={() => setShowErrorJoin(false)}>Done</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
      <TextInput
        editable
        placeholder="#"
        value={joinCode}
        error={joinCode.length > 1 && joinCode.length !== 7}
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
        maxLength={7}
        inputMode="numeric"
        style={{ width: responsiveWidth(30), height: responsiveHeight(5) }}
      />
      <Button
        labelStyle={{ textAlignVertical: "center" }}
        style={[styles.buttonStyle, { width: responsiveWidth(40) }]}
        mode="contained"
        onPress={() => {
          if (joinCode.length !== 7) {
            setShowErrorJoin(true);
          } else {
            navigation.navigate("Room", { code: joinCode });
          }
        }}
      >
        Ask to join
      </Button>
    </React.Fragment>
  );
}
const styles = StyleSheet.create({
  buttonStyle: {
    marginBottom: responsiveHeight(2.5),
    marginTop: responsiveHeight(1.5),
  },
});
