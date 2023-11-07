import * as React from "react";
import { Dialog, Portal, TextInput, Text, Card } from "react-native-paper";
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
import { NAVIGATION } from "../../types/common";

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
        <Text
          style={[styles.container, {textAlign: 'center'}]}
        >
          Join room via ID:
        </Text>
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
          style={[styles.container, {height: responsiveHeight(8)}]}
        />
        <Button
          labelStyle={{ textAlignVertical: "center" }}
          style={[styles.container]}
          mode="contained"
          onPress={() => {
            if (joinCode.length !== 7) {
              setShowErrorJoin(true);
            } else {
              navigation.navigate(NAVIGATION.LEARNING_ROOM, { code: joinCode });
            }
          }}
        >
          Join
        </Button>
    </React.Fragment>
  );
}
const styles = StyleSheet.create({
  container: {
    width: '100%', 
    alignItems: 'center',
    marginVertical: 10, 
  },
});
