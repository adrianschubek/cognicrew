import React, { useState } from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import { Button, Text } from "react-native-paper";
import Achievement from "../components/profile/Achievement";
import { ScrollView } from "react-native";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { Snackbar } from "react-native-paper";


export default function Achievements({ navigation }) {
  const [snackbarVisible, setSnackbarVisible] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState("");

  const showSnackbar = (message) => {
    setSnackbarMessage(message);
    setSnackbarVisible(true);
  };

  return (
    <ScrollView /*style={styles.container}*/
      contentContainerStyle={styles.scrollContent}
    >
      <StatusBar style="auto" />
      {/* Render the Achievement component here */}
      <Snackbar
        visible={snackbarVisible}
        onDismiss={() => setSnackbarVisible(false)}
        duration={3000}
      >
        {snackbarMessage}
      </Snackbar>
      <Achievement />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  scrollContent: {
    width: responsiveWidth(100),
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "flex-start",
  },
});
