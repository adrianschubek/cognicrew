import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { ImageBackground, StyleSheet, View, Image } from "react-native";
import { Button, Text } from "react-native-paper";
import ImageResizeMode from "react-native/Libraries/Image/ImageResizeMode";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";

export default function ManageFriends({ navigation }) {
  return (
    <View style={styles.container}>
      <View style={styles.category}>
      <Image
        style={styles.imageStyle}
        resizeMode="contain"
        source={require("../assets/camera_symbol.png")}
      />
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
    width: responsiveWidth(100),
    height: responsiveHeight(100),
     flex: 1,
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "flex-start", 
  },
  category: {
    width: responsiveWidth(100),
    height: responsiveHeight(12),
    marginBottom: responsiveHeight(2),
    flexDirection:"row",
    justifyContent:"flex-end",
    //backgroundColor: "red"
  },
  imageStyle: {
    height: responsiveHeight(12),
    width: responsiveWidth(40.5),
    flex:0,
    //backgroundColor:"green"
  },
});
