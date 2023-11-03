import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, ScrollView } from "react-native";
import { Text } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import TextWithPlusButton from "../../components/common/TextWithPlusButton";
import AccordionSection from "../../components/learningProject/AccordionSection";

export default function ExerciseManagement() {
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <View style={styles.upperContainer}>
        <TextWithPlusButton text= "add new Exercises" function={() => {}} />
      </View>
      <ScrollView>
       <AccordionSection type="exercise"/>
      </ScrollView>
    </View>
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
