import * as React from "react";
import {
  StyleSheet,
  View,
  Image,
  TouchableOpacity,
  ImageSourcePropType,
} from "react-native";
import { Text, useTheme } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { Fragment } from "react";

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
    <Fragment>
      <TouchableOpacity
        testID="project-category-buttons"
        style={props.style}
        onPress={props.function || doNothing()}
      >
        <View
          style={{
            marginTop: 10,
            height: responsiveHeight(13),
            width: responsiveWidth(95),
            borderRadius: 10,
            backgroundColor: theme.colors.secondaryContainer,
            flexDirection: props.flexDirection || "row",
            justifyContent: "space-between",
          }}
        >
          <Text
            style={{
              fontSize: responsiveFontSize(3),
              textAlignVertical: "center",
              paddingLeft:
                props.flexDirection !== "row-reverse" ? responsiveWidth(5) : 0,
              paddingRight:
                props.flexDirection === "row-reverse" ? responsiveWidth(5) : 0,
            }}
          >
            {" "}
            {props.name}{" "}
          </Text>
          <Image
            style={styles.imageStyle}
            resizeMode="contain"
            //"../assets/cards_symbol.png"
            source={props.path}
          />
        </View>
      </TouchableOpacity>
    </Fragment>
  );
}

const styles = StyleSheet.create({
  imageStyle: {
    height: responsiveHeight(13),
    width: responsiveWidth(38),
    flex: 0,
    //backgroundColor: "green",
  },
});
