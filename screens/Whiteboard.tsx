import * as React from "react";
import { StyleSheet, View, Image } from "react-native";
import { Text, IconButton, useTheme, Divider } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import { useState } from "react";
import CreateDrawing from "../components/dialogues/CreateDrawing";
import { Canvas} from "../components/learningRoom/Canvas";
import { useWhiteboardStore } from "../stores/WhiteboardStore";

export default function Whiteboard({ navigation }) {
  const { resetPath, undoLastPath, redoLastPath } = useWhiteboardStore();
  const [showDrawing, setDrawing] = useState(false);
  const theme = useTheme();
  return (
    <React.Fragment>
      <CreateDrawing
        showDrawing={showDrawing}
        close={() => setDrawing(false)}
      />
      <View
        style={{
          flexDirection: "column",
          justifyContent: "space-between",
          flex: 1,
        }}
      >
        <View style={styles.top}>
          <View style={styles.topleft}>
            <IconButton
              icon="arrow-left-bold"
              iconColor={theme.colors.primary}
              size={40}
              onPress={undoLastPath}
              />
            <IconButton
              icon="arrow-right-bold"
              iconColor={theme.colors.primary}
              size={40}
              onPress={redoLastPath}
              />
          </View>
          <View style={styles.topright}>
            <Image
              source={{
                uri: "https://iptk.w101.de/storage/v1/object/public/profile-pictures/icon.png",
              }}
              style={styles.image}
            />
            <Text>User 1</Text>
            <Image
              source={{
                uri: "https://iptk.w101.de/storage/v1/object/public/profile-pictures/icon.png",
              }}
              style={styles.image}
            />
            <Text>User 2</Text>
          </View>
        </View>

        <Divider style={styles.divider}/>

        <View style={styles.mid}>
          <Canvas />
        </View>

        <Divider style={styles.divider}/>

        <View style={styles.bottomLeft}>
            <IconButton
            icon="delete"
            iconColor={theme.colors.primary}
            size={40}
            onPress = {resetPath}
            />
          <IconButton
            icon="pencil"
            iconColor={theme.colors.primary}
            size={40}
            onPress={() => {
              setDrawing(true);
              console.log("Pressed");
            }}
          />
          <IconButton
            icon="triangle-outline"
            iconColor={theme.colors.primary}
            size={40}
            onPress={() => {
              console.log("Pressed");
            }}
          />
           <IconButton
            icon="keyboard"
            iconColor={theme.colors.primary}
            size={40}
            onPress={() => {
              console.log("Pressed");
            }}
          />
        </View>
      </View>
    </React.Fragment>
  );
}

const styles = StyleSheet.create({
  top: {
    flexDirection: "row",
  },
  topleft: {
    flexDirection: "row",
    flex: 1,
  },
  topright: {
    flexDirection: "row",
  },
  mid: {
    flex: 1,
  },
  divider: {

  },
  image: {
    marginLeft: responsiveWidth(7),
    width: responsiveWidth(14),
    height: responsiveHeight(7),
    marginRight: 3,
    borderRadius: 35, 
    overflow: "hidden",
  },

  bottomLeft: {
    flexDirection: "row",
  },
});
