import * as React from 'react';
import { AppRegistry } from 'react-native';
import { PaperProvider } from 'react-native-paper';
import { expo } from './app.json';
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import { Button } from 'react-native-paper';
import { NavigationContainer } from "@react-navigation/native";


export default function App() {
  return ( <NavigationContainer>
    <PaperProvider>
      <View style={styles.container}>
        <Text>{expo.name}, die beste App fürs Lernen!</Text>
        <StatusBar style="auto" />
        <Button icon="camera" mode="contained" onPress={() => console.log('Pressed')}>
          Press me
        </Button>
      </View>
    </PaperProvider></NavigationContainer>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
