import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, ScrollView } from "react-native";
import { Text, Card } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import TextWithPlusButton from "../../components/common/TextWithPlusButton";
import VideoLinkCards from "../../components/learningProject/VideoLinkCards";
import AddLinks from "../../components/dialogues/AddLinks";
import { useState } from "react";

export default function LinkManagement() {
  const [showAddLink, setShowAddLink] = useState(false);
  return (
    <View style={styles.container}>
      <AddLinks
        showAddingLinks={showAddLink}
        close={() => setShowAddLink(false)}
      />
      <StatusBar style="auto" />
      <View style={styles.upperContainer}>
        <TextWithPlusButton text="add new link" function={() => 
        {
          setShowAddLink(true);
        }} />
      </View>
      <ScrollView>
      <VideoLinkCards/>
      </ScrollView>
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
  upperContainer: {
    flex: 0,
    width: responsiveWidth(100),
    //backgroundColor:"red",
    flexDirection: "row",
    justifyContent: "flex-end",
  },
});
