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
import AddExercises from "../../components/dialogues/AddExercises";

export default function FlashcardExerciseManagement({
  route,
}: {
  route: { params: { type: ManagementType } };
}) {
  useSoundSystem1();
  const type = route.params.type;
  const [showAddItem, setShowAddItem] = useState(false);
  const [showManageSets, setShowManageSets] = useState(false);
  const [FABOpen, setFABOpen] = useState({ open: false });
  const onStateChange = ({ open }) => setFABOpen({ open });
  const { open } = FABOpen;
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      {type === ManagementType.FLASHCARD ? (
        <AddFlashcards
          showAddingFlashcards={showAddItem}
          close={() => setShowAddItem(false)}
        />
      ) : (
        <AddExercises
          showAddExercises={showAddItem}
          close={() => setShowAddItem(false)}
        />
      )}
      <ManageSets
        showManageSets={showManageSets}
        close={() => setShowManageSets(false)}
        type={type}
      />
      <ScrollView>
        <AccordionSection type={type} />
      </ScrollView>
      <FAB.Group
        open={open}
        visible
        icon={open ? "card-text" : "plus"}
        actions={[
          {
            icon: "plus",
            label:
              "Add new" + (type === ManagementType.FLASHCARD ? " flashcards" : " exercises"),
            onPress: () => setShowAddItem(true),
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
