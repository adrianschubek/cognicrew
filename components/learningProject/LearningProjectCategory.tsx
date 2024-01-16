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
import { useState } from "react";

export default function LearningProjectCategory(props: {
  name: string;
  path: ImageSourcePropType;
  function?: any;
  flexDirection?: any;
  disableAfterPress?: boolean;
  [name: string]: any;
}) {
  const theme = useTheme();
  const [disabled, setDisabled] = useState(false);
  const { name, path, flexDirection, disableAfterPress } = props;
  return (
    <TouchableOpacity
      testID="project-category-buttons"
      style={props.style}
      disabled={disabled}
      onPress={() => {
        if (props.function) {
          disableAfterPress && setDisabled(true);
          props.function();
        }
      }}
    >
      <View
        style={{
          marginTop: 10,
          height: responsiveHeight(13),
          width: responsiveWidth(95),
          borderRadius: 10,
          backgroundColor: theme.colors.secondaryContainer,
          flexDirection: flexDirection || "row",
          justifyContent: "space-between",
          alignItems: "center",
        }}
      >
        <Text
          style={{
            fontSize: responsiveFontSize(3),
            paddingLeft:
              flexDirection !== "row-reverse" ? responsiveWidth(5) : 0,
            paddingRight:
              flexDirection === "row-reverse" ? responsiveWidth(5) : 0,
          }}
        >
          {" "}
          {name}{" "}
        </Text>
        <Image
          style={styles.imageStyle}
          resizeMode="contain"
          //"../assets/cards_symbol.png"
          source={path}
        />
      </View>
    </TouchableOpacity>
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
