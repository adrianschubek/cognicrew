import * as React from "react";
import { Dialog, Portal, TextInput, Text, Card } from "react-native-paper";
import { StyleSheet, View, ScrollView } from "react-native";
import { Button } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { useState } from "react";
import { useAuth } from "../../providers/AuthProvider";
import { supabase } from "../../supabase";

import AccordionSection from "../../components/learningRoom/AccordionCreateRoom";
import { NAVIGATION } from "../../types/common";

export default function CreateRoom({ navigation }) {
  return (
    <React.Fragment>
      <Text
        style={[styles.container, { textAlign: 'center' }]}
      >
        Create room:
      </Text>

      <AccordionSection />

      <Button
        icon="home"
        mode="contained"
        style={[styles.container, { marginTop: responsiveHeight(2.9) }]}
        onPress={() => {
          navigation.navigate(NAVIGATION.LEARNING_ROOM);
        }}
      >
        Create Room
      </Button>
    </React.Fragment>
  );
}
const styles = StyleSheet.create({
  container: {
    width: '100%',
    alignItems: 'center',
    marginVertical: 10,
  },
});
