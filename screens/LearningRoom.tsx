import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import { Ionicons } from "@expo/vector-icons"; // Import an icon library
import {
  Dialog,
  Portal,
  TextInput,
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
import LearningProjectCategory from "../components/learningProject/LearningProjectCategory";
import { useState } from "react";
import AccordionSection, { accordionSectionItems } from "../components/learningProject/AccordionSection";
import { ScrollView } from "react-native";

export default function LearningRoom({ navigation }) {
  const [showCreateFlashcardGame, setShowCreateFlashcardGame] = useState(false);
  const [showCreateQuizGame, setShowCreateQuizGame] = useState(false);
  const [time, setTime] = useState("00:00");

  const handleTimeChange = (text) => {
    // Ensure that the input is in the format "00:00"
    const formattedTime = text.replace(/[^0-9:]/g, ""); // Remove non-numeric and non-colon characters
    const [minutes, seconds] = formattedTime.split(":");
    const formattedMinutes = minutes ? String(Math.min(parseInt(minutes), 59)).padStart(2, "0") : "00";
    const formattedSeconds = seconds ? String(Math.min(parseInt(seconds), 59)).padStart(2, "0") : "00";
    const formattedTimeStr = `${formattedMinutes}:${formattedSeconds}`;
    setTime(formattedTimeStr);
  };

  const [searchQuery, setSearchQuery] = React.useState('');
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
  }

  return (
    <>
      <Portal>
      <Dialog visible={showCreateFlashcardGame} onDismiss={() => setShowCreateFlashcardGame(false)}>
          <Dialog.Title>Flashcard game</Dialog.Title>
          <Dialog.Content>
            <TextInput
              label="Round duration (mm:ss)" style={styles.timer}
              value={time}
              onChangeText={handleTimeChange}
            />
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
            <Button onPress={() => setShowCreateFlashcardGame(false)}>Done</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
      <Portal>
        <Dialog visible={showCreateQuizGame} onDismiss={() => setShowCreateQuizGame(false)}>
          {/* ... Existing code ... */}
        </Dialog>
      </Portal>
      <View style={styles.container}>
        <StatusBar style="auto" />
        <LearningProjectCategory
          path={require("../assets/completed_task_symbol.png")}
          name={"Quiz game"}
          function={() => {
            setShowCreateQuizGame(true);
            console.log("Quiz Game Pressed");
          }}
        />
        <LearningProjectCategory
          path={require("../assets/cards_symbol.png")}
          name={"Flashcard game"}
          flexDirection="row-reverse"
          mode="contained"
          function={() => {
            setShowCreateFlashcardGame(true);
            console.log("Flashcard Game Pressed");
          }}
        />
        <LearningProjectCategory
          path={require("../assets/teamwork_symbol.png")}
          name={"Whiteboard"}
        />
        <Button
          icon="home"
          mode="contained"
          style={{ marginTop: responsiveHeight(5) }}
          contentStyle={{
            height: responsiveHeight(10),
          }}
          labelStyle={{
            lineHeight: responsiveFontSize(3.25),
            fontSize: responsiveFontSize(3),
            textAlignVertical: "center",
            padding: 0,
            height: responsiveFontSize(3),
          }}
          onPress={() => {
            navigation.goBack();
          }}
        >
          Alex ist ein fellow KING
        </Button>
      </View>
    </>
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
  timer: {
    backgroundColor: null,
  },
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
    maxHeight: responsiveHeight(70), // Set a maximum height for the dialog
  },
  dialogContent: {
    maxHeight: responsiveHeight(50), // Set a maximum height for the content
  },
  scrollContainer: {
    maxHeight: responsiveHeight(40),
    flex: 0,
  },
  scrollContent: {
    paddingVertical: 16, // Add padding to the content
  },
});
