import * as React from "react";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { StyleSheet, View, Image } from "react-native"; // Import Image component
import { Text, List } from "react-native-paper";

const achievementItems = [
  { id: 1, title: 'Achievement 1', description: 'This is a short description.', imageSource: require('../../assets/des_bedarfs.png') },
  { id: 2, title: 'Achievement 2', description: 'This is a short description.', imageSource: require('../../assets/des_bedarfs.png') },
  { id: 3, title: 'Achievement 3', description: 'This is a short description.', imageSource: require('../../assets/des_bedarfs.png') },
  { id: 4, title: 'Achievement 4', description: 'This is a long description due to testing purposes.', imageSource: require('../../assets/des_bedarfs.png') },
  { id: 5, title: 'Achievement 5', description: 'This is a short description.', imageSource: require('../../assets/des_bedarfs.png') },
  { id: 6, title: 'Achievement 6', description: 'This is a short description.', imageSource: require('../../assets/des_bedarfs.png') },
  { id: 7, title: 'Achievement 7', description: 'This is a short description.', imageSource: require('../../assets/des_bedarfs.png') },
  { id: 8, title: 'Achievement 8', description: 'This is a short description.', imageSource: require('../../assets/des_bedarfs.png') },
  { id: 9, title: 'Achievement 9', description: 'This is a short description.', imageSource: require('../../assets/des_bedarfs.png') },
  { id: 10, title: 'Achievement 10', description: 'This is a short description.', imageSource: require('../../assets/des_bedarfs.png') },
];

export default function Achievement() {
  return (
    <List.Section style={styles.achievementStyle}>
      {achievementItems.map((achievement) => (
        <List.Item
          key={achievement.id}
          title={achievement.title} titleStyle={styles.title}
          description={achievement.description}
          left={() => (
            <View style={styles.achievementItem}>
              <Image source={achievement.imageSource} style={styles.image} />
            </View>
          )}
        />
      ))}
    </List.Section>
  );
}

const styles = StyleSheet.create({
  achievementStyle: {
    width: responsiveWidth(100),
  },
  achievementItem: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  title: {
    fontWeight: 'bold',
  },
  image: {
    width: 61,
    height: 65,
    marginRight: 3,
  },
});
