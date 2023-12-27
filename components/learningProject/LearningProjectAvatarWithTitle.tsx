import { Avatar, Text } from "react-native-paper";
import { responsiveFontSize } from "react-native-responsive-dimensions";
import { getRandomColor } from "../../utils/common";
import { StyleProp, TextStyle, View, ViewStyle } from "react-native";
import { VariantProp } from "react-native-paper/lib/typescript/components/Typography/types";

export default function LearningProjectAvatarWithTitle(props: {
  projectName: string;
  style?: StyleProp<ViewStyle>;
  avatarStyle?: StyleProp<ViewStyle>;
  avatarSize?: number;
  textStyle?: StyleProp<TextStyle>;
  textAlign?: "left" | "center" | "right";
  textVariant?: VariantProp<string>;
  extraInfoTexts?: string[];
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
  return (
    <View style={[{ flexDirection: "column" }, style]}>
      <Avatar.Text
        style={[{ alignSelf: "center" }, avatarStyle]}
        size={avatarSize ?? responsiveFontSize(10)}
        label={projectName.substring(0, 2)}
        theme={{
          colors: { primary: getRandomColor(projectName) },
        }}
      />
      <View style={[{ flexDirection: "column", marginTop: 5 }, textStyle]}>
        <Text
          variant={textVariant}
          style={[{ textAlign: textAlign ?? "center" }]}
        >
          {projectName.length > 32
            ? projectName.substring(0, 32) + "..."
            : projectName.substring(0, 32)}
        </Text>
        {extraInfoTexts &&
          extraInfoTexts.map((text, index) => {
            return (
              <Text
                key={index}
                variant="bodySmall"
                style={{
                  textAlign: textAlign ?? "center",
                  fontStyle: "italic",
                }}
              >
                {text}
              </Text>
            );
          })}
      </View>
    </View>
  );
}
