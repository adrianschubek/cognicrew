import * as React from "react";
import { KeyboardAvoidingView, Platform, StyleSheet, View } from "react-native";
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

export default function FlashcardGame({route}) {
const totalTimeInSeconds = route.params?.totalTimeInSeconds || 0;
const checkedItems = route.params?.checkedItems || [];
  
//TODO add set functionality, currently it is just picking a flashcard from below
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
  {
    question: "1",
    answer:
      "1",
    id: 5,
    groupId: 3
  },
]

  // useEffect to show a random flashcard on initial mount
  useEffect(() => {
    showRandomFlashcard();
  }, []);

function getRandomFlashcard(flashcards) {
  const randomIndex = Math.floor(Math.random() * flashcards.length);
  return flashcards[randomIndex];
}
  const [currentFlashcard, setCurrentFlashcard] = useState(null);

  const showRandomFlashcard = () => {
    const randomCard = getRandomFlashcard(flashcards);
    setCurrentFlashcard(randomCard);
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
            contentContainerStyle={styles.scrollContent}>
            <View style={styles.container}>
              <Button onPress={showRandomFlashcard}>Next</Button>
              <Text style={styles.answerStyle}>{currentFlashcard ? currentFlashcard.question : ''}</Text>
            </View>
          </ScrollView>
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
