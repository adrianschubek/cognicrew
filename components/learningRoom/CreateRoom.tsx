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

export default function CreateRoom({ navigation }) {
  return (
    <React.Fragment>
      <Card>
        <Button
        icon="home"
        mode="contained"
        style={{ marginTop: responsiveHeight(5) }}
        contentStyle={{
          height: responsiveHeight(10),
          /*backgroundColor:"yellow",*/ alignItems: "center",
        }}
        labelStyle={{
          lineHeight: responsiveFontSize(3.25),
          fontSize: responsiveFontSize(2),
          textAlignVertical: "center",
          height: responsiveFontSize(3),
          //backgroundColor:"red"
        }}
        onPress={() => {
          navigation.navigate("LearningRoom");
        }}
      >
        Create Room
      </Button>
      </Card>
    </React.Fragment>
  );
}
const styles = StyleSheet.create({
});
