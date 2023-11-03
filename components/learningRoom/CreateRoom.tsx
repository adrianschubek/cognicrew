import * as React from "react";
import { Dialog, Portal, TextInput, Text, Card } from "react-native-paper";
import { StyleSheet, View, ScrollView } from "react-native";
import { Button } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { useState } from "react";
import { useAuth } from "../../providers/AuthProvider";
import { supabase } from "../../supabase";

import AccordionSection from "../../components/learningRoom/AccordionCreateRoom";

export default function CreateRoom({ navigation }) {
  return (
    <React.Fragment>
      <Card>
        
      	 <Text
          style={[styles.container, {}]}
          >
          Create room:
        </Text>
        
        <AccordionSection/>

        <Button
        icon="home"
        mode="contained"
        style={[styles.container, {marginTop: responsiveHeight(2.4)}]} 
        contentStyle={{
          //height: responsiveHeight(10),
          /*backgroundColor:"yellow",*/ alignItems: "center",
        }}
        labelStyle={{
          //lineHeight: responsiveFontSize(1),
          //fontSize: responsiveFontSize(2),
          //textAlignVertical: "center",
          //height: responsiveFontSize(3),
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
  container: {
    width: responsiveWidth(40),
    marginBottom: responsiveHeight(2.5),
    marginTop: responsiveHeight(1.5),
  },
  buttonStyle: {
    //marginBottom: responsiveHeight(2.5),
    //marginTop: responsiveHeight(1.5),
  },
});
