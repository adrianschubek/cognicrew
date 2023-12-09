import React, { useEffect, useState } from "react";
import { View, StyleSheet, ScrollView } from "react-native";
import { Divider, Text } from "react-native-paper";
import { SafeAreaView } from "react-native-safe-area-context";

import PieChart from "react-native-pie-chart";
import { supabase } from "../supabase";
import { useAuth } from "../providers/AuthProvider";

export default function GlobalStatistics() {
  //Pie chart variables
  const widthAndHeight = 100;

  const series = [10, 20, 17]; //hours spent
  const sliceColor = ["#fbd203", "#ffb300", "#ff9100"]; //colors

  const heading2 = "titleLarge";
  const heading3 = "titleMedium";
  const heading4 = "labelLarge";
  //Calculaions of pie chart statistics
  let sumTimeGames = series.reduce(
    (accumulator, currentValue) => accumulator + currentValue,
    0,
  );
  let percentExercise = ((series[0] / sumTimeGames) * 100).toFixed(2);
  let percentQuiz = ((series[1] / sumTimeGames) * 100).toFixed(2);
  let percentWhiteboard = ((series[2] / sumTimeGames) * 100).toFixed(2);

  const [countExercises, setCountExercises] = useState(null);
  const [countFlashcards, setCountFlashcards] = useState(null);
  const [countLinks, setCountLinks] = useState(null);
  const [countDocuments, setCountDocuments] = useState(null);
  const [countPhotos, setCountPhotos] = useState(null);

  const { user } = useAuth();

  async function calcCountExercises() {
    const { count, error } = await supabase
      .from("exercises")
      .select("*", { count: "exact", head: true });
    setCountExercises(count);
  }

  async function calcCountFlashcards() {
    const { count, error } = await supabase
      .from("flashcards")
      .select("*", { count: "exact", head: true });
    setCountFlashcards(count);
  }

  async function calcCountLinks() {
    const { count, error } = await supabase
      .from("links")
      .select("*", { count: "exact", head: true });
    setCountLinks(count);
  }

  async function calcCountFiles(folderName) {
    let { data, error } = await supabase
      .from("user_learning_projects")
      .select()
      .eq("user_id", user.id);

    let projectIdArr = [];
    let fileCount = 0;

    for (let i = 0; i < data.length; i++) {
      projectIdArr.push(data[i].learning_project_id);
      try {
        if (folderName == "documents") {
          let { data, error } = await supabase.storage
            .from("files")
            .list(`${projectIdArr[i]}/documents`);
  
          if (error) {
            throw error;
          }
          fileCount += data.length;
        } else {
          let { data, error } = await supabase.storage
            .from("files")
            .list(`${projectIdArr[i]}/photos`);
          if (error) {
            throw error;
          }
          fileCount += data.length;
        }
      } catch (error) {
        console.error("Error counting files", error.message);
      }

    }
    return fileCount;

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
    <SafeAreaView>
      <ScrollView style={styles.container}>
        <Text variant={heading2} style={{ marginBottom: 20 }}>
          Global Statistics
        </Text>
        <Divider />
        <Text variant={heading3} style={{ marginBottom: 20 }}>
          Total amount of learning projects:
        </Text>
        <Text variant={heading3} style={{ marginBottom: 20 }}>
          Total time spent on this app:{" "}
        </Text>
        <Text variant={heading2} style={[{ marginBottom: 20, marginTop: 30 }]}>
          Files statistics
        </Text>
        <Divider />
        <View style={{ gap: 20, marginBottom: 30 }}>
          <Text variant={heading3}>
            Total amount of exercises: {countExercises}
          </Text>
          <Text variant={heading3}>
            Total amount of flashcards: {countFlashcards}
          </Text>
          <Text variant={heading3}>Total amount of links: {countLinks}</Text>
          <Text variant={heading3}>
            Total amount of documents: {countDocuments}
          </Text>
          <Text variant={heading3}>Total amount of photos: {countPhotos}</Text>
        </View>
        <Text variant={heading2} style={[{ marginBottom: 20 }]}>
          Game statistics
        </Text>
        <Divider />
        <View style={{ gap: 20, marginBottom: 20 }}>
          <Text variant={heading3}>Time spent in learning games:</Text>
        </View>
        <View style={styles.piechart}>
          <PieChart
            widthAndHeight={widthAndHeight}
            series={series}
            sliceColor={sliceColor}
          />
          <View style={styles.piechartExplanation}>
            <Text variant={heading4} style={[{ color: sliceColor[0] }]}>
              Exercises: {series[0]} hours, {percentExercise} %{" "}
            </Text>
            <Text variant={heading4} style={[{ color: sliceColor[1] }]}>
              Flashcards: {series[1]} hours, {percentQuiz} %{" "}
            </Text>
            <Text variant={heading4} style={[{ color: sliceColor[2] }]}>
              Whiteboard: {series[2]} hours, {percentWhiteboard} %
            </Text>
          </View>
        </View>
        <Divider />
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    //flex: 1,
    //justifyContent: 'center',
    //alignItems: 'center',
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
