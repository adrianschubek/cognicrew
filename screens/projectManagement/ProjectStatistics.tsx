import React, { useEffect, useState } from "react";
import { StatusBar } from "expo-status-bar";
import { View, ScrollView } from "react-native";
import {
  Card,
  useTheme,
  MD3LightTheme as LightTheme,
  MD3DarkTheme as DarkTheme,
} from "react-native-paper";

import { useAuth } from "../../providers/AuthProvider";
import { useProjectStore } from "../../stores/ProjectStore";
import { supabase } from "../../supabase";
import StatisticCategory from "../../components/profile/StatisticCategory";
import { useAllStatistics } from "../../utils/hooks";
import LoadingOverlay from "../../components/alerts/LoadingOverlay";

export default function ProjectStatistics() {
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

  const heading = "headlineSmall";
  const heading2 = "titleLarge";
  const heading3 = "titleMedium";
  const heading4 = "labelLarge";

  const { user } = useAuth();
  const projectId = useProjectStore((state) => state.projectId);

  const [countExercises, setCountExercises] = useState(0);
  const [countFlashcards, setCountFlashcards] = useState(0);
  const [countLinks, setCountLinks] = useState(0);
  const [countDocuments, setCountDocuments] = useState(0);
  const [countPhotos, setCountPhotos] = useState(0);
  const { data, error, isLoading, mutate } = useAllStatistics(
    projectId,
    user.id,
  );

  const [countQuizWins, setQuizWins] = useState(null);
  const [countQuizScore, setQuizScore] = useState(null);
  const [countCardsWins, setCardsWins] = useState(null);
  const [countCardsScore, setCardsScore] = useState(null);

  const [timeQuiz, setTimeSpentQuiz] = useState(null);
  const [timeCards, setTimeSpentCards] = useState(null);
  const [timeBoard, setTimeSpentBoard] = useState(null);

  const [countRankUnderFriends, setRankUnderFriends] = useState(null);
  const [countRankGlobal, setRankGlobal] = useState(null);

  const widthAndHeight = 100;
  const series = [
    parseFloat(formatTimeSpent(timeQuiz)),
    parseFloat(formatTimeSpent(timeCards)),
    parseFloat(formatTimeSpent(timeBoard)),
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


  useEffect(() => {
    if (!data || isLoading) return;
    setCountLinks(data.linkCount);
    setCountFlashcards(data.flashcardCount);
    setCountExercises(data.exerciseCount);
    setCountDocuments(data.documentCount);
    setCountPhotos(data.imageCount);
    setRankGlobal(data.globalRank)
    setRankUnderFriends(data.rankUnderFriends);
    setCardsScore(data.gameStats["scoreFlashcards"]);
    setCardsWins(data.gameStats["winsFlashcards"]);
    setQuizScore(data.gameStats["scoreQuiz"]);
    setQuizWins(data.gameStats["winsQuiz"]);
    setTimeSpentQuiz(data.gameStats["timeSpentQuiz"]);
    setTimeSpentCards(data.gameStats["timeSpentFlashcards"]);
    setTimeSpentBoard(data.gameStats["timeSpentWhiteboard"]);
  }, [data]);
  useEffect(() => {
    mutate();
  }, []);
  const fileStatistics = [
    {
      title: "CogniCards",
      dataPointCategories: [
        {
          dataPoints: [`Amount of flashcards: ${countFlashcards}`],
        },
      ],
    },
    {
      title: "CogniCises",
      dataPointCategories: [
        {
          dataPoints: [`Amount of exercises: ${countExercises}`],
        },
      ],
    },
    {
      title: "CogniLinks",
      dataPointCategories: [
        {
          dataPoints: [`Amount of links: ${countLinks}`],
        },
      ],
    },
    {
      title: "Cognifiles",
      dataPointCategories: [
        {
          dataPoints: [
            `Amount of files: ${countDocuments}`,
            `Amount of photos: ${countPhotos}`,
          ],
        },
      ],
    },
  ];
  const leaderboard = [
    {
      title: "Relative time spent on each game",
      dataPointCategories: [
        {
          dataPoints: [
            `CogniQuiz: ${series[0]} hours, ${percentExercise} %`,
            `Amount of CogniQuiz wins: ${countQuizWins}`,
            `CogniScore - CogniQuiz: ${countQuizScore}`,
          ],
          textColor: gameColors.quizColor,
        },
        {
          dataPoints: [
            `CogniCards: ${series[1]} hours, ${percentQuiz} %`,
            `Amount of CogniCards wins: ${countCardsWins}`,
            `CogniScore - CogniCards: ${countCardsScore}`,
          ],
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
  const ranks = [
    {
      title: "Global rank:",
      dataPointCategories: [
        {
          dataPoints: [`# ${countRankGlobal}`],
          textColor: theme.colors.globalRank,
        },
      ],
    },
    {
      title: "Rank under friends:",
      dataPointCategories: [
        {
          dataPoints: [`# ${countRankUnderFriends}`],
          textColor: theme.colors.friendRank,
        },
      ],
    },
  ];
  if (isLoading) return <LoadingOverlay visible={isLoading} />;
  return (
    <ScrollView>
      <StatusBar style="auto" />
      <Card>
        <Card.Title
          titleVariant={heading}
          title="File statistics"
          style={{ backgroundColor: theme.colors.background }}
        ></Card.Title>
      </Card>
      {fileStatistics.map((item, index) => {
        return (
          <StatisticCategory
            key={index}
            data={{
              title: item.title,
              dataPointCategories: item.dataPointCategories,
            }}
          />
        );
      })}

      <Card>
        <Card.Title
          titleVariant={heading}
          title="Leaderboard"
          style={{ backgroundColor: theme.colors.background }}
        ></Card.Title>
      </Card>
      {ranks.map((item, index) => {
        return (
          <StatisticCategory
            key={index}
            data={{
              title: item.title,
              dataPointCategories: item.dataPointCategories,
            }}
            textVariant={heading}
          />
        );
      })}

      <Card>
        <Card.Title
          titleVariant={heading}
          title="Game statistics"
          style={{ backgroundColor: theme.colors.background }}
        ></Card.Title>
      </Card>
      <View style={{ gap: 20, marginBottom: 20 }}>
        {leaderboard.map((item, index) => {
          return (
            <StatisticCategory
              key={index}
              data={{
                title: item.title,
                dataPointCategories: item.dataPointCategories,
              }}
              pieChart={item.pieChart}
            />
          );
        })}
      </View>
    </ScrollView>
  );
}
