import {
  useQuery,
  useUpsertMutation,
} from "@supabase-cache-helpers/postgrest-swr";
import React, { useState } from "react";
import { SafeAreaView, View, FlatList } from "react-native";
import { Divider, HelperText, useTheme } from "react-native-paper";
import { Searchbar } from "react-native-paper";
import { supabase } from "../supabase";
import { ManagementType } from "../types/common";
import { useAlerts } from "react-native-paper-fastalerts";
import ProjectCard from "../components/learningProjects/ProjectCard";

//TODO realtime updating
export default function SearchProjects() {

  const [searchQuery, setSearchQuery] = useState([""]);
  const [searchQueryDisplay, setSearchQueryDisplay] = useState("");

  const { data } = useQuery(
    supabase.rpc("get_published_learning_projects_with_avg_rating"),
    {
      onSuccess(data) {
        //console.log("Data fetched successfully:", data.data);
      },
      onError(err) {
        errorAlert({
          message: err.message,
        });
      },
    },
  );

  // Add state to manage visibility for each card
  const [cardVisibility, setCardVisibility] = useState(
    Array(data?.length).fill(false),
  );

  const onChangeSearch = (query) => {
    const tokens = query.split(",");
    setSearchQueryDisplay(query);
    setSearchQuery(tokens);
  };

  const { success, error: errorAlert } = useAlerts();
  const { trigger: upsert } = useUpsertMutation(
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
        return null; // Return null or handle the error as needed
      }

      return data; // Return the list of files
    } catch (error) {
      console.error("Error in fetchFiles:", error.message);
      return null; // Return null or handle the error as needed
    }
  };

  const save = async (project, newProjectName) => {
    try {
      const projectName = newProjectName ? newProjectName : project.name;
      // Upsert the project and get the project_id
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
      console.log("Test 1: ", upsertedProject[0]?.id);

      // FLASHCARDS
      const flashcardSets = await fetchSets(
        ManagementType.FLASHCARD,
        project.id,
      );

      // Check if flashcardSets.data is not null or undefined and it's an array
      if (
        flashcardSets &&
        flashcardSets.data &&
        Array.isArray(flashcardSets.data)
      ) {
        flashcardSets.data.map(async (flashcardSet) => {
          // Upsert Set
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

          console.log("Upserted Set Information:", upsertedSetInformation);

          // Check if data is not null before accessing it
          const upsertedSetData = upsertedSetInformation.data;

          console.log("Upserted Set Data :", upsertedSetData);
          console.log("Upserted Set Id:", upsertedSetData.id);

          const upsertedSetId = upsertedSetData.id;
          console.log("Test 2: ", upsertedSetId);

          // Fetch exercise for the existing set
          const flashcards = await fetchFlashcards(flashcardSet.id);

          if (flashcards && flashcards.data && Array.isArray(flashcards.data)) {
            flashcards.data.map(async (flashcard) => {
              // Upsert Flashcard
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

      // Check if exerciseSets.data is not null or undefined and it's an array
      if (
        exerciseSets &&
        exerciseSets.data &&
        Array.isArray(exerciseSets.data)
      ) {
        exerciseSets.data.map(async (exerciseSet) => {
          // Upsert Set
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

          console.log("Upserted Set Information:", upsertedSetInformation);

          const upsertedSetData = upsertedSetInformation.data;

          console.log("Upserted Set Data :", upsertedSetData);
          console.log("Upserted Set Id:", upsertedSetData.id);

          const upsertedSetId = upsertedSetData.id;
          console.log("Test 2: ", upsertedSetId);

          // Fetch exercise for the existing set
          const exercises = await fetchExercises(exerciseSet.id);
          console.log("Fetched Exercises");

          if (exercises && exercises.data && Array.isArray(exercises.data)) {
            exercises.data.map(async (exercise) => {
              // Upsert Exercise
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

              console.log(
                "Upserted Exercise Information:",
                upsertedExerciseInformation,
              );

              const upsertedExerciseId = upsertedExerciseInformation?.data.id;
              console.log("Existing Exercise Id", exercise.id);
              console.log("Upserted Exercise Id", upsertedExerciseId);

              // Fetch answers for the existing exercise
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
      // LINKS
      // Fetch links for the existing project
      const links = await fetchLinks(project.id);

      if (links && links.data && Array.isArray(links.data)) {
        links.data.map(async (link) => {
          // Upsert Link
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

  if (!data) return null;
  const renderHeader = () => {
    return (
      <>
        <View>
          <Searchbar
            style={{
              marginHorizontal: 10,
              marginTop: 10,
              marginBottom: 5,
              elevation: 0,
              borderRadius: 10,
            }}
            placeholder="Search"
            onChangeText={(text) => {
              onChangeSearch(text);
            }}
            value={searchQueryDisplay}
          />

          <HelperText type="info" style={{ marginHorizontal: 10 }}>
            Search for title and tags separated by commas in all learning
            projects
          </HelperText>
        </View>
        <Divider style={{ marginBottom: 10, marginTop: 10 }} />
      </>
    );
  };

  return (
    <SafeAreaView style={{ flex: 1, marginTop: 15 }}>
      {renderHeader()}
      <FlatList
        data={data.filter((project) =>
          searchQuery.some(
            (query) =>
              project.name.toLowerCase().includes(query.toLowerCase()) ||
              project.tags
                .split(",")
                .map((tag) => tag.trim())
                .some((tag) =>
                  tag.toLowerCase().includes(query.toLowerCase()),
                ) ||
              project.description.toLowerCase().includes(query.toLowerCase()),
          ),
        )}
        renderItem={({ item }) => {
          return <ProjectCard item={item} save={save} />;
        }}
      />
    </SafeAreaView>
  );
}
