import * as React from "react";
import {
  KeyboardAvoidingView,
  Platform,
  StyleSheet,
  View,
  Image,
} from "react-native";
import { TextInput, Text, Button } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import CountDown from "react-native-countdown-component";
import { useEffect, useState } from "react";
import { ScrollView } from "react-native";
import { useFlashcardsMultipleSets, useSoundSystem2 } from "../utils/hooks";

export default function FlashcardGame({ route }) {
  useSoundSystem2();

  const roundDuration = route.params?.roundDuration || 0;
  const sets = route.params?.sets || [];
  const numberOfRounds = route.params?.numberOfRounds || 0;

  // Fetch flashcards data using the useFlashcards hook when the component mounts
  const { data: flashcards } = useFlashcardsMultipleSets(sets);

  // Shuffle the flashcards array when it is first loaded
  const [shuffledFlashcards, setShuffledFlashcards] = useState([]);

  useEffect(() => {
    if (flashcards !== undefined && flashcards.length > 0) {
      setShuffledFlashcards(shuffleArray(flashcards));
      setCurrentFlashcardIndex(0);
    }
  }, [flashcards]);

  const [currentFlashcardIndex, setCurrentFlashcardIndex] = useState(0);

  const showNextFlashcard = () => {
    if (currentFlashcardIndex < shuffledFlashcards.length - 1) {
      setCurrentFlashcardIndex(currentFlashcardIndex + 1);
    } else if (currentFlashcardIndex >= shuffledFlashcards.length - 1) {
      alert("You finished the Quiz!");
    }
  };

  const currentFlashcard = shuffledFlashcards[currentFlashcardIndex];

  const [isAnswerCorrect, setIsAnswerCorrect] = useState(false);
  const [showNextButton, setShowNextButton] = useState(false);

  function checkAnswer() {
    if (currentFlashcard) {
      const userAnswer = userInput;
      const correctAnswer = currentFlashcard.answer;

      if (userAnswer === correctAnswer) {
        // The answer is correct
        setIsAnswerCorrect(true);
        setShowNextButton(true);
        alert("Correct answer!");
      } else {
        // The answer is incorrect
        setIsAnswerCorrect(false);
        setShowNextButton(false);
        alert("Incorrect answer. Try again.");
      }
    }
  }

  function handleNext() {
    setShowNextButton(false);
    setIsAnswerCorrect(false);
    setUserInput(""); // Clear the TextInput
    showNextFlashcard();
  }

  const [userInput, setUserInput] = useState("");

  const shuffleArray = (array) => {
    const newArray = [...array];
    for (let i = newArray.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [newArray[i], newArray[j]] = [newArray[j], newArray[i]];
    }
    // shorten the array according to numberOfRounds if numberOfRounds is smaller
    // than newArray.length otherwise just take the whole array
    if (numberOfRounds < newArray.length) {
      return newArray.slice(0, numberOfRounds);
    } else {
      return newArray;
    }
  };

  return (
    <>
      <KeyboardAvoidingView
        behavior={Platform.OS === "ios" ? "padding" : "height"}
        style={{ flex: 1 }}
      >
        <View style={styles.container}>
          <View style={styles.topRow}>
            <CountDown
              style={styles.countDownStyle}
              until={roundDuration}
              size={30}
              onFinish={() => alert("Finished")}
              digitStyle={{
                backgroundColor: null,
                borderWidth: 2,
                borderColor: "grey",
              }}
              digitTxtStyle={{ color: "grey" }}
              timeToShow={["M", "S"]}
              timeLabels={{ m: null, s: null }}
              showSeparator
            />
            <View style={[styles.topRightContainer, { alignSelf: "flex-end" }]}>
              <Image
                source={{
                  uri: "https://iptk.w101.de/storage/v1/object/public/profile-pictures/icon.png",
                }}
                style={[styles.image, { alignSelf: "flex-end" }]}
              />
              <Text>User 1</Text>
              <Image
                source={{
                  uri: "https://iptk.w101.de/storage/v1/object/public/profile-pictures/icon.png",
                }}
                style={[styles.image, { alignSelf: "flex-end" }]}
              />
              <Text>User 2</Text>
            </View>
          </View>
          <ScrollView contentContainerStyle={styles.scrollContent}>
            <Text style={styles.questionStyle}>
              {currentFlashcard ? currentFlashcard.question : ""}
            </Text>
          </ScrollView>
        </View>
        <View style={styles.answerViewStyle}>
          <Text style={styles.answerStyle}> Answer</Text>
          <TextInput
            label="Type your answer"
            style={styles.answerInputStyle}
            value={userInput}
            onChangeText={(text) => setUserInput(text)}
          />
        </View>
        <View style={styles.submitButtonContainer}>
          {showNextButton ? (
            <Button onPress={handleNext}>Next</Button>
          ) : (
            <Button onPress={checkAnswer}>Submit</Button>
          )}
        </View>
      </KeyboardAvoidingView>
    </>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "flex-start",
  },
  countDownStyle: {
    marginLeft: responsiveWidth(27.5),
    marginRight: responsiveWidth(15),
  },
  topRightContainer: {
    marginTop: 3,
    flexDirection: "column",
    alignItems: "flex-end",
  },
  topRow: {
    flexDirection: "row",
    alignItems: "center",
  },
  image: {
    width: responsiveWidth(10),
    height: responsiveHeight(5),
    marginRight: 3,
    borderRadius: 20,
    overflow: "hidden",
    alignItems: "flex-end",
  },
  questionStyle: {
    fontSize: 18,
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
  submitButtonContainer: {
    marginLeft: responsiveWidth(75),
  },
  answerViewStyle: {
    flexDirection: "row",
    alignItems: "center",
  },
  scrollContent: {
    paddingVertical: 16,
  },
});
