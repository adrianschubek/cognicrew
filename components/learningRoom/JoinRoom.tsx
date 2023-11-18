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
import { useAlerts } from "../../utils/hooks";

export default function JoinRoom({ navigation }) {
  const [joinCode, setJoinCode] = useState("#");
  const { alert, error: errorAlert, info } = useAlerts();
  return (
    <React.Fragment>
      <Text style={[styles.container, { textAlign: "center" }]}>
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
        style={[styles.container, { height: responsiveHeight(8) }]}
      />
      <View style={{ flexDirection: "row", gap: 5 }}>
        <Button
          labelStyle={{ textAlignVertical: "center" }}
          mode="contained"
          onPress={async () => {
            alert({
              title: "New Flashcardgame",
              dismissable: false,
              cancelText: "Cancel",
              okAction(values) {
                console.log(values);
              },
              fields: [
                {
                  label: "Round duration (seconds)",
                  type: "number",
                  icon: "timer-outline",
                  defaultValue: "30",
                },
                {
                  type: "button",
                  label: "Create",
                },
                {
                  type: "search-select", // wie create flashcard game
                  data: [
                    { key: "Foo", value: "f1" },
                    { key: "xxx", value: "f2" },
                    { key: "aa", value: "f35" },
                    ...Array.from({ length: 100 }, (_, i) => ({
                      key: `xxx${i}`,
                      value: `yyy${i}`,
                    })),
                  ],
                  visibleOptions: 5
                },
              ],
            });
          }}
          style={{ marginRight: "auto", flex: 1 }}
        >
          Join
        </Button>
        <Button
          labelStyle={{ textAlignVertical: "center" }}
          mode="contained"
          onPress={() => {
            navigation.navigate(NAVIGATION.ROOMS_LIST);
          }}
          style={{ marginRight: "auto", flex: 1 }}
        >
          Rooms
        </Button>
      </View>
    </React.Fragment>
  );
}
const styles = StyleSheet.create({
  container: {
    width: "100%",
    alignItems: "center",
    marginVertical: 10,
  },
});
