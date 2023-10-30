import * as React from "react";
import { PaperProvider, TextInput } from "react-native-paper";
import { expo } from ".././app.json";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import { Button } from "react-native-paper";

export default function HomeScreen( {navigation}) {
    return (
      <View style={styles.container}>
        <Text>{expo.name}, die beste App fürs Lernen!</Text>
       {/*<StatusBar style="auto" /> not sure what this does*/}
       <Text>Join room via ID:</Text>
       <TextInput
       placeholder="#0420"
       />
       <Button
       style={styles.buttonStyle}
       mode="contained"
       >
        Ask to join
       </Button>
        <Button
          icon="account-multiple"
          mode="contained"
          onPress={() => {
            navigation.navigate("LearningProjects")
            console.log("Home Screen Pressed")
            }
          }
        >
          Learning Projects
        </Button>
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
    );
  }

  const styles = StyleSheet.create({
    container: {
      flex: 1,
      backgroundColor: "#fff",
      alignItems: "center",
      justifyContent: "center",
    },
    buttonStyle:{
      paddingBottom: 10,
      paddingTop: 10,
    },
  });
