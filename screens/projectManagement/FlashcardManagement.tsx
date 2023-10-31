import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import { Button, Text } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import LearningProjectCategory from "../../components/learningProject/LearningProjectCategory";
import TextWithPlusButton from "../../components/common/TextWithPlusButton";

export default function FlashcardManagement({ navigation }) {
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <View style={styles.upperContainer}>
      <TextWithPlusButton text="add new flash cards" function={() => {}} />
      </View>
      <View style={styles.contentSetStyle}>
        
      </View>
      <LearningProjectCategory
        path={require("../../assets/cards_symbol.png")}
        name={"Flashcard Management"}
      />

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
          fontSize: responsiveFontSize(3),
          textAlignVertical: "center",
          padding: 0,
          height: responsiveFontSize(3),
          //backgroundColor:"red"
        }}
        onPress={() => {
          navigation.navigate("LearningRoom");
        }}
      >
        Create Room
      </Button>
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
  upperContainer:{
    flex:0,
    width:responsiveWidth(100),
    //backgroundColor:"red",
    flexDirection:"row",
    justifyContent:"flex-end"
  },
  contentSetStyle:{

  },
});
