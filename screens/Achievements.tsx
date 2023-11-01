import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import { Button, Text } from "react-native-paper";
import Achievement from "../components/profile/Achievement";
import { ScrollView } from "react-native";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";

export default function Achievements({navigation}) {
  return (
    <ScrollView /*style={styles.container}*/
    contentContainerStyle={styles.scrollContent}>
      <StatusBar style="auto" />
            {/* Render the Achievement component here */}
            <Achievement />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  scrollContent: {
    width: responsiveWidth(100),
    paddingLeft: responsiveWidth(13),
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "flex-start",
  },
});
