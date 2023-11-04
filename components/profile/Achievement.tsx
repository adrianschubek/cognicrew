import * as React from "react";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { StyleSheet, View, Image } from "react-native";
import { Text, List, Divider } from "react-native-paper";
import { useAchievements } from "../../utils/hooks";

export default function Achievement() {
  const { data: achievements, isLoading } = useAchievements();

  if (isLoading) {
    return <Text>Loading...</Text>;
  }

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
                <Image
                  source={{
                    uri:
                      "https://iptk.w101.de/storage/v1/object/public/achievements/" +
                      achievement.icon_name,
                  }}
                  style={styles.image}
                />
              </View>
            )}
          />
          {index < achievements.length && <Divider />}
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
    flexDirection: "row",
    alignItems: "center",
  },
  title: {
    fontWeight: "bold",
  },
  divider: {
    height: 1, // You can adjust the height as needed
    backgroundColor: "grey", // Adjust the color if needed
  },
  image: {
    marginLeft: responsiveWidth(7),
    width: 70,
    height: 70,
    marginRight: 3,
    borderRadius: 35, // Half of the width and height to make it round
    overflow: "hidden",
  },
});
