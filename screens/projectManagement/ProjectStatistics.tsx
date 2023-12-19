import React, { useEffect, useState } from "react";
import { StatusBar } from "expo-status-bar";
import { View, ScrollView } from "react-native";
import {
  Card,
  Divider,
  Text,
  useTheme,
  MD3LightTheme as LightTheme,
  MD3DarkTheme as DarkTheme,
} from "react-native-paper";

import { useAuth } from "../../providers/AuthProvider";
import { useProjectStore } from "../../stores/ProjectStore";
import { supabase } from "../../supabase";
import StatisticCategory from "../../components/profile/StatisticCategory";

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

  const [countExercises, setCountExercises] = useState(null);
  const [countFlashcards, setCountFlashcards] = useState(null);
  const [countLinks, setCountLinks] = useState(null);
  const [countDocuments, setCountDocuments] = useState(null);
  const [countPhotos, setCountPhotos] = useState(null);

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

  async function calcCountExercises() {
    let { data, error } = await supabase
      .from("exercises")
      .select("*, sets(*, learning_projects(*))");
    if (error) {
      console.error("Error fetching data:", error);
    } else {
      const filteredArray = data.filter(
        (item) => item.sets.project_id === projectId,
      );
      const count = filteredArray ? filteredArray.length : 0;
      setCountExercises(count);
    }
  }

  async function calcCountFlashcards() {
    let { data, error } = await supabase
      .from("flashcards")
      .select("*, sets(*, learning_projects(*))");
    if (error) {
      console.error("Error fetching data:", error);
    } else {
      const filteredArray = data.filter(
        (item) => item.sets.project_id === projectId,
      );
      const count = filteredArray ? filteredArray.length : 0;
      setCountFlashcards(count);
    }
  }

  async function calcCountLinks() {
    let { data, error } = await supabase.from("links").select("*");
    if (error) {
      console.error("Error fetching data:", error);
    } else {
      const filteredArray = data.filter(
        (item) => item.learning_project === projectId,
      );
      const count = filteredArray ? filteredArray.length : 0;
      setCountLinks(count);
    }
  }

  async function calcCountFiles(folderName) {
    try {
      if (folderName == "documents") {
        let { data, error } = await supabase.storage
          .from("files")
          .list(`${projectId}/documents`);
        if (error) {
          throw error;
        }
        const fileCount = data.length;
        return fileCount;
      } else {
        let { data, error } = await supabase.storage
          .from("files")
          .list(`${projectId}/photos`);
        if (error) {
          throw error;
        }
        const fileCount = data.length;
        return fileCount;
      }
    } catch (error) {
      console.error("Error counting files", error.message);
    }
  }

  async function calcGameStats() {
    let { data, error } = await supabase
      .from("user_learning_projects")
      .select("stats")
      .eq("learning_project_id", projectId);
    if (error) {
      console.error("Error fetching data:", error);
    } else {
      setCardsScore(data[0]["stats"]["scoreFlashcards"]);
      setCardsWins(data[0]["stats"]["winsFlashcards"]);
      setQuizScore(data[0]["stats"]["scoreQuiz"]);
      setQuizWins(data[0]["stats"]["winsQuiz"]);
      setTimeSpentQuiz(data[0]["stats"]["timeSpentQuiz"]);
      setTimeSpentCards(data[0]["stats"]["timeSpentFlashcards"]);
      setTimeSpentBoard(data[0]["stats"]["timeSpentWhiteboard"]);
    }
  }

  async function calcRankUnderFriends() {
    let { data, error } = await supabase.rpc("get_user_rank_and_id", {
      user_id_param: user.id,
      project_id_param: projectId,
    });
    for (let i = 0; i < data.length; i++) {
      if (data[i]["user_id"] == user.id) {
        setRankUnderFriends(data[i]["user_rank"]);
        break;
      }
    }
  }

  async function calcRankGlobal() {
    let { data, error } = await supabase.rpc("get_user_global_rank", {
      project_id_param: projectId,
    });
    for (let i = 0; i < data.length; i++) {
      if (data[i]["user_id"] == user.id) {
        setRankGlobal(data[i]["user_rank"]);
        break;
      }
    }
  }

  useEffect(() => {
    const fetchData = async () => {
      try {
        calcCountExercises();
        calcCountFlashcards();
        calcCountLinks();
        const documentsCount = await calcCountFiles("documents");
        const photosCount = await calcCountFiles("photos");
        setCountDocuments(documentsCount);
        setCountPhotos(photosCount);
        calcGameStats();
        calcRankUnderFriends();
        calcRankGlobal();
      } catch (error) {
        console.error("Error in fetching data:", error.message);
      }
    };
    fetchData();
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
          ></StatisticCategory>
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
          ></StatisticCategory>
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
            ></StatisticCategory>
          );
        })}
      </View>
    </ScrollView>
  );
}
