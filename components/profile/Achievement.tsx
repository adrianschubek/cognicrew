import React, { useState } from "react";
import { StyleSheet, View, Image, Text } from "react-native";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { useAuth } from "../../providers/AuthProvider";
import {
  useAchievementsByUser,
  useNotAchievementsByUser,
  useUnlockAchievement,
} from "../../utils/hooks";
import { Snackbar, Divider, List } from "react-native-paper";

export default function Achievement() {
  const { user } = useAuth();
  const { data: achievements, isLoading } = useAchievementsByUser(user.id);
  const { data: notAchievements, isLoading: isLoadingNotAchievements } =
    useNotAchievementsByUser(user.id);
  const [snackbarVisible, setSnackbarVisible] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState("");

  return (
    <View>
      {/* Snackbar for notifications */}
      {snackbarVisible && (
        <Snackbar
          visible={snackbarVisible}
          onDismiss={() => setSnackbarVisible(false)}
          duration={3000}
        >
          {snackbarMessage}
        </Snackbar>
      )}

      {/* Achievement list */}
      <List.Section style={styles.achievementStyle}>
        {/* Display achievements achieved by the user */}
        {achievements?.map((achievement, index) => (
          <View key={achievement.id} style={styles.achieved}>
            <List.Item
              title={achievement.name}
              description={achievement.description}
              left={() => (
                <Image
                  source={{
                    uri: `https://iptk.w101.de/storage/v1/object/public/achievements/${achievement.icon_name}`,
                  }}
                  style={styles.image}
                />
              )}
            />
            {index < achievements.length - 1 && <Divider />}
          </View>
        ))}

        {/* Display achievements not achieved by the user */}
        {notAchievements?.map((achievement, index) => (
          <View key={achievement.id} style={styles.notAchieved}>
            <List.Item
              title={achievement.name}
              description={achievement.description}
              left={() => (
                <Image
                  source={{
                    uri: `https://iptk.w101.de/storage/v1/object/public/achievements/${achievement.icon_name}`,
                  }}
                  style={styles.image}
                />
              )}
            />
            {index < notAchievements.length - 1 && <Divider />}
          </View>
        ))}
      </List.Section>
    </View>
  );
}

const styles = StyleSheet.create({
  notAchieved: {
    opacity: 0.5,
  },
  achieved: {
    opacity: 1.0,
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
    borderRadius: 35,
    overflow: "hidden",
  },
});
