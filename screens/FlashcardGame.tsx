import * as React from "react";
import { KeyboardAvoidingView, Platform, StyleSheet, View, Image } from "react-native";
import {
  TextInput,
  Text,
  Button,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import CountDown from 'react-native-countdown-component';
import { useEffect, useState } from "react";
import { ScrollView } from "react-native";
import { useFlashcards } from "../utils/hooks";

export default function FlashcardGame({route}) {
const totalTimeInSeconds = route.params?.totalTimeInSeconds || 0;
const checkedItems = route.params?.checkedItems || [];
const [currentFlashcard, setCurrentFlashcard] = useState(null);

  // Fetch flashcards data using the useFlashcards hook when the component mounts
  const { data: flashcards } = useFlashcards(getRandomFirstIndex(checkedItems));

  useEffect(() => {
    if (flashcards != undefined && flashcards.length > 0) {
      const randomIndex = Math.floor(Math.random() * flashcards.length);
      setCurrentFlashcard(flashcards[randomIndex]);
    }
  }, [flashcards]);

  const showRandomFlashcard = () => {
    if (flashcards.length > 0) {
      const randomIndex = Math.floor(Math.random() * flashcards.length);
      setCurrentFlashcard(flashcards[randomIndex]);
    }
  };

  function getRandomFirstIndex(checkedItems) {
    if (checkedItems.length === 0) {
      return null;
    }
    const index =  Math.floor(Math.random() * checkedItems.length);
    return checkedItems[index].id;
  }

  const [isAnswerCorrect, setIsAnswerCorrect] = useState(false);
  const [showNextButton, setShowNextButton] = useState(false);

  function checkAnswer() {
    if (currentFlashcard) {
      const userAnswer = userInput; // Get the value from the TextInput component here;
      const correctAnswer = currentFlashcard.answer;
    
      if (userAnswer === correctAnswer) {
        // The answer is correct. You can show a success message or perform any other action.
        setIsAnswerCorrect(true);
        setShowNextButton(true);
        alert('Correct answer!');
      } else {
        // The answer is incorrect. You can show an error message or perform any other action.
        setIsAnswerCorrect(false);
        setShowNextButton(false);
        alert('Incorrect answer. Try again.');
      }
    }
  }

  function handleNext() {
    setShowNextButton(false);
    setIsAnswerCorrect(false);
    setUserInput(''); // Clear the TextInput
    showRandomFlashcard();
  }

  const [userInput, setUserInput] = useState('');

  return (
    <>
      <KeyboardAvoidingView
        behavior={Platform.OS === "ios" ? "padding" : "height"}
        style={{ flex: 1 }}>
        <View style={styles.container}>
        <View style ={styles.topRow}>
          <CountDown style={styles.countDownStyle}
            until={totalTimeInSeconds}
            size={30}
            onFinish={() => alert('Finished')}
            digitStyle={{backgroundColor: null, borderWidth: 2, borderColor: 'grey'}}
            digitTxtStyle={{color: 'grey'}}
            timeToShow={['M', 'S']}
            timeLabels={{m: null, s: null}}
            showSeparator
          />
                    <View style={[styles.topRightContainer, { alignSelf: "flex-end" }]}>
                    <Image
                    source={{
                    uri:
                        "https://iptk.w101.de/storage/v1/object/public/profile-pictures/icon.png"
                    
                    }}
                    style={[styles.image, { alignSelf: "flex-end" }]}
                    />
                    <Text>User 1</Text>
                    <Image
                    source={{
                    uri:
                        "https://iptk.w101.de/storage/v1/object/public/profile-pictures/icon.png"
                    
                    }}
                    style={[styles.image, { alignSelf: "flex-end" }]}
                    />
                    <Text>User 2</Text>
                </View>
                </View>
          <ScrollView
            contentContainerStyle={styles.scrollContent}>
              <Text style={styles.questionStyle}>{currentFlashcard ? currentFlashcard.question : ''}</Text>
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
