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
import  HomeScreen from "./screens/Home";
import  ManageFriends from "./screens/ManageFriends";

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
/*
//we need global styles 
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
}); */
