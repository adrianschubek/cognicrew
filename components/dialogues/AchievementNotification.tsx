import React, { useEffect, useRef } from "react";
import { StyleSheet, View, Text, Image, Animated } from "react-native";
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
  const glowAnim = useRef(new Animated.Value(0)).current; // for the glow animation

  // Golden colors for light and dark themes
  const goldenColorLight = "#FFD700";
  const goldenColorDark = "#C5A00C";

  // Choose golden color based on theme
  const goldenColor = theme.dark ? goldenColorDark : goldenColorLight;

  const startGlowAnimation = () => {
    Animated.loop(
      Animated.sequence([
        Animated.timing(glowAnim, {
          toValue: 1,
          duration: 1000,
          useNativeDriver: true,
        }),
        Animated.timing(glowAnim, {
          toValue: 0,
          duration: 1000,
          useNativeDriver: true,
        }),
      ]),
    ).start();
  };

  useEffect(() => {
    if (isVisible) {
      animationRef.current?.bounceInUp().then(() => {
        animationRef.current?.tada();
        startGlowAnimation();
      });
    }
  }, [isVisible]);

  if (!isVisible) return null;

  const glowStyle = {
    //opacity: glowAnim, //This doesn't look good
    shadowColor: goldenColor,
    shadowRadius: 10,
    shadowOpacity: 0.9,
  };

  return (
    <Animatable.View
      ref={animationRef}
      style={[styles.notification, { backgroundColor: goldenColor }, glowStyle]}
      animation="bounceIn"
      duration={1500}
      useNativeDriver={true}
    >
      <ConfettiCannon count={50} origin={{ x: -10, y: 0 }} fadeOut={true} />
      <View style={styles.contentContainer}>
        {achievementIconName && (
          <Animatable.Image
            animation="pulse"
            easing="ease-out"
            iterationCount="infinite"
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
          <Animatable.View
            animation="bounce"
            iterationCount="infinite"
            style={styles.badge}
          >
            <Text style={styles.badgeText}>🏆</Text>
          </Animatable.View>
        </View>
      </View>
    </Animatable.View>
  );
};

const styles = StyleSheet.create({
  notification: {
    position: "absolute", //absolute doesn't work as it should
    padding: 10,
    borderRadius: 10,
    /*elevation: 5,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,*/ //all of this stuff doesn't do anything O.o
    alignSelf: "center",
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
    // backgroundColor: "white"
  },
  badgeText: {
    color: "black", // Adjust as needed
    fontSize: 12,
  },
});

export default AchievementNotification;
