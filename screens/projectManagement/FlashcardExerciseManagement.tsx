import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, ScrollView, Text } from "react-native";
import { FAB } from "react-native-paper";
import AccordionSection from "../../components/learningProject/AccordionSection";
import { useState } from "react";
import AddFlashcards from "../../components/dialogues/AddFlashcards";
import ManageSets from "../../components/dialogues/ManageSets";
import { ManagementType } from "../../types/common";
import { useSoundSystem1 } from "../../utils/hooks";
import { type } from "cypress/types/jquery";

export default function FlashcardExerciseManagement(props: { type: ManagementType }) {
  useSoundSystem1();
  const [showAddFlashcards, setShowAddFlashcards] = useState(false);
  const [showManageSets, setShowManageSets] = useState(false);
  const [FABOpen, setFABOpen] = useState({ open: false });
  const onStateChange = ({ open }) => setFABOpen({ open });
  const { open } = FABOpen;
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      {props.type === ManagementType.FLASHCARD && <Text> hallo</Text>}
      <AddFlashcards
        showAddingFlashcards={showAddFlashcards}
        close={() => setShowAddFlashcards(false)}
      />
      <ManageSets
        showManageSets={showManageSets}
        close={() => setShowManageSets(false)}
        type={ManagementType.FLASHCARD}
      />
      <ScrollView>
        <AccordionSection type={ManagementType.FLASHCARD} />
      </ScrollView>
      <FAB.Group
        open={open}
        visible
        icon={open ? "card-text" : "plus"}
        actions={[
          {
            icon: "plus",
            label: "Add new flashcards",
            onPress: () => setShowAddFlashcards(true),
          },
          {
            icon: "table-settings",
            label: "Manage flashcard sets",
            onPress: () => setShowManageSets(true),
          },
        ]}
        onStateChange={onStateChange}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: -8,
  },
});
