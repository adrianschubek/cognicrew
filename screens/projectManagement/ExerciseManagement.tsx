import * as React from "react";
import { StyleSheet, View, ScrollView } from "react-native";
import { Text } from "react-native-paper";
import {
    responsiveHeight,
    responsiveWidth,
    responsiveFontSize,
  } from "react-native-responsive-dimensions";

export default function ExerciseManagement() {
    return (
        <Text>

        </Text>
    );
}

const styles = StyleSheet.create({
    container: {
        width: responsiveWidth(100),
        height: responsiveHeight(100),
        flex: 1,
        flexDirection: "column",
        alignItems: "center",
        justifyContent: "flex-start",
      },
      upperContainer: {
        flex: 0,
        width: responsiveWidth(100),
        //backgroundColor:"red",
        flexDirection: "row",
        justifyContent: "flex-end",
      },
});