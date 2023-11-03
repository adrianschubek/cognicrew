import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
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
import { accordionSectionItems } from "../components/learningProject/AccordionSection";
import { ScrollView } from "react-native";

export default function LearningRoom({ navigation }) {
  const [showCreateFlashcardGame, setShowCreateFlashcardGame] = useState(false);
  const [showCreateQuizGame, setShowCreateQuizGame] = useState(false);
  const minutesRef = React.useRef(null);
  const secondsRef = React.useRef(null);

  // Use separate states for minutes and seconds
  const [minutes, setMinutes] = useState("");
  const [seconds, setSeconds] = useState("");

  const handleTimeChange = (field, text) => {
    // Ensure that the input is in the format "00:00"
    const formattedText = text.replace(/[^0-9]/g, ""); // Remove non-numeric characters

    if (field === "minutes") {
      setMinutes(formattedText.slice(0, 2));
    } else if (field === "seconds") {
      setSeconds(formattedText.slice(0, 2));
    }
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
  };

  return (
    <>
      <Portal>
        <Dialog visible={showCreateFlashcardGame} onDismiss={() => setShowCreateFlashcardGame(false)}>
          <Dialog.Title>Flashcard game</Dialog.Title>
          <Dialog.Content>
          <Text style={styles.roundDurationStyle}> Round duration</Text>
            <View style={styles.timerContainer}>
            <TextInput
              label="Minutes"
              style={styles.timerInput}
              value={minutes}
              onChangeText={(text) => {
                handleTimeChange("minutes", text);
                if (text.length === 2) {
                  secondsRef.current.focus();
                }
              }}
              ref={minutesRef}
            />
            <Text style={styles.timerSeparator}>:</Text>
            <TextInput
              label="Seconds"
              style={styles.timerInput}
              value={seconds}
              onChangeText={(text) => handleTimeChange("seconds", text)}
              ref={secondsRef}
            />
            </View>
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
          {}
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
  roundDurationStyle: {
    fontSize: 16,
    marginBottom: -10,
    fontWeight: "bold",
  },
  timerContainer: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "center",
  },
  timerInput: {
    flex: 1,
    backgroundColor: null,
    marginBottom: 2,
  },
  timerSeparator: {
    fontSize: 20,
    fontWeight: "bold",
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