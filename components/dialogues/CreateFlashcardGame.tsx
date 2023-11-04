import * as React from "react";
import { StyleSheet, View } from "react-native";
import {
  Dialog,
  Portal,
  Text,
  Button,
  Checkbox,
  Searchbar
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { useState } from "react";
import { accordionSectionItems } from "../learningProject/AccordionSection";
import { ScrollView } from "react-native";
import TimeSelection from "../common/TimeSelection";

export default function CreateFlashCardGame({showCreateFlashcardGame, close}) {
  const [searchQuery, setSearchQuery] = useState('');
  const [filteredAccordionSectionItems, setFilteredAccordionSectionItems] = useState(
    accordionSectionItems.map(item => ({ ...item, checked: false }))
  );
  const handleSearch = (query) => {
    setSearchQuery(query);
    const filteredItems = accordionSectionItems.map((item) => ({
      ...item,
      checked: false // Reset checkbox state when filtering
    })).filter((item) =>
      item.title.toLowerCase().includes(query.toLowerCase())
    );
    console.log("filteredAccordionSectionItems: ", filteredItems);
    setFilteredAccordionSectionItems(filteredItems);
  }
  const handleCheckboxPress = (id) => {
    const updatedItems = filteredAccordionSectionItems.map((item) => {
      if (item.id === id) {
        return { ...item, checked: !item.checked };
      }
      return item;
    });
    setFilteredAccordionSectionItems(updatedItems);
  };

  return (
      <Portal>
        <Dialog visible={showCreateFlashcardGame} onDismiss={close}>
          <Dialog.Title>Flashcard game</Dialog.Title>
          <Dialog.Content>
            <TimeSelection/>
            <View style={styles.searchContainer}>
              <Searchbar
                placeholder="Search"
                onChangeText={handleSearch}
                value={searchQuery}
              />
            </View>
            <ScrollView
              contentContainerStyle={styles.scrollContent}
              style={styles.scrollContainer}
            >
              {filteredAccordionSectionItems.map((learningSet) => (
                <View key={learningSet.id} style={styles.accordionItem}>
                  <Text style={styles.accordionTitle}>{learningSet.title}</Text>
                  <Checkbox
                    status={learningSet.checked ? "checked" : "unchecked"}
                    onPress={() => handleCheckboxPress(learningSet.id)}
                  />
                </View>
              ))}
            </ScrollView>
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={close}>Done</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
  );
}

const styles = StyleSheet.create({
  searchContainer: {
    borderBottomWidth: 1,
    borderColor: "gray",
  },
  accordionItem: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
    padding: 2,
  },
  accordionTitle: {
    fontSize: 16,
  },
  dialog: {
    maxHeight: responsiveHeight(70),
  },
  scrollContainer: {
    maxHeight: responsiveHeight(30),
    flex: 0,
  },
  scrollContent: {
    paddingVertical: 16,
  },
});