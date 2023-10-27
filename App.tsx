import * as React from "react";
import { AppRegistry } from "react-native";
import { PaperProvider } from "react-native-paper";
import { expo } from "./app.json";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import { Button } from "react-native-paper";
import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { supabase } from "./supabase";

const Stack = createNativeStackNavigator();

export default function App() {
  supabase.auth.signInWithPassword({
    email: "foo@bar.de",
    password: "123456",
  }).catch((error) => {
    console.log(error);
  });

  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="Home" component={HomeScreen} />
        <Stack.Screen name="ManageFriends" component={ManageFriends} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

function HomeScreen( {navigation}) {
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
function ManageFriends({navigation}) {
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
