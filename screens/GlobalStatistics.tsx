import React, { useEffect, useState } from "react";
import { ScrollView } from "react-native";
import {
  Divider,
  useTheme,
  MD3LightTheme as LightTheme,
  MD3DarkTheme as DarkTheme,
} from "react-native-paper";
import { SafeAreaView } from "react-native-safe-area-context";
import { StatusBar } from "expo-status-bar";
import { useAuth } from "../providers/AuthProvider";
import StatisticCategory from "../components/profile/StatisticCategory";
import { useGlobalStatistics } from "../utils/hooks";

export default function GlobalStatistics() {
  const [totalTimeQuiz, setTotalTimeSpentQuiz] = useState(null);
  const [totalTimeCards, setTotalTimeSpentCards] = useState(null);
  const [totalTimeBoard, setTotalTimeSpentBoard] = useState(null);

  const lightTheme = {
    ...LightTheme,
    colors: {
      ...LightTheme.colors,
      pieChartFirst: "rgb(72, 147, 176)",
      pieChartSecond: "rgb(102, 51, 153)",
      pieChartThird: "rgb(147, 204, 161)",
      isZero: "rgb(0, 0, 0)",
      globalRank: "rgb(212, 175, 55)",
      friendRank: "rgb(132, 61, 163)",
    },
  };

  const darkTheme = {
    ...DarkTheme,
    colors: {
      ...DarkTheme.colors,
      pieChartFirst: "rgb(72, 147, 176)",
      pieChartSecond: "rgb(102, 51, 153)",
      pieChartThird: "rgb(147, 204, 161)",
      isZero: "rgb(255, 255, 255)",
      globalRank: "rgb(212, 175, 55)",
      friendRank: "rgb(132, 61, 163)",
    },
  };

  const { dark } = useTheme();
  const theme = dark ? darkTheme : lightTheme;

  const widthAndHeight = 100;
  const series = [
    parseFloat(formatTimeSpent(totalTimeQuiz)),
    parseFloat(formatTimeSpent(totalTimeCards)),
    parseFloat(formatTimeSpent(totalTimeBoard)),
  ];
  const filteredSeries = series.filter((value) => value !== 0);
  const sumTimeGames = filteredSeries.reduce(
    (accumulator, currentValue) => accumulator + currentValue,
    0,
  );
  const percentExercise =
    series[0] === 0 ? 0 : ((series[0] / sumTimeGames) * 100).toFixed(2);
  const percentQuiz =
    series[1] === 0 ? 0 : ((series[1] / sumTimeGames) * 100).toFixed(2);
  const percentWhiteboard =
    series[2] === 0 ? 0 : ((series[2] / sumTimeGames) * 100).toFixed(2);

  function formatTimeSpent(milliseconds: number) {
    return (milliseconds / 1000 / 60 / 60).toFixed(2);
  }
  const quizGotTime = series[0] === 0 ? false : true;
  const cardsGotTime = series[1] === 0 ? false : true;
  const whiteboardGotTime = series[2] === 0 ? false : true;
  const gameColors = {
    quizColor: quizGotTime ? theme.colors.pieChartFirst : theme.colors.isZero,
    cardColor: cardsGotTime ? theme.colors.pieChartSecond : theme.colors.isZero,
    witheboardColor: whiteboardGotTime
      ? theme.colors.pieChartThird
      : theme.colors.isZero,
  };

  const [countExercises, setCountExercises] = useState(null);
  const [countFlashcards, setCountFlashcards] = useState(null);
  const [countLinks, setCountLinks] = useState(null);
  const [countDocuments, setCountDocuments] = useState(null);
  const [countPhotos, setCountPhotos] = useState(null);

  const [countLearningProjects, setCountLearningProjects] = useState(null);

  const { user } = useAuth();

  const { data, error, isLoading, mutate } = useGlobalStatistics(
    user.id,
  );


  useEffect(() => {
    if (!data || isLoading) return;
    setCountDocuments(data[0]["count_documents"]);
    setCountPhotos(data[0]["count_photos"]);
    setCountLinks(data[0]["count_links"]);
    setCountFlashcards(data[0]["count_flashcards"]);
    setCountExercises(data[0]["count_exercises"]);

    setCountLearningProjects(data[0]["count_projects"]);

    setTotalTimeSpentQuiz(data[0]["total_time_spent_quiz"]);
    setTotalTimeSpentCards(data[0]["total_time_spent_flashcards"]);
    setTotalTimeSpentBoard(data[0]["total_time_spent_whiteboard"]);
  }, [data]);
  useEffect(() => {
    mutate();
  }, []);

  
  const statistics = [
    {
      title: "Global statistics",
      dataPointCategories: [
        {
          dataPoints: [
            `Total amount of learning projects: ${countLearningProjects}`,
            `Total time spent playing CogniGames: ${
              (series[0] + series[1] + series[2]).toFixed(2)
            } hours`,
          ],
        },
      ],
    },
    {
      title: "File statistics",
      dataPointCategories: [
        {
          dataPoints: [
            `Total amount of exercises: ${countExercises}`,
            `Total amount of flashcards: ${countFlashcards}`,
            `Total amount of links: ${countLinks}`,
            `Total amount of documents: ${countDocuments}`,
            `Total amount of photos: ${countPhotos}`,
          ],
        },
      ],
    },
    {
      title: "Game statistics",
      dataPointCategories: [
        {
          dataPoints: [`Exercises: ${series[0]} hours, ${percentExercise} %`],
          textColor: gameColors.quizColor,
        },
        {
          dataPoints: [`Flashcards: ${series[1]} hours, ${percentQuiz} %`],
          textColor: gameColors.cardColor,
        },

        {
          dataPoints: [
            `Whiteboard: ${series[2]} hours, ${percentWhiteboard} %`,
          ],
          textColor: gameColors.witheboardColor,
        },
      ],
      ...(filteredSeries.reduce((sum, value) => sum + value, 0) > 0 && {
        pieChart: {
          widthAndHeight: widthAndHeight,
          series: filteredSeries,
          sliceColor: Object.values(gameColors).filter(
            (e) => e !== theme.colors.isZero,
          ),
        },
      }),
    },
  ];
  return (
    <SafeAreaView style={{ marginTop: -28 }}>
      <StatusBar style="auto" />
      <ScrollView>
        {statistics.map((item, index) => {
          return (
            <StatisticCategory
              key={index}
              //titleVariant="headlineSmall"
              //textVariant="bodyLarge"
              data={{
                title: item.title,
                dataPointCategories: item.dataPointCategories,
              }}
              pieChart={item.pieChart}
            />
          );
        })}
        <Divider />
      </ScrollView>
    </SafeAreaView>
  );
}
