import CreateQuizGame from "../components/dialogues/CreateQuizGame";

import * as React from "react";
import {
  ScrollView,
  View,
  TouchableOpacity,
  StyleSheet,
  Alert,
} from "react-native";
import {
  Dialog,
  Portal,
  RadioButton,
  Button,
  Text,
  ProgressBar,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveFontSize,
} from "react-native-responsive-dimensions";

// Placeholder function to simulate fetching questions
const fetchQuestions = () => {
  return [
    {
      question: "Which city is the capital of France?",
      options: ["Paris", "Berlin", "Rome", "Madrid"],
      correctAnswer: "Paris",
    },
    {
      question: "Wie groß ist Timo's Weihnachtsbaum?",
      options: [
        "2cm",
        "3cm",
        "5m",
        "Timo ist Atheist obwohl sein Vater Theologie studiert hat und besitzt daher keinen Weihnachtsbaum",
      ],
      correctAnswer:
        "Timo ist Atheist obwohl sein Vater Theologie studiert hat und besitzt daher keinen Weihnachtsbaum",
    },
    {
      question: "A, B, C und ?",
      options: ["D", "X", "Y", "Z"],
      correctAnswer: "D",
    },
  ];
};

export default function ExerciseGame({}) {
  const [questions, setQuestions] = React.useState(
    shuffleArray(fetchQuestions()),
  );
  const [currentQuestionIndex, setCurrentQuestionIndex] = React.useState(0);
  const [checked, setChecked] = React.useState(null);
  const [score, setScore] = React.useState(0);
  const [answeredQuestions, setAnsweredQuestions] = React.useState(
    new Array(questions.length).fill(null),
  );
  const [reviewTime, setReviewTime] = React.useState("10m");
  const [quizComplete, setQuizComplete] = React.useState(false);

  const handleNextQuestion = () => {
    if (checked) {
      const isCorrect =
        questions[currentQuestionIndex].correctAnswer === checked;
      setAnsweredQuestions((answeredQuestions) => {
        const updatedAnswers = [...answeredQuestions];
        updatedAnswers[currentQuestionIndex] = isCorrect;
        return updatedAnswers;
      });

      if (isCorrect) setScore((prevScore) => prevScore + 1);

      Alert.alert(
        isCorrect ? "Correct!" : "Incorrect!",
        isCorrect
          ? "You're awesome! Keep it up!"
          : `The correct answer was: ${questions[currentQuestionIndex].correctAnswer}`,
        [{ text: "OK", onPress: () => advanceQuestion() }],
      );
    } else {
      Alert.alert(
        "No Answer",
        "Please select an answer or skip the question.",
        [{ text: "OK" }],
      );
    }
  };

  function shuffleArray(array) {
    let currentIndex = array.length,
      randomIndex;
    while (currentIndex !== 0) {
      randomIndex = Math.floor(Math.random() * currentIndex);
      currentIndex--;
      [array[currentIndex], array[randomIndex]] = [
        array[randomIndex],
        array[currentIndex],
      ];
    }
    return array;
  }

  const resetQuiz = () => {
    setQuestions(shuffleArray(fetchQuestions()));
    setCurrentQuestionIndex(0);
    setChecked(null);
    setScore(0);
    setQuizComplete(false);
    setAnsweredQuestions(new Array(questions.length).fill(null));
  };

  const advanceQuestion = () => {
    if (currentQuestionIndex < questions.length - 1) {
      setCurrentQuestionIndex(currentQuestionIndex + 1);
      setChecked(null);
    } else {
      setQuizComplete(true);
    }
  };

  const handleSkipQuestion = () => {
    advanceQuestion();
  };

  const currentQuestion = questions[currentQuestionIndex];
  const progressBar = (currentQuestionIndex + 1) / questions.length;

  return quizComplete ? (
    <Portal>
      <Dialog visible={quizComplete} onDismiss={() => setQuizComplete(false)}>
        <Dialog.Title>Quiz Summary</Dialog.Title>
        <Dialog.Content>
          <Text>
            Your score: {score}/{questions.length}
          </Text>
        </Dialog.Content>
        <Dialog.Actions>
          <Button
            onPress={() => {
              resetQuiz();
            }}
          >
            Retake Quiz
          </Button>
          <Button onPress={close}>Close</Button>
        </Dialog.Actions>
      </Dialog>
    </Portal>
  ) : (
    <>
      <ScrollView contentContainerStyle={styles.scrollView}>
        <Dialog.Title style={{ textAlign: "center", alignSelf: "center" }}>
          Question {currentQuestionIndex + 1} of {questions.length}
        </Dialog.Title>
        <ProgressBar
          style={styles.progressBar}
          progress={(currentQuestionIndex + 1) / questions.length}
          color={"blue"}
        />
        <Text style={styles.question}>{currentQuestion.question}</Text>
        <View style={styles.optionsContainer}>
          <RadioButton.Group
            onValueChange={(newValue) => setChecked(newValue)}
            value={checked}
          >
            {currentQuestion.options.map((option, index) => (
              <RadioButton.Item
                key={index}
                label={`${String.fromCharCode(65 + index)}) ${option}`}
                value={option}
                uncheckedColor="white"
                style={styles.optionItem}
              />
            ))}
          </RadioButton.Group>
        </View>
        <Text style={styles.reviewQuestion}>
          When would you like to review this question?
        </Text>
        <RadioButton.Group
          onValueChange={(newValue) => setReviewTime(newValue)}
          value={reviewTime}
        >
          <View style={styles.reviewOptions}>
            <RadioButton.Item
              label="10m"
              value="10m"
              status={reviewTime === "10m" ? "checked" : "unchecked"}
            />
            <RadioButton.Item
              label="1 day"
              value="1 day"
              status={reviewTime === "1 day" ? "checked" : "unchecked"}
            />
            <RadioButton.Item
              label="4 days"
              value="4 days"
              status={reviewTime === "4 days" ? "checked" : "unchecked"}
            />
          </View>
        </RadioButton.Group>
      </ScrollView>
      <View>
        <Button onPress={handleSkipQuestion}>Skip question</Button>
        <Button onPress={handleNextQuestion}>Check</Button>
        <Button onPress={() => {}}>Done</Button>
      </View>
    </>
  );
}

const styles = StyleSheet.create({
  progressBar: {
    height: 20,
    width: "100%",
    backgroundColor: "grey",
    borderColor: "#000",
    borderWidth: 2,
    borderRadius: 5,
  },
  progressIndicator: {
    height: "100%",
    borderRadius: 5,
    backgroundColor: "green",
  },
  summaryScreen: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
  summaryText: {
    fontSize: responsiveFontSize(2.5),
    textAlign: "center",
    marginBottom: 20,
  },
  scrollView: {
    //
    paddingVertical: 20,
  },
  question: {
    //
    fontSize: responsiveFontSize(2.5),
    textAlign: "center",
    alignSelf: "center",
    marginBottom: 20,
    marginTop: 20,
  },
  optionsContainer: {
    justifyContent: "center",
  },
  optionsRow: {
    flexDirection: "row",
    justifyContent: "space-around",
    width: "100%",
    marginBottom: 10,
  },
  optionItem: {
    flex: 1,
    paddingHorizontal: 10,
  },
  reviewQuestion: {
    fontSize: responsiveFontSize(2),
    textAlign: "center",
    marginVertical: 20,
  },
  reviewOptions: {
    flexDirection: "row",
    justifyContent: "space-around",
    alignItems: "center",
  },
  reviewOption: {
    fontSize: responsiveFontSize(2),
  },
  reviewOptionSelected: {
    fontSize: responsiveFontSize(2),
    textDecorationLine: "underline",
  },
});
