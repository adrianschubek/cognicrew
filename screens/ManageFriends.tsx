import * as React from "react";
import { PaperProvider } from "react-native-paper";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import { Button } from "react-native-paper";

export default function ManageFriends({navigation}) {
    return (
      <PaperProvider>
      <View style={styles.container}>
        <Text>Leider hast du keine Freunde. Denk mal darüber nach!</Text>
        <StatusBar style="auto" />
        <Button
          icon="home"
          mode="contained"
          onPress={() => {
            navigation.goBack();
            console.log("ManageFriends Screen Pressed")
            }
          }
        >
          Go back to the homescreen
        </Button>
      </View>
    </PaperProvider>
    );
  }
  
const styles = StyleSheet.create({
    container: {
      flex: 1,
      backgroundColor: "#fff",
      alignItems: "center",
      justifyContent: "center",
    },
  });