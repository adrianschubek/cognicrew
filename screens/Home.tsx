import * as React from "react";
import { View, StyleSheet, Image, ImageBackground, StatusBar, Text } from "react-native";
import { Card, useTheme } from "react-native-paper";
import JoinRoom from "../components/learningRoom/JoinRoom";
import { useUsername } from "../utils/hooks";
import { useEffect } from "react";
import { useAuth } from "../providers/AuthProvider";
import ProfilePictureAvatar from "../components/profile/ProfilePictureAvatar";
import LoadingOverlay from "../components/alerts/LoadingOverlay";

export default function HomeScreen({ navigation }) {
  const { data, isLoading } = useUsername();
  const { user } = useAuth();
  const theme = useTheme();

  useEffect(() => {
    navigation.setOptions({
      title: "CogniCrew",
      headerRight: () => (
        <Image
          source={require("../assets/icon.png")}
          style={styles.headerIcon}
        />
      ),
    });
  }, []);

  if (isLoading) {
    return (
      <>
        <StatusBar barStyle="light-content" />
        <LoadingOverlay visible={isLoading} />
      </>
    );
  }

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" />
      <ImageBackground 
        source={require("../assets/HomeScreen_3.0.png")} 
        style={styles.fullBackground}
      >
        <Text style={styles.headerText}>
          Hello, {isLoading ? "...." : data}
        </Text>
        <View style={styles.avatarOutline}>
          <ProfilePictureAvatar
            style={styles.avatar}
            username={isLoading ? "...." : data}
            userId={user.id}
            size={40}
          />
        </View>
      </ImageBackground>
      <Card
        style={styles.card}
        mode="contained"
        theme={{
          colors: { surfaceVariant: theme.colors.secondaryContainer },
        }}
      >
        <JoinRoom navigation={navigation} />
      </Card>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "flex-start",
    paddingHorizontal: 0,
  },
  headerText: {
    fontSize: 17,
    fontWeight: 'bold',
    position: 'absolute',
    top: 28,
    alignSelf: 'center', 
  },
  headerIcon: {
    height: 42,
    width: 41,
  },
  greetingIcon: {
    height: 42,
    width: 41,
  },
  avatar: {},
  avatarOutline: {
    borderWidth: 2,
    borderColor: 'white',
    borderRadius: 25,
    overflow: 'hidden',
    position: 'absolute',
    right: 8,
    top: 17,
  },
  fullBackground: {
    width: '100%',
    height: '89%',
    resizeMode: 'cover',
    justifyContent: 'flex-start',
    alignItems: 'flex-start',
  },
  card: {
    padding: 20,
    marginVertical: 0,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: '#E8E8E8',
    marginTop: -76, // see for yourself: -67 would allow for the ImageBackground to be completely visible, but I like -76 better since the card is then completely visible
                    // and takes up more space of the screen 
  },
});
