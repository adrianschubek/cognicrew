import * as React from 'react';
import { AppRegistry } from 'react-native';
import { PaperProvider } from 'react-native-paper';
import { name as appName } from './app.json';
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import { Button } from 'react-native-paper';


export default function App() {
  return (
    <PaperProvider>
    <View style={styles.container}>
      <Text>Alex ist ein wunderschöner Mensch! *wink*</Text>
      <StatusBar style="auto" />
      <Button icon="camera" mode="contained" onPress={() => console.log('Pressed')}>
    Press me
  </Button>
    </View>
    </PaperProvider>
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
