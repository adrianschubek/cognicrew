import * as React from "react";
import { StatusBar } from "expo-status-bar";
import {
  ImageBackground,
  StyleSheet,
  View,
  Image,
  TouchableOpacity,
} from "react-native";
import { Button, Text, Divider } from "react-native-paper";
import ImageResizeMode from "react-native/Libraries/Image/ImageResizeMode";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";

export default function LearningProjectCategory(props) {
  return (
    <>
      <TouchableOpacity>
        <View style={styles.category}>
          <Text style={styles.textStyle}> {props.name} </Text>
          <Image
            style={styles.imageStyle}
            resizeMode="contain"
            //"../assets/cards_symbol.png"
            source={props.path}
          />
        </View>
      </TouchableOpacity>
      <Divider style={styles.dividerStyle} />
    </>
  );
}

const styles = StyleSheet.create({
  category: {
    width: responsiveWidth(100),
    height: responsiveHeight(13),
    flexDirection: "row",
    justifyContent: "space-between",
    //backgroundColor:"red",
  },
  imageStyle: {
    height: responsiveHeight(13),
    width: responsiveWidth(38),
    flex: 0,
    //backgroundColor: "green",
  },
  textStyle: {
    fontSize: responsiveFontSize(3),
    textAlignVertical: "center",
    paddingLeft: responsiveWidth(5),
  },
  dividerStyle: {
    width: "100%",
    marginBottom: responsiveHeight(2),
  },
});
