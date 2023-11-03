import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, ScrollView } from "react-native";
import { Button, Dialog, Portal, Text, TextInput } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import TextWithPlusButton from "../../components/common/TextWithPlusButton";
import AccordionSection from "../../components/learningProject/AccordionSection";
import { useState } from "react";
import AddingFlashcards from "../../components/dialogues/AddingFlashcards";

export default function FlashcardManagement() {
  const [showAddingFlashcards, setShowAddingFlashcards] = useState(false);
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <AddingFlashcards
        showAddingFlashcards={showAddingFlashcards}
        close={() => setShowAddingFlashcards(false)}
      />
      <View style={styles.upperContainer}>
        <TextWithPlusButton
          text="add new flash cards"
          function={() => {
            setShowAddingFlashcards(true);
          }}
        />
      </View>
      <ScrollView>
        <AccordionSection type="flashcard" />
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    width: responsiveWidth(100),
    height: responsiveHeight(100),
    flex: 1,
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "flex-start",
  },
  upperContainer: {
    flex: 0,
    width: responsiveWidth(100),
    //backgroundColor:"red",
    flexDirection: "row",
    justifyContent: "flex-end",
  },
});
