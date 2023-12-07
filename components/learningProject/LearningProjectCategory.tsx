import * as React from "react";
import { StatusBar } from "expo-status-bar";
import {
  ImageBackground,
  StyleSheet,
  View,
  Image,
  TouchableOpacity,
  ImageSourcePropType,
} from "react-native";
import { Button, Text, Divider, useTheme } from "react-native-paper";
import ImageResizeMode from "react-native/Libraries/Image/ImageResizeMode";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";

function doNothing() {
  return;
}
export default function LearningProjectCategory(props: {
  name: string;
  path: ImageSourcePropType;
  function?: any;
  flexDirection?: any;
  [name: string]: any;
}) {
  const theme = useTheme();
  return (
    <React.Fragment>
      <TouchableOpacity
        style={props.style}
        onPress={props.function || doNothing()}
      >
        <View
          style={[
            styles.category,
            {
              marginTop: 10,
              width: responsiveWidth(95),
              borderRadius: 10,
              backgroundColor: theme.colors.secondaryContainer,
              flexDirection: props.flexDirection || "row",
            },
          ]}
        >
          <Text style={styles.textStyle}> {props.name} </Text>
          <Image
            style={styles.imageStyle}
            resizeMode="contain"
            //"../assets/cards_symbol.png"
            source={props.path}
          />
        </View>
      </TouchableOpacity>
      {/* <Divider style={styles.dividerStyle} /> */}
    </React.Fragment>
  );
}

const styles = StyleSheet.create({
  category: {
    // width: responsiveWidth(80),
    height: responsiveHeight(13),
    flexDirection: "row",
    justifyContent: "space-between",
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
