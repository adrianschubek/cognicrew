import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View, ScrollView, Alert } from "react-native";
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
import { useEffect, useState } from "react";
import { useNavigation } from '@react-navigation/native';
import { useRoute } from '@react-navigation/native';
import { ManagementType, NAVIGATION } from "../../types/common";
import { useSets } from "../../utils/hooks";
import { useProjectStore } from "../../stores/ProjectStore";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { useRefetchIndexStore } from "../../stores/BackendCommunicationStore";

export default function CreateFlashcardGame({showCreateFlashcardGame, close}) {
  const navigation = useNavigation<any>();
  const minutesRef = React.useRef(null);
  const secondsRef = React.useRef(null);

  // Use separate states for minutes and seconds
  const [minutes, setMinutes] = useState("");
  const [seconds, setSeconds] = useState("");

  const computeTimeInSeconds = () => {
    // Convert the minutes and seconds to integers (default to 0 if empty)
    const minutesInt = parseInt(minutes) || 0;
    const secondsInt = parseInt(seconds) || 0;
  
    // Calculate the total time in seconds
    const totalTimeInSeconds = minutesInt * 60 + secondsInt || 120;
    
    return totalTimeInSeconds;
  }

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

  // Initialize filteredAccordionSectionItems with an empty array
  const [filteredAccordionSectionItems, setFilteredAccordionSectionItems] = useState([]);

  //FIXME test projectId is null when not navigation from learning project list.! BUG
  const projectId = useProjectStore((state) => state.projectId);
  const { data } = useSets(ManagementType.FLASHCARD, projectId);
  
  useEffect(() => {
    if (data !== undefined && data !== null) {
      const formattedSetsData = (data ?? []).map((item) => ({ ...item, checked: false }));
      setFilteredAccordionSectionItems(formattedSetsData);
    }
  }, [data]);

  const handleSearch = (query) => {
    setSearchQuery(query);
    const filteredItems = data.map((item) => ({
      ...item,
      checked: false
    })).filter((item) =>
      item.name.toLowerCase().includes(query.toLowerCase())
    );
    setFilteredAccordionSectionItems(filteredItems);
  }

  const [checkedItems, setCheckedItems] = useState([]);

  const checkedItemsToNavigate = checkedItems || filteredAccordionSectionItems;

  const handleCheckboxPress = (id) => {
    const updatedItems = filteredAccordionSectionItems.map((item) => {
      if (item.id === id) {
        return { ...item, checked: !item.checked };
      }
      return item;
    });
    setFilteredAccordionSectionItems(updatedItems);

    const newCheckedItems = updatedItems.filter((item) => item.checked);
    setCheckedItems(newCheckedItems);
  };

  const handleNavigation = (totalTimeInSeconds) => {
    if (checkedItems === null || checkedItems.length === 0) {
      // If checkedItems is null or empty, show an alert
      Alert.alert("Choose Sets", "Choose one or multiple sets to play a game.");
    } else {
      // If checkedItems is not null and not empty, navigate to FLASHCARD_GAME
      navigation.navigate(NAVIGATION.FLASHCARD_GAME, {
        totalTimeInSeconds,
        checkedItems,
      });
    }
  };

  return (
    <>
      <Portal>
        <Dialog visible={showCreateFlashcardGame} onDismiss={close}>
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
              onSubmitEditing={() => {
                secondsRef.current.focus();
              }}
              returnKeyType="next"
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
                  <Text style={styles.accordionTitle}>{learningSet.name}</Text>
                  <Checkbox
                    status={learningSet.checked ? "checked" : "unchecked"}
                    onPress={() => handleCheckboxPress(learningSet.id)}
                  />
                </View>
              ))}
            </ScrollView>
          </Dialog.Content>
          <Dialog.Actions>
            <Button 
              onPress={close}
              style={{ marginRight: 'auto' }}>Cancel</Button>
            <Button 
                  onPress={() => {
                    const totalTimeInSeconds = computeTimeInSeconds();
                    close();
                    handleNavigation(totalTimeInSeconds);
                  }}
              >Done</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
      <View style={styles.container}>
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
