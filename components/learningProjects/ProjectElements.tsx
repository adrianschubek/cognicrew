import { useNavigation } from "@react-navigation/native";
import * as React from "react";
import {
  StyleSheet,
  TouchableHighlight,
  TouchableOpacity,
  View,
} from "react-native";
import { Avatar, Button, Text } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { NAVIGATION } from "../../types/common";
import { getRandomColor } from "../../utils/common";

const dummyProjects = [
  { name: "Psycholgy", id: 1 },
  { name: "Biology", id: 2 },
  { name: "Sex Education", id: 3 },
  { name: "Kynology", id: 4 },
  { name: "Spanish", id: 5 },
];

export default function ProjectElements() {
  const navigation = useNavigation();
  return dummyProjects.map((project) => (
    <View style={styles.projectElement} key={project.id}>
      <TouchableOpacity
        onPress={() => {
          // @ts-ignore
          navigation.navigate(NAVIGATION.LEARNING_PROJECT);
        }}
        onLongPress={() => {
          // @ts-ignore
          navigation.navigate(NAVIGATION.CREATEEDIT_PROJECT, {
            edit: project.id,
          });
        }}
      >
        <>
          <Avatar.Text
            style={styles.avatar}
            size={responsiveFontSize(10)}
            label={project.name.substring(0, 2)}
            theme={{ colors: { primary: getRandomColor() } }}
          />
          <Text style={styles.textStyle}>
            {project.name.length > 13
              ? project.name.substring(0, 13) + "..."
              : project.name.substring(0, 13)}
          </Text>
        </>
      </TouchableOpacity>
    </View>
  ));
}

const styles = StyleSheet.create({
  projectElement: {
    width: responsiveWidth(29),
    paddingBottom: responsiveFontSize(1),
  },
  textStyle: {
    fontWeight: "bold",
    textAlign: "center",
  },
  avatar: {
    alignSelf: "center",
  },
});
