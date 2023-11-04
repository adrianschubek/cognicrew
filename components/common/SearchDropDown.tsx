import * as React from "react";
import { StyleSheet, View, ScrollView } from "react-native";
import { Text } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";

export default function SearchDropDown({ dataSource }) {
  return dataSource.map((item) => {
    <View style={styles.container}>
      <Text>{item.title}</Text>
    </View>;
  });
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: "gray",
  },
});
