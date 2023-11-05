import * as React from "react";
import { useState } from "react";
import { StyleSheet, View, ScrollView } from "react-native";
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

export default function SearchDropDown({ dataSource, close }) {
  const [value, setValue] = useState("");
  return (
    <React.Fragment>
      <View style={styles.container}>
    <ScrollView style={{ height: responsiveHeight(20) }}>
      
        <RadioButton.Group
          onValueChange={(value) => {setValue(value)}}
          value={value}
        >
          {dataSource.map((item) => (
            <RadioButton.Item label={item.title} value={item.title}  />
          ))}
        </RadioButton.Group>
      
    </ScrollView>
    <Button style={{alignSelf:"flex-end"}} onPress={close}>
      Done
    </Button>
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
