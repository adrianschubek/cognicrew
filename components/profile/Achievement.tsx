import * as React from "react";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { StyleSheet, View, Image } from "react-native"; 
import { Text, List, Divider } from "react-native-paper";
import { useAchievements } from "../../utils/hooks";

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
  const achievements = useAchievements()
  return (
    <List.Section style={styles.achievementStyle}>
      {achievements.map((achievement, index) => (
        <React.Fragment key={achievement.id}>
          <List.Item
            title={achievement.name}
            titleStyle={styles.title}
            description={achievement.description}
            left={() => (
              <View style={styles.achievementItem}>
                <Image source={{uri: 'https://iptk.w101.de/storage/v1/object/public/achievements/' + achievement.icon_name}} style={styles.image} />
              </View>
            )}
          />
          {index < achievementItems.length - 1 && <View style={styles.divider} />}
        </React.Fragment>
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
  divider: {
    height: 1, // You can adjust the height as needed
    backgroundColor: 'grey', // Adjust the color if needed
  },
  image: {
    marginLeft: responsiveWidth(7),
    width: 70,
    height: 70,
    marginRight: 3,
    borderRadius: 35, // Half of the width and height to make it round
    overflow: 'hidden',
  },
});
