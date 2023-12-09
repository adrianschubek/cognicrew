import React, { useEffect, useState } from "react";
import { View, StyleSheet, ScrollView } from "react-native";
import { Divider, Text } from "react-native-paper";

import PieChart from "react-native-pie-chart";
import { useAuth } from "../../providers/AuthProvider";
import { useProjectStore } from "../../stores/ProjectStore";
import { supabase } from "../../supabase";

export default function ProjectStatistics() {

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
    let { data, error } = await supabase.from('exercises').select('*, sets(*, learning_projects(*))')
    if (error) {
      console.error('Error fetching data:', error);
    } else {
    const filteredArray = data.filter(item => item.sets.project_id === projectId);
    const count = filteredArray? filteredArray.length : 0;
    setCountExercises(count);
    }
  }

  async function calcCountFlashcards() {
    let { data, error } = await supabase.from('flashcards').select('*, sets(*, learning_projects(*))')
    if (error) {
      console.error('Error fetching data:', error);
    } else {
    const filteredArray = data.filter(item => item.sets.project_id === projectId);
    const count = filteredArray? filteredArray.length : 0;
    setCountFlashcards(count);
  }
  }

  async function calcCountLinks() {
    let { data, error } = await supabase.from('links').select('*')
    if (error) {
      console.error('Error fetching data:', error);
    } else {
    const filteredArray = data.filter(item => item.learning_project === projectId);
    const count = filteredArray? filteredArray.length : 0;
    setCountLinks(count);
  }
}

  async function calcCountFiles(folderName) {
    try {
      if(folderName == "documents") {
        let { data, error } = await supabase.storage.from("files").list(`${projectId}/documents`);
        if (error) {
          throw error;
        }
        const fileCount = data.length;
        return fileCount;
      } else {
        let { data, error } = await supabase.storage.from("files").list(`${projectId}/photos`);
        if (error) {
          throw error;
        }
        const fileCount = data.length;
        return fileCount;
      }
    } catch (error) {
      console.error('Error counting files', error.message);
    }
  }

  useEffect(() => {
  const fetchData = async () => {
    try{
    calcCountExercises();
    calcCountFlashcards();
    calcCountLinks();
    const documentsCount = await calcCountFiles('documents');
    const photosCount = await calcCountFiles('photos');
    setCountDocuments(documentsCount);
    setCountPhotos(photosCount);
    } catch (error) {
      console.error('Error in fetching data:', error.message);
    }
  };
  fetchData();
  }, []);

  return (
    <ScrollView style={styles.container}>
      <Text
        variant={heading}
        style={[{ marginBottom: 20, marginTop: 30, fontWeight: "bold" }]}
      >
        Files statistics
      </Text>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant={heading2}>CogniCards</Text>
        <Text variant={heading3}>Amount of flashcards: {countFlashcards}</Text>
      </View>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant={heading2}>CogniCises</Text>
        <Text variant={heading3}>Amount of exercises: {countExercises}</Text>
      </View>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant={heading2}>CogniLinks</Text>
        <Text variant={heading3}>Amount of links: {countLinks}</Text>
      </View>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant={heading2}>Cognifiles</Text>
        <Text variant={heading3}>Amount of files: {countDocuments}</Text>
        <Text variant={heading3}>Amount of photos: {countPhotos}</Text>
      </View>

      <Text
        variant={heading}
        style={[{ marginBottom: 20, marginTop: 30, fontWeight: "bold" }]}
      >
        Leaderboard
      </Text>
      <Divider />
      <View style={styles.categoryStyle}>
        <Text variant={heading2}>Relative time spent on each game:</Text>
        <View style={styles.piechart}>
          <PieChart
            widthAndHeight={widthAndHeight}
            series={series}
            sliceColor={sliceColor}
          />
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
        </View>

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
    alignItems: "center",
    marginBottom: 20,
  },
  piechartExplanation: {
    flexDirection: "column",
    marginLeft: 20,
    gap: 20,
  },
});
