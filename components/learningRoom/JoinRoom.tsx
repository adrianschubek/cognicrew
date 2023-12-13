import * as React from "react";
import { StyleSheet, View } from "react-native";
import { Button } from "react-native-paper";
import { useContext, useState } from "react";
import { NAVIGATION } from "../../types/common";
import { toArray, useAlerts } from "react-native-paper-fastalerts";
import { PreferencesContext } from "../../stores/PreferencesContext";

export default function Foo({ navigation }) {
  const { alert, error: errorAlert, info } = useAlerts();
  const { toggleTheme, darkmode } = useContext(PreferencesContext);
  return (
    <React.Fragment>
      <View style={{ flexDirection: "row", gap: 5 }}>
        <Button
          labelStyle={{ textAlignVertical: "center" }}
          mode="contained"

          onPress={async () => {
            alert({
              okAction(values) {
                const arr = toArray(values[0]); // e.g: ->  ["b", "l", "m"]
              },
              fields: [
                {
                  type: "select",
                  data: [
                    { key: "Berlin", value: "b" },
                    { key: "Paris", value: "p" },
                    { key: "London", value: "l" },
                    { key: "Madrid", value: "m" },
                  ],
                },
              ],
            });

            alert({
              title: ""
            })

          }}
          
          style={{ marginRight: "auto", flex: 1 }}
        >
          Alert
        </Button>
        <Button
          labelStyle={{ textAlignVertical: "center" }}
          mode="contained"
          onPress={toggleTheme}
          style={{ marginRight: "auto", flex: 1 }}
        >
          Darkmode
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
