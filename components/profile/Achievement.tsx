import * as React from "react";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { StyleSheet, View, Image } from "react-native";
import { Text, List, Divider } from "react-native-paper";
import { useAuth } from "../../providers/AuthProvider";
import {
  useAchievementsByUser,
  useNotAchievementsByUser,
} from "../../utils/hooks";

export default function Achievement() {
  const { user } = useAuth();
  const { data: achievements, isLoading } = useAchievementsByUser(user.id);
  const { data: notAchievements, isLoading: isLoadingNotAchievements } =
    useNotAchievementsByUser(user.id);

  if (isLoading || isLoadingNotAchievements) {
    return <Text>Loading...</Text>;
  }

  return (
    <List.Section style={styles.achievementStyle}>
      {/* Display achievements achieved by the user */}
      {achievements &&
        achievements.map((achievement, index) => (
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

      {/* Display achievements not achieved by the user */}
      {notAchievements &&
        notAchievements.map((achievement, index) => (
          <React.Fragment key={achievement.id}>
            <List.Item
              style={styles.notAchieved}
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
            {index < notAchievements.length && <Divider />}
          </React.Fragment>
        ))}
    </List.Section>
  );
}

const styles = StyleSheet.create({
  notAchieved: {
    opacity: 0.5,
  },
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
    height: 1,
    backgroundColor: "grey",
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
