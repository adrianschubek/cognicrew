import React, { useEffect, useState } from "react";
import { StatusBar } from "expo-status-bar";
import { View, ScrollView } from "react-native";
import {
  Card,
  useTheme,
  MD3LightTheme as LightTheme,
  MD3DarkTheme as DarkTheme,
  HelperText,
  Divider,
} from "react-native-paper";

import { useAuth } from "../../providers/AuthProvider";
import { useProjectStore } from "../../stores/ProjectStore";
import StatisticCategory from "../../components/profile/StatisticCategory";
import { useProjectStatistics } from "../../utils/hooks";
import LoadingOverlay from "../../components/alerts/LoadingOverlay";

export default function ProjectStatistics({ navigation }) {
  useEffect(() => {
    navigation.setOptions({
      title: "Project Statistics",
    });
  }, []);
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
  const { user } = useAuth();
  const projectId = useProjectStore((state) => state.projectId);
  
  const { data, error, isLoading, mutate } = useProjectStatistics(
    projectId,
    user.id,
  );
  const [countExercises, setCountExercises] = useState(0);
  const [countFlashcards, setCountFlashcards] = useState(0);
  const [countLinks, setCountLinks] = useState(0);
  const [countDocuments, setCountDocuments] = useState(0);
  const [countPhotos, setCountPhotos] = useState(0);

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

  function formatTimeSpent(seconds: number) {
    return (seconds / 60 / 60).toFixed(2);
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
    setCountDocuments(data[0]["count_documents"]);
    setCountPhotos(data[0]["count_photos"]);
    setCountLinks(data[0]["count_links"]);
    setCountFlashcards(data[0]["count_flashcards"]);
    setCountExercises(data[0]["count_exercises"]);
    setRankGlobal(data[0]["global_rank"]);
    setRankUnderFriends(data[0]["friends_rank"]);
    setCardsScore(data[0]["project_stats"]["scoreFlashcards"]);
    setQuizScore(data[0]["project_stats"]["scoreQuiz"]);
    setCardsWins(data[0]["project_stats"]["winsFlashcards"]);
    setQuizWins(data[0]["project_stats"]["winsQuiz"]);
    setTimeSpentQuiz(data[0]["project_stats"]["timeSpentQuiz"]);
    setTimeSpentCards(data[0]["project_stats"]["timeSpentFlashcards"]);
    setTimeSpentBoard(data[0]["project_stats"]["timeSpentWhiteboard"]);
  }, [data]);
  useEffect(() => {
    mutate();
  }, []);
  const fileStatistics = [
    {
      title: "Cognicards",
      dataPointCategories: [
        {
          dataPoints: [`Amount of flashcards: ${countFlashcards}`],
        },
      ],
    },
    {
      title: "Cogniquiz",
      dataPointCategories: [
        {
          dataPoints: [`Amount of quizzes: ${countExercises}`],
        },
      ],
    },
    {
      title: "Cognilinks",
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
            `Amount of documents: ${countDocuments}`,
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
            `Cogniquiz: ${series[0]} hours, ${percentExercise} %`,
            `Amount of Cogniquiz wins: ${countQuizWins}`,
            `Score - Cogniquiz: ${countQuizScore}`,
          ],
          textColor: gameColors.quizColor,
        },
        {
          dataPoints: [
            `Cognicards: ${series[1]} hours, ${percentQuiz} %`,
            `Amount of Cognicards wins: ${countCardsWins}`,
            `Score - Cognicards: ${countCardsScore}`,
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
      title: "Rank among friends:",
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
      <Card.Title
        titleVariant={heading}
        title="Learning material"
        style={{ backgroundColor: theme.colors.background }}
      />
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
      <Card.Title
        titleVariant={heading}
        title="Leaderboard"
        style={{
          backgroundColor: theme.colors.background,
          marginTop: -10,
          zIndex: -1,
        }}
      />
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
      <Card.Title
        titleVariant={heading}
        title="Game statistics"
        style={{
          backgroundColor: theme.colors.background,
          marginTop: -10,
          zIndex: -1,
        }}
      />
      <View style={{ gap: 10, marginBottom: 20 }}>
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
        <Divider />
        <HelperText type="info">
          Project statistics will only be tracked if the user is a member of the
          project.
        </HelperText>
      </View>
    </ScrollView>
  );
}
