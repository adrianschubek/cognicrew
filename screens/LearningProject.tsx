import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { ImageBackground, StyleSheet, View, Image } from "react-native";
import { Button, Text } from "react-native-paper";
import ImageResizeMode from 'react-native/Libraries/Image/ImageResizeMode'
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";

export default function ManageFriends({ navigation }) {
  return (
    <View style={styles.container}>
      {/*<Image
        height={responsiveHeight(100)}
        width={responsiveWidth(100)}
        resizeMode={Image.resizeMode.center}
        source={require("../assets/camera_symbol.png")}
  />*/}
      {/*<View style={styles.category}>
      </View>
      <View style={styles.category}>
        
      </View>
      <View style={styles.category}></View>
  <View style={styles.category}></View> */}
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
   /* flex: 1,
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "flex-start", */
  },
  category: {
    width: responsiveWidth(100),
    height: responsiveHeight(12),
    marginBottom: responsiveHeight(2),
    //backgroundColor: "red"
  },
});
