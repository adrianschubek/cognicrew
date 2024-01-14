import React, { useEffect, useRef } from "react";
import { StyleSheet, View, Text, Animated } from "react-native";
import * as Animatable from "react-native-animatable";
import { useTheme } from "react-native-paper";
import ConfettiCannon from "react-native-confetti-cannon";
import { supabase } from "../../supabase";

const AchievementNotification = ({ achievementName, achievementIconName }) => {
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
          useNativeDriver: false,
        }),
        Animated.timing(glowAnim, {
          toValue: 0,
          duration: 1000,
          useNativeDriver: false,
        }),
      ]),
    ).start();
  };

  useEffect(() => {
    startGlowAnimation();
    animationRef.current?.bounceInUp().then(() => {
      animationRef.current?.tada();
    });
  }, []);

  const glowStyle = {
    /*shadowColor: goldenColor,
    shadowOpacity: glowAnim,
    shadowRadius: 10,
    shadowOffset: { width: 0, height: 0 },*/ //ditch shadow completely? Shadow only works on iOS
    elevation: glowAnim.interpolate({
      inputRange: [0, 1],
      outputRange: [10, 40], // you can adjust the output range for a more pronounced effect
    }),
  };
  const AnimatedAnimatableView = Animated.createAnimatedComponent(
    Animatable.View,
  );
  return (
    <AnimatedAnimatableView
      ref={animationRef}
      style={[styles.notification, { backgroundColor: goldenColor }, glowStyle]}
      animation="bounceIn"
      duration={1500}
      useNativeDriver={false}
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
    </AnimatedAnimatableView>
  );
};

const styles = StyleSheet.create({
  notification: {
    position: "absolute",
    top: 150,
    padding: 10,
    borderRadius: 10,
    //all of this  bellow doesn't do anything O.o (now i know why. Because shadow is iOS only)
    /*elevation: 5,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,*/
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
