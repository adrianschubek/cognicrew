import { Avatar, Text } from "react-native-paper";
import { responsiveFontSize } from "react-native-responsive-dimensions";
import { getRandomColor } from "../../utils/common";
import {
  DimensionValue,
  StyleProp,
  TextStyle,
  View,
  ViewStyle,
} from "react-native";
import { VariantProp } from "react-native-paper/lib/typescript/components/Typography/types";
import { useState } from "react";

export default function LearningProjectAvatarWithTitle(props: {
  projectName: string;
  style?: StyleProp<ViewStyle>;
  avatarStyle?: StyleProp<ViewStyle>;
  avatarSize?: number;
  textStyle?: StyleProp<TextStyle>;
  textAlign?: "left" | "center" | "right";
  textMaxWidth?: DimensionValue;
  textVariant?: VariantProp<string>;
  extraInfoTexts?: string[];
  numberOfLines?: number;
  titleMarginHorizontal?: number;
}) {
  const {
    projectName,
    style,
    avatarSize,
    avatarStyle,
    textStyle,
    textAlign,
    textVariant,
    extraInfoTexts,
  } = props;
  const textMaxWidth = props.textMaxWidth ?? "100%";
  const numberOfLines = props.numberOfLines ?? null;
  const titleMarginHorizontal = props.titleMarginHorizontal ?? 0;
  const [titleWidth, setTitleWidth] = useState<DimensionValue>(0);
  const [width, setWidth] = useState<DimensionValue>(0);
  return (
    <View style={[{ flexDirection: "column" }, style]}>
      <Avatar.Text
        style={[{ alignSelf: "center" }, avatarStyle]}
        size={avatarSize ?? responsiveFontSize(10)}
        label={projectName.trim().substring(0, 2)}
        theme={{
          colors: { primary: getRandomColor(projectName) },
        }}
      />
      <View
        style={[
          {
            flexDirection: "column",
            marginTop: 5,
            width: textMaxWidth,
          },
          textStyle,
        ]}
      >
        <Text
          onLayout={(event) => {
            const { width } = event.nativeEvent.layout;
            setTitleWidth(width);
          }}
          numberOfLines={numberOfLines}
          variant={textVariant}
          style={[
            {
              textAlign: textAlign ?? "center",
              marginHorizontal: titleMarginHorizontal,
            },
          ]}
        >
          {projectName} {titleWidth >= textMaxWidth && "..."}
        </Text>
        {extraInfoTexts &&
          extraInfoTexts.map((infoText, index) => {
            return (
              <Text
                key={index}
                variant="bodySmall"
                numberOfLines={1}
                onLayout={(event) => {
                  const { width } = event.nativeEvent.layout;
                  setWidth(width);
                }}
                style={{
                  textAlign: textAlign ?? "center",
                  //fontStyle: "italic",
                }}
              >
                {infoText} {width >= textMaxWidth && "..."}
              </Text>
            );
          })}
      </View>
    </View>
  );
}
