import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { ImageBackground, StyleSheet, View, Image } from "react-native";
import { Button, Text, Divider } from "react-native-paper";
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
        <Text style={styles.textStyle}> Flashcards </Text>
        <Image
          style={styles.imageStyle}
          resizeMode="contain"
          source={require("../assets/cards_symbol.png")}
        />
      </View>
      <Divider style={styles.dividerStyle} />
      <View style={styles.category}>
        <Text style={styles.textStyle}> Exercises </Text>
        <Image
          style={styles.imageStyle}
          resizeMode="contain"
          source={require("../assets/completed_task_symbol.png")}
        />
      </View>
      <Divider style={styles.dividerStyle} />
      <View style={styles.category}>
        <Text style={styles.textStyle}> Videos </Text>
        <Image
          style={styles.imageStyle}
          resizeMode="contain"
          source={require("../assets/camera_symbol.png")}
        />
      </View>
      <Divider style={styles.dividerStyle} />
      <View style={styles.category}>
        <Text style={styles.textStyle}> Files </Text>
        <Image
          style={styles.imageStyle}
          resizeMode="contain"
          source={require("../assets/files_symbol.png")}
        />
      </View>
      <Divider style={styles.dividerStyle} />
      <StatusBar style="auto" />
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
          navigation.goBack();
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
  dividerStyle: {
    width: "100%",
    marginBottom: responsiveHeight(2),
  },
  textStyle: {
    fontSize: responsiveFontSize(3),
    textAlignVertical: "center",
    paddingLeft: responsiveWidth(5),
  },
});
