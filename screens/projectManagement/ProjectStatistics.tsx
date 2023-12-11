import React, { useEffect, useState } from "react";
import { View, StyleSheet, ScrollView } from "react-native";
import { Card, Divider, Text, useTheme } from "react-native-paper";

import PieChart from "react-native-pie-chart";
import { useAuth } from "../../providers/AuthProvider";
import { useProjectStore } from "../../stores/ProjectStore";
import { supabase } from "../../supabase";
import StatisticCategory from "../../components/profile/StatisticCategory";

export default function ProjectStatistics() {
  const theme = useTheme();
  const heading = "headlineSmall";
  const heading2 = "titleLarge";
  const heading3 = "titleMedium";
  const heading4 = "labelLarge";

  const widthAndHeight = 100;
  const series = [123, 321, 123];
  const sliceColor = ["#fbd203", "#ffb300", "#ff9100"];
  let sumTimeGames = series.reduce(
    (accumulator, currentValue) => accumulator + currentValue,
    0,
  );
  let percentExercise = ((series[0] / sumTimeGames) * 100).toFixed(2);
  let percentQuiz = ((series[1] / sumTimeGames) * 100).toFixed(2);
  let percentWhiteboard = ((series[2] / sumTimeGames) * 100).toFixed(2);

  function rainbowText(inputText) {
    const rainbowColors = [
      "red",
      "orange",
      "yellow",
      "green",
      "blue",
      "indigo",
      "violet",
    ];

    return inputText.split("").map((char, index) => (
      <Text
        key={index}
        style={[{ color: rainbowColors[index % rainbowColors.length] }]}
      >
        {char}
      </Text>
    ));
  }

  const { user } = useAuth();
  const projectId = useProjectStore((state) => state.projectId);

  //const count = useStatisticsByProject();

  const [countExercises, setCountExercises] = useState(null);
  const [countFlashcards, setCountFlashcards] = useState(null);
  const [countLinks, setCountLinks] = useState(null);
  const [countDocuments, setCountDocuments] = useState(null);
  const [countPhotos, setCountPhotos] = useState(null);

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
      } catch (error) {
        console.error("Error in fetching data:", error.message);
      }
    };
    fetchData();
  }, []);

  return (
    <ScrollView style={styles.container}>
      <Card>
        <Card.Title
          titleVariant={heading}
          title="File statistics"
          style={{ backgroundColor: theme.colors.background }}
        ></Card.Title>
      </Card>
      <StatisticCategory
        data={{
          title: "CogniCards",
          dataPoints: [`Amount of flashcards: ${countFlashcards}`],
        }}
      ></StatisticCategory>
      <StatisticCategory
        data={{
          title: "CogniCises",
          dataPoints: [`Amount of exercises: ${countExercises}`],
        }}
      ></StatisticCategory>
      <StatisticCategory
        data={{
          title: "CogniLinks",
          dataPoints: [`Amount of links: ${countLinks}`],
        }}
      ></StatisticCategory>
      <StatisticCategory
        data={{
          title: "Cognifiles",
          dataPoints: [
            `Amount of files: ${countDocuments}`,
            `Amount of photos: ${countPhotos}`,
          ],
        }}
      ></StatisticCategory>
      <Card>
        <Card.Title
          titleVariant={heading}
          title="Leaderboard"
          style={{ backgroundColor: theme.colors.background }}
        ></Card.Title>
      </Card>
      <View style={styles.categoryStyle}>
        <Card>
          <Card.Title
            titleVariant={heading3}
            title="Relative time spent on each game"
            style={{ backgroundColor: theme.colors.background }}
          ></Card.Title>
          <Card.Content
            style={{
              backgroundColor: theme.colors.background,
            }}
          >
            <View style={styles.piechart}>
              <View style={styles.piechartExplanation}>
                <Text variant={heading4} style={[{ color: sliceColor[0] }]}>
                  CogniQuiz: {series[0]} hours, {percentExercise} %{" "}
                </Text>
                <Text variant={heading4} style={[{ color: sliceColor[0] }]}>
                  Amount of CogniQuiz wins:
                </Text>
                <Text variant={heading4} style={[{ color: sliceColor[0] }]}>
                  CogniScore - CogniQuiz:
                </Text>
                <Divider />
                <Text variant={heading4} style={[{ color: sliceColor[1] }]}>
                  CogniCards: {series[1]} hours, {percentQuiz} %{" "}
                </Text>
                <Text variant={heading4} style={[{ color: sliceColor[1] }]}>
                  Amount of CogniCards wins:
                </Text>
                <Text variant={heading4} style={[{ color: sliceColor[1] }]}>
                  CogniScore - CogniCards:
                </Text>
                <Divider />
                <Text variant={heading4} style={[{ color: sliceColor[2] }]}>
                  Whiteboard: {series[2]} hours, {percentWhiteboard} %
                </Text>
              </View>
              <PieChart
                widthAndHeight={widthAndHeight}
                series={series}
                sliceColor={sliceColor}
              />
            </View>
          </Card.Content>
        </Card>
        <Divider />
        <Text variant={heading2}>{rainbowText("Global rank:")}</Text>
        <Text variant={heading2}>{rainbowText("Rank under friends:")}</Text>
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    //flex: 1,
    //justifyContent: 'center',
    //alignItems: 'center',
  },
  categoryStyle: {
    gap: 20,
    marginBottom: 20,
  },
  piechart: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    marginBottom: 20,
  },
  piechartExplanation: {
    flexDirection: "column",
    gap: 20,
  },
});
