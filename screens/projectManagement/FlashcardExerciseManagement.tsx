import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, ScrollView, Text } from "react-native";
import { FAB } from "react-native-paper";
import AccordionSection from "../../components/learningProject/AccordionSection";
import { useState } from "react";
import AddFlashcards from "../../components/dialogues/AddFlashcards";
import ManageSets from "../../components/dialogues/ManageSets";
import { ManagementType } from "../../types/common";
import { useAlerts, useSoundSystem1 } from "../../utils/hooks";
import AddExercises from "../../components/dialogues/AddExercises";
import { orderBy, set } from "cypress/types/lodash";

export default function FlashcardExerciseManagement({
  route,
}: {
  route: { params: { type: ManagementType } };
}) {
  useSoundSystem1();
  const { confirm } = useAlerts();
  const type = route.params.type;
  const [orderSetsBy, setOrderSetsBy] = useState("created_at");
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
        <AccordionSection type={type} orderSetsBy={orderSetsBy} />
      </ScrollView>
      <FAB.Group
        open={open}
        visible
        icon={open ? "card-text" : "plus"}
        actions={[
          {
            icon: "sort",
            label: "Sort by",
            onPress: () => {
              confirm({
                icon: "account-multiple-plus",
                title: "Sort your sets by?",
                okText: "Accept",
                okAction: (val) => {
                  setOrderSetsBy(val[0]);
                },
                fields: [
                  {
                    type: "radio",
                    icon: "sort",
                    helperText: "Choose a sorting option to your liking",
                    required: true,
                    data: [
                      { key: "creation date", value: "created_at" },
                      {
                        key: "inverse creation date",
                        value: "reverse_created_at",
                      },
                      { key: "alphabetical order", value: "name" },
                      { key: "inverse alphab. order", value: "reverse_name" },
                    ],
                  },
                ],
              });
            },
          },
          {
            icon: "plus",
            label:
              "Add new" +
              (type === ManagementType.FLASHCARD
                ? " flashcards"
                : " exercises"),
            onPress: () => setShowAddItem(true),
          },
          {
            icon: "table-settings",
            label:
              "Manage" +
              (type === ManagementType.FLASHCARD
                ? " flashcard"
                : " exercise") +
              " sets",
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
