import * as React from "react";
import { StyleSheet, View, ScrollView } from "react-native";
import { Button, Card, Text } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";

export default function SearchDropDown({ dataSource, close }) {
  return (
    <ScrollView style={{ height: responsiveHeight(20) }}>
      <View style={styles.container}>
        {dataSource.map((item) => {
          return (
            <Button
              icon="folder"
              mode="text"
              contentStyle={{
                flexDirection: "row-reverse",
                justifyContent: "flex-end",
              }}
              labelStyle={styles.itemStyle}
              style={{ marginBottom: responsiveHeight(1) }}
              onPress={close}
            >
              {item.title}
            </Button>
          );
        })}
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    width: responsiveWidth(70),
  },
  itemStyle: {
    flexWrap: "wrap",
    fontSize:responsiveFontSize(2)
  },
});
