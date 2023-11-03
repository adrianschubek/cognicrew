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
import CountDown from 'react-native-countdown-component';
import { useState } from "react";
import { accordionSectionItems } from "../components/learningProject/AccordionSection";
import { ScrollView } from "react-native";

export default function FlashcardGame({ navigation, route, checkedItems }) {
  const totalTimeInSeconds = route.params.totalTimeInSeconds;
  const [selectedItems, setSelectedItems] = useState({});
  const flashcards = [ {question: "What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? ",
    answer: "on case studies of his own patients and those of his colleagues",
    id: 1,
    groupId: 1,
  },
  {
    question: "Why can't I find love and why doesn't my family love me?",
    answer: "because I am clearly unloveable",
    id: 2,
    groupId: 1
  },
  {
    question: "Why do we live?",
    answer: "we live ultimately to survive and pass on our genes",
    id: 3,
    groupId: 2
  },
  {
    question: "How can i convince my gf to buy me a Porsche?",
    answer:
      "use of questionable, agressive and emotionaly manipulative tactics",
    id: 4,
    groupId: 3
  },
];

function getRandomFlashcard(flashcards) {
  const randomIndex = Math.floor(Math.random() * flashcards.length);
  return flashcards[randomIndex];
}
  const [currentFlashcard, setCurrentFlashcard] = useState(null);

  const showRandomFlashcard = () => {
    const randomCard = getRandomFlashcard(flashcards);
    setCurrentFlashcard(randomCard);
  };

  const handleItemSelection = (learningSetId, itemId) => {
    setSelectedItems((prevSelectedItems) => ({
      ...prevSelectedItems,
      [learningSetId]: itemId,
    }));
  };

  return (
    <>
      <View style={styles.container}>
      <CountDown
        until={totalTimeInSeconds}
        size={30}
        onFinish={() => alert('Finished')}
        digitStyle={{backgroundColor: null, borderWidth: 2, borderColor: 'grey'}}
        digitTxtStyle={{color: 'grey'}}
        timeToShow={['M', 'S']}
        timeLabels={{m: null, s: null}}
        showSeparator
      />
      <ScrollView
              contentContainerStyle={styles.scrollContent}
              style={styles.scrollContainer}
            >
              <View style={styles.container}>
              <Button onPress={showRandomFlashcard}>Show Random Flashcard</Button>
                <Text style={styles.answerStyle}> {getRandomFlashcard(flashcards).question} </Text>
              </View>
            </ScrollView>
            <View style={styles.answerViewStyle}>
            <Text style={styles.answerStyle}> Answer</Text>
            <TextInput
              label="Type your answer"
              style={styles.answerInputStyle}
            />
            </View>
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
  answerStyle: {
    fontSize: 18,
    marginLeft: responsiveWidth(5),
    marginRight: 10,
  },
  answerInputStyle: {
    marginRight: responsiveWidth(5),
    flex: 1,
    backgroundColor: null,
    borderLeftWidth: 1,
    borderRightWidth: 1,
    borderTopWidth: 1,
    borderColor: "gray",
  },
  answerViewStyle: {
    flexDirection: "row",
    alignItems: "center",
  },
  scrollContainer: {
    maxHeight: responsiveHeight(30),
  },
  scrollContent: {
    paddingVertical: 16,
  },
});
