import * as React from "react";
import { StyleSheet, View, ScrollView } from "react-native";
import { Text } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";

export default function SearchDropDown(props) {
  const { dataSource } = props;
  return (
    <View style={styles.container}>
      {dataSource.map((item) => {
        return <Text style={styles.itemStyle}>{item.title}</Text>;
      })}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    width: responsiveWidth(60),
  },
  itemStyle: {
    flexWrap: "wrap",
    marginBottom: responsiveHeight(1),
  },
});
