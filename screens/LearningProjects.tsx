import * as React from "react";
import { PaperProvider } from "react-native-paper";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import { Button } from "react-native-paper";

export default function LearningProjects({navigation}) {
    return (
      <View style={styles.container}>
        <Text>Wer nichts im Kopf hat kann auch nichts lernen!</Text>
        <StatusBar style="auto" />
        <Button
          icon="home"
          mode="contained"
          onPress={() => {
            navigation.goBack();
            console.log("Learning Projects Screen Pressed")
            }
          }
        >
          Go back to the homescreen
        </Button>
      </View>
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