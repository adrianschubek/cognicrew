import * as React from "react";
import { PaperProvider } from "react-native-paper";
import { expo } from ".././app.json";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import { Button } from "react-native-paper";

export default function HomeScreen( {navigation}) {
    return (
      <PaperProvider>
      <View style={styles.container}>
        <Text>{expo.name}, die beste App fürs Lernen!</Text>
        <StatusBar style="auto" />
        <Button
          icon="account-multiple"
          mode="contained"
          onPress={() => {
            navigation.navigate("ManageFriends")
            console.log("Home Screen Pressed")
            }
          }
        >
          Manage your friends!
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