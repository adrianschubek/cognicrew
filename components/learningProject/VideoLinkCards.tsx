import * as React from "react";
import { StyleSheet, View, ScrollView } from "react-native";
import { Text, Card, Avatar } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
const videos = [
  { title: "Video über Bären", id: 1 },
  { title: "Video über Spinnen", id: 2 },
  { title: "Video über Giraffen", id: 3 },
  { title: "Video über Elefanten", id: 4 },
  { title: "Video über Löwen", id: 5 },
];
export default function VideoLinkCards() {
  return videos.map((link) => (
    <Card elevation={1} style={styles.cardStyle} key={link.id}>
      <Card.Title title={link.title} subtitle ="Dies ist ein Video" left={() => (
               <Avatar.Text
               style={styles.avatarStyle}
               size={responsiveFontSize(6)}
               label="A"
             />
             )}/>
      <Card.Content style={styles.cardContentStyle}>
        <Text> Dies ist ein Video! </Text>
      </Card.Content>
    </Card>
  ));
}

const styles = StyleSheet.create({
  cardStyle: {
    flex: 1,
    width: responsiveWidth(90),
    marginBottom: responsiveHeight(2),
  },
  cardContentStyle: {
    flex: 1,
  },
  avatarStyle:{

  }
});
