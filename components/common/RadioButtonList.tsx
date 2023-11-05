import * as React from "react";
import { useState } from "react";
import { StyleSheet, View, ScrollView, Keyboard } from "react-native";
import {
  Button,
  Card,
  RadioButton,
  Text,
  TouchableRipple,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";

export default function RadioButtonList({ dataSource, close }) {
  const [value, setValue] = useState("");
  return (
    <React.Fragment>
      <View style={styles.container}>
        <ScrollView
          style={{ height: responsiveHeight(20) }}
          keyboardShouldPersistTaps="handled"
        >
          <RadioButton.Group
            onValueChange={(value) => {
              setValue(value);
            }}
            value={value}
          >
            {dataSource.map((item) => (
              <RadioButton.Item label={item.title} value={item.title} />
            ))}
          </RadioButton.Group>
        </ScrollView>
      </View>
    </React.Fragment>
  );
}

const styles = StyleSheet.create({
  container: {
    width: responsiveWidth(70),
  },
  itemStyle: {
    flexWrap: "wrap",
    fontSize: responsiveFontSize(2),
  },
});
