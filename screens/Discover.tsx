import {
  useQuery,
  useUpsertMutation,
} from "@supabase-cache-helpers/postgrest-swr";
import React, { useEffect, useState } from "react";
import { FlatList, SafeAreaView, View } from "react-native";
import { Divider, Text, useTheme } from "react-native-paper";
import { Button } from "react-native-paper";
import { supabase } from "../supabase";
import { useUsername } from "../utils/hooks";
import { ManagementType } from "../types/common";
import { useAlerts } from "react-native-paper-fastalerts";
import ProjectCard from "../components/learningProjects/ProjectCard";
import { useAuth } from "../providers/AuthProvider";

import { useRecommendations } from "../utils/hooks";

export default function Discover() {
  const theme = useTheme();
  const { data: ownName } = useUsername();

  const { user } = useAuth();

  //Recommendation system

  const [recommendations, setRecommendations] = useState(null);

  const { data, error, isLoading, mutate } = useRecommendations(user.id);

  useEffect(() => {
    if (!data || isLoading) return;
    setRecommendations(data);
  }, [data]);

  useEffect(() => {
    mutate();
  }, []);

  //CLONING START

  const { success, error: errorAlert } = useAlerts();
  const { isMutating, trigger: upsert } = useUpsertMutation(
    supabase.from("learning_projects"),
    ["id"],
    "id,name,description,group,is_published,tags",
    {
      onSuccess: () => {
        success({
          message: "The Project has been cloned.",
        });
      },
      onError: (error) => {
        errorAlert({
          message: "There was an error trying to clone the project.",
        });
      },
    },
  );

  const fetchSets = async (type: ManagementType, projectId: number) => {
    const query = supabase
      .from("sets")
      .select("id,name,type,project_id,created_at")
      .eq("type", type)
      .eq("project_id", projectId);
    return query;
  };

  const fetchFlashcards = async (setId: number) => {
    const query = supabase
      .from("flashcards")
      .select("id,question,answer,priority,set_id,created_at")
      .eq("set_id", setId)
      .order("created_at");
    return query;
  };

  const fetchExercises = async (setId: number) => {
    const query = supabase
      .from("exercises")
      .select("id,question,priority,set_id,created_at")
      .eq("set_id", setId)
      .order("created_at");
    return query;
  };

  const fetchAnswers = async (exerciseId: number) => {
    const query = supabase
      .from("answers_exercises")
      .select("exercise,order_position,answer,is_correct,created_at")
      .eq("exercise", exerciseId)
      .order("created_at");
    return query;
  };

  const fetchLinks = async (projectId: number) => {
    const query = supabase
      .from("links")
      .select(
        "id,link_url,title,subtitle,description,learning_project,created_at",
      )
      .eq("learning_project", projectId)
      .order("created_at");
    return query;
  };

  const fetchFiles = async (filePath: string, limit?: number) => {
    try {
      const { data, error } = await supabase.storage
        .from("files")
        .list(filePath, {
          limit: limit || 100,
          offset: 0,
        });

      if (error) {
        console.error("Error fetching files:", error.message);
        return null;
      }

      return data;
    } catch (error) {
      console.error("Error in fetchFiles:", error.message);
      return null;
    }
  };

  const save = async (project, newProjectName) => {
    try {
      const projectName = newProjectName ? newProjectName : project.name;
      const upsertedProject = await upsert([
        {
          name: projectName,
          description: project.description,
          group: "All",
          is_published: false,
          tags: project.tags,
        },
      ]);

      const upsertedProjectId = upsertedProject[0]?.id;

      // FLASHCARDS
      const flashcardSets = await fetchSets(
        ManagementType.FLASHCARD,
        project.id,
      );

      if (
        flashcardSets &&
        flashcardSets.data &&
        Array.isArray(flashcardSets.data)
      ) {
        flashcardSets.data.map(async (flashcardSet) => {
          await supabase.from("sets").upsert([
            {
              name: flashcardSet.name,
              type: flashcardSet.type,
              project_id: upsertedProjectId,
            },
          ]);

          const upsertedSetInformation = await supabase
            .from("sets")
            .select("*")
            .eq("name", flashcardSet.name)
            .eq("type", flashcardSet.type)
            .eq("project_id", upsertedProjectId)
            .single();

          const upsertedSetData = upsertedSetInformation.data;
          const upsertedSetId = upsertedSetData.id;

          const flashcards = await fetchFlashcards(flashcardSet.id);

          if (flashcards && flashcards.data && Array.isArray(flashcards.data)) {
            flashcards.data.map(async (flashcard) => {
              await supabase.from("flashcards").upsert([
                {
                  question: flashcard.question,
                  answer: flashcard.answer,
                  priority: flashcard.priority,
                  set_id: upsertedSetId,
                },
              ]);
            });
          }
        });
      }

      // EXERCISES
      const exerciseSets = await fetchSets(ManagementType.EXERCISE, project.id);

      if (
        exerciseSets &&
        exerciseSets.data &&
        Array.isArray(exerciseSets.data)
      ) {
        exerciseSets.data.map(async (exerciseSet) => {
          await supabase.from("sets").upsert([
            {
              name: exerciseSet.name,
              type: exerciseSet.type,
              project_id: upsertedProjectId,
            },
          ]);

          const upsertedSetInformation = await supabase
            .from("sets")
            .select("*")
            .eq("name", exerciseSet.name)
            .eq("type", exerciseSet.type)
            .eq("project_id", upsertedProjectId)
            .single();

          const upsertedSetData = upsertedSetInformation.data;
          const upsertedSetId = upsertedSetData.id;
          const exercises = await fetchExercises(exerciseSet.id);

          if (exercises && exercises.data && Array.isArray(exercises.data)) {
            exercises.data.map(async (exercise) => {
              await supabase.from("exercises").upsert([
                {
                  question: exercise.question,
                  priority: exercise.priority,
                  set_id: upsertedSetId,
                },
              ]);

              const upsertedExerciseInformation = await supabase
                .from("exercises")
                .select("*")
                .eq("question", exercise.question)
                .eq("priority", exercise.priority)
                .eq("set_id", upsertedSetId)
                .single();

              const upsertedExerciseId = upsertedExerciseInformation?.data.id;
              const answers = await fetchAnswers(exercise.id);

              if (answers && answers.data && Array.isArray(answers.data)) {
                answers.data.map(async (answer) => {
                  await supabase.from("answers_exercises").upsert([
                    {
                      order_position: answer.order_position,
                      answer: answer.answer,
                      is_correct: answer.is_correct,
                      exercise: upsertedExerciseId,
                    },
                  ]);
                });
              }
            });
          }
        });
      }

      const links = await fetchLinks(project.id);

      if (links && links.data && Array.isArray(links.data)) {
        links.data.map(async (link) => {
          await supabase.from("links").upsert([
            {
              link_url: link.link_url,
              title: link.title,
              subtitle: link.subtitle,
              description: link.description,
              learning_project: upsertedProjectId,
            },
          ]);
        });
      }

      // Fetch files (documents and photos) for the existing project
      const documents = await fetchFiles(`${project.id}/documents`);
      const photos = await fetchFiles(`${project.id}/photos`);
      try {
        // Use the copy method to clone files to the destination folder
        documents.map(async (file) => {
          await supabase.storage
            .from("files")
            .copy(
              `${project.id}/documents/${file.name}`,
              `${upsertedProjectId}/documents/${file.name}`,
            );
        });

        photos.map(async (file) => {
          await supabase.storage
            .from("files")
            .copy(
              `${project.id}/photos/${file.name}`,
              `${upsertedProjectId}/photos/${file.name}`,
            );
        });
      } catch (error) {
        console.error("Error copying files: ", error.message);
        throw error;
      }

      success({
        message: "The Project has been cloned.",
      });
    } catch (error) {
      errorAlert({
        message: "There was an error trying to clone the project.",
      });
      console.error("Save error:", error.message);
    }
  };

  //CLONING END

  //Render footer and header of the projects FlatList

  function reScramble() {
    mutate();
  }

  const renderHeader = () => {
    return (
      <View>
        <Text
          style={{
            fontSize: 25,
            fontWeight: "bold",
            marginLeft: 10,
            margin: 10,
            color: theme.colors.primary,
          }}
        >
          Recommendations
        </Text>
      </View>
    );
  };

  const renderFooter = () => (
    <View style={{ flexDirection: "row", marginBottom: 10 }}>
      <Divider />
      <Button
        mode="contained-tonal"
        icon="autorenew"
        labelStyle={{ fontSize: 18 }}
        onPress={reScramble}
      >
        Re-scramble
      </Button>
    </View>
  );

  if (!data) return null;

  return (
    <SafeAreaView>
      <FlatList
        data={recommendations}
        renderItem={({ item }) => {
          return <ProjectCard item={item} save={save} />;
        }}
        ListHeaderComponent={renderHeader}
        ListFooterComponent={renderFooter}
      />
    </SafeAreaView>
  );
}
