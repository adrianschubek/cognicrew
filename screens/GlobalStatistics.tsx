import React, { useEffect, useState } from "react";
import { View, StyleSheet, ScrollView } from "react-native";
import { Divider, Text } from "react-native-paper";
import { SafeAreaView } from "react-native-safe-area-context";
import { StatusBar } from "expo-status-bar";
import { supabase } from "../supabase";
import { useAuth } from "../providers/AuthProvider";
import StatisticCategory from "../components/profile/StatisticCategory";

export default function GlobalStatistics() {
  //Pie chart variables
  const widthAndHeight = 100;

  const series = [10, 20, 17]; //hours spent
  const sliceColor = ["#fbd203", "#ffb300", "#ff9100"]; //colors
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

  const [countLearningProjects, setCountLearningProjects] = useState(null);

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

  async function calcCountLearningProjects() {
    const { count, error } = await supabase
      .from("user_learning_projects")
      .select("*", { count: "exact", head: true })
      .eq("user_id",user.id);
    setCountLearningProjects(count);
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
        calcCountLearningProjects();
      } catch (error) {
        console.error("Error in fetching data:", error.message);
      }
    };
    fetchData();
  }, []);
  const statistics = [
    {
      title: "Global statistics",
      dataPointCategories: [
        {
          dataPoints: [
            `Total amount of learning projects: ${countLearningProjects}`,
            `Total time spent on this app:`,
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
          textColor: sliceColor[0],
        },
        {
          dataPoints: [`Flashcards: ${series[1]} hours, ${percentQuiz} %`],
          textColor: sliceColor[1],
        },

        {
          dataPoints: [
            `Whiteboard: ${series[2]} hours, ${percentWhiteboard} %`,
          ],
          textColor: sliceColor[2],
        },
      ],
      pieChart: {
        widthAndHeight: widthAndHeight,
        series: series,
        sliceColor: sliceColor,
      },
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
              titleVariant="headlineSmall"
              textVariant="bodyLarge"
              data={{
                title: item.title,
                dataPointCategories: item.dataPointCategories,
              }}
              pieChart={item.pieChart}
            ></StatisticCategory>
          );
        })}
        <Divider />
      </ScrollView>
    </SafeAreaView>
  );
}
