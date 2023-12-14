import React, { useEffect, useRef } from "react";
import { StyleSheet, View, Text, Image } from "react-native";
import * as Animatable from "react-native-animatable";
import { useTheme } from "react-native-paper";
import ConfettiCannon from "react-native-confetti-cannon";
import { supabase } from "../../supabase";

const AchievementNotification = ({
  isVisible,
  achievementName,
  achievementIconName,
}) => {
  const theme = useTheme();
  const animationRef = useRef(null);

  // Golden colors for light and dark themes
  const goldenColorLight = "#FFD700"; // Lighter shade of gold for light mode
  const goldenColorDark = "#C5A00C"; // Darker shade of gold for dark mode

  // Choose golden color based on theme
  const goldenColor = theme.dark ? goldenColorDark : goldenColorLight;

  useEffect(() => {
    if (isVisible) {
      animationRef.current?.bounceInUp().then(() => {
        animationRef.current?.tada();
      });
    }
  }, [isVisible]);

  if (!isVisible) return null;

  return (
    <Animatable.View
      ref={animationRef}
      style={[styles.notification, { backgroundColor: goldenColor }]}
      animation="bounceIn"
      duration={1500}
      useNativeDriver={true}
    >
      <ConfettiCannon count={40} origin={{ x: -10, y: 0 }} />
      <View style={styles.contentContainer}>
        {achievementIconName && (
          <Image
            source={{
              uri: supabase.storage
                .from("achievements")
                .getPublicUrl(achievementIconName).data.publicUrl,
            }}
            style={styles.icon}
          />
        )}
        <View style={styles.badgeContainer}>
          <Text style={styles.notificationText}>
            Achievement: {achievementName}
          </Text>
          <View style={styles.badge}>
            <Text style={styles.badgeText}>🏆</Text>
          </View>
        </View>
      </View>
    </Animatable.View>
  );
};

const styles = StyleSheet.create({
  notification: {
    position: "absolute",
    right: -10,
    padding: 10,
    borderRadius: 10,
    elevation: 5,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
    justifyContent: "center",
    alignItems: "center",
    flexDirection: "row",
  },
  contentContainer: {
    flexDirection: "row",
    alignItems: "center",
  },
  icon: {
    width: 30,
    height: 30,
    marginRight: 10,
  },
  notificationText: {
    fontWeight: "bold",
    textAlign: "center",
    color: "black",
  },
  badgeContainer: {
    flexDirection: "row",
    alignItems: "center",
  },
  badge: {
    padding: 4,
    borderRadius: 6,
    marginLeft: 5,
  },
  badgeText: {
    color: "white",
    fontSize: 12,
  },
});

export default AchievementNotification;
