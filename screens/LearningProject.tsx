import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import { Button, Text } from "react-native-paper";
import {
    responsiveHeight,
    responsiveWidth,
    responsiveFontSize,
  } from "react-native-responsive-dimensions";
  import Svg, {
    Use,
    Image,
  } from 'react-native-svg';

export default function ManageFriends({ navigation }) {
  return (
    <View style={styles.container}>
      <View style={styles.category}>
      <Svg>
        <Image href={require("../assets/undraw_playing_cards_cywn.svg")}/>
     </Svg>
      </View>
      <View style={styles.category}>
        
      </View>
      <View style={styles.category}></View>
      <View style={styles.category}></View>
      <StatusBar style="auto" />
      <Button
        icon="home"
        mode="contained"
        onPress={() => {
          navigation.goBack();
          console.log("ManageFriends Screen Pressed");
        }}
      >
        Create Room
      </Button>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection:"column",
    alignItems: "center",
    justifyContent: "flex-start",
  },
  category: {
    width: responsiveWidth(100),
    height: responsiveHeight(12),
    marginBottom:responsiveHeight(2),
    //backgroundColor: "red"
  },
});
