import { Avatar, Text } from "react-native-paper";
import { responsiveFontSize } from "react-native-responsive-dimensions";
import { getRandomColor } from "../../utils/common";
import { View } from "react-native";

/*
may fall back to use this when only simple version is needed. Depends on how the other version develops
@see LearningProjectAvatarWithTitle.tsx 
*/
export default function SimpleLearningProjectAvatarWithTitle(props: {
  projectName: string;
}) {
  const { projectName } = props;
  return (
    <View style={{ flexDirection: "column" }}>
      <Avatar.Text
        style={{ alignSelf: "center" }}
        size={responsiveFontSize(10)}
        label={projectName.substring(0, 2)}
        theme={{
          colors: { primary: getRandomColor(projectName) },
        }}
      />
      <Text style={{ textAlign: "center", marginTop: 5 }}>
        {projectName.length > 32
          ? projectName.substring(0, 32) + "..."
          : projectName.substring(0, 32)}
      </Text>
    </View>
  );
}
