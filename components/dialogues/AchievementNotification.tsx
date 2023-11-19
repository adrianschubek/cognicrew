import React, { useRef } from 'react';
import { StyleSheet, View, Text, Image } from 'react-native';
import * as Animatable from 'react-native-animatable';
import { useTheme } from 'react-native-paper';

const AchievementNotification = ({ isVisible, achievementName, achievementIconName }) => {
  const theme = useTheme();
  const animationRef = useRef(null);

  React.useEffect(() => {
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
      style={[styles.notification, { backgroundColor: theme.colors.surface }]}
      animation="bounceIn"
      duration={1500}
      useNativeDriver={true}
    >
      <View style={styles.contentContainer}>
        {achievementIconName && (
          <Image
           source={{ uri: `https://iptk.w101.de/storage/v1/object/public/achievements/${achievementIconName}` }}

            style={styles.icon}
          />
        )}
        <Text style={styles.notificationText}>
          Achievement Unlocked: {achievementName}
        </Text>
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
    justifyContent: 'center',
    alignItems: 'center',
    flexDirection: 'row',
  },
  contentContainer: {
    flexDirection: 'row', 
    alignItems: 'center',
  },
  icon: {
    width: 30, 
    height: 30, 
    marginRight: 10,
  },
  notificationText: {
    fontWeight: "bold",
    textAlign: "center",
  },

});

export default AchievementNotification;
