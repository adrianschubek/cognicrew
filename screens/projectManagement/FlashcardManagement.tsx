import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, ScrollView } from "react-native";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import TextWithPlusButton from "../../components/common/TextWithPlusButton";
import AccordionSection from "../../components/learningProject/AccordionSection";
import { useState } from "react";
import AddFlashcards from "../../components/dialogues/AddFlashcards";
import ManageSets from "../../components/dialogues/ManageSets";
import { ManagementType } from "../../types/common";
import { useSoundSystem1 } from "../../utils/hooks";

export default function FlashcardManagement() {

  useSoundSystem1();

  const [showAddFlashcards, setShowAddFlashcards] = useState(false);
  const [showManageSets, setShowManageSets] = useState(false);
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <AddFlashcards
        showAddingFlashcards={showAddFlashcards}
        close={() => setShowAddFlashcards(false)}
      />
      <ManageSets
        showManageSets={showManageSets}
        close={() => setShowManageSets(false)}
        type={ManagementType.FLASHCARD}
      />
      <View style={styles.upperContainer}>
        <TextWithPlusButton
          text="add new flash cards"
          function={() => {
            setShowAddFlashcards(true);
          }}
        />
        <TextWithPlusButton
          text={"Manage flashcard sets"}
          function={() => {
            setShowManageSets(true);
          }}
        />
      </View>
      <ScrollView>
        <AccordionSection type={ManagementType.FLASHCARD} />
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
    flexDirection: "column",
    alignItems: "flex-end",
  },
});
