import {
  useQuery,
  useUpsertMutation,
} from "@supabase-cache-helpers/postgrest-swr";
import React, {
  useCallback,
  useEffect,
  useMemo,
  useRef,
  useState,
} from "react";
import {
  SafeAreaView,
  StatusBar,
  View,
  StyleSheet,
  FlatList,
  ScrollView,
  TouchableOpacity,
  Alert,
} from "react-native";
import {
  Card,
  Chip,
  Dialog,
  Divider,
  Icon,
  PaperProvider,
  Portal,
  Text,
  useTheme,
} from "react-native-paper";
import { Searchbar, Button } from "react-native-paper";
import { supabase } from "../supabase";
import { mutate } from "swr";
import {
  useDistinctProjectGroups,
  useExercises,
  useFlashcards,
  useSets,
  useUpsertFlashcard,
  useUpsertSet,
  useUsername,
} from "../utils/hooks";
import { ManagementType } from "../types/common";
import { useAlerts } from "react-native-paper-fastalerts";
import { useAuth } from "../providers/AuthProvider";

//TODO realtime updating
export default function Discover() {
  const theme = useTheme();
  const { data: ownName, isLoading } = useUsername();
  const [selectedSemester, setSelectedSemester] = useState("All");
  const [searchQuery, setSearchQuery] = useState("");
  const [projectsData, setProjectsData] = useState(null);

  const { data, mutate } = useQuery(
    supabase.rpc("get_published_learning_projects_with_avg_rating"),
    {
      onSuccess(data, key, config) {
        console.log("Data feeetched successfully:", data.data);
      },
      onError(err, key, config) {
        errorAlert({
          message: err.message,
        });
      },
    },
  );

  //Recommender system functionality START

  const { user } = useAuth();

  const [recommendations, setRecommendations] = useState([]);
  const [globalTags, setGlobalTags] = useState([]);

  async function getUserGlobalTags() {
    let { data: profiles, error } = await supabase
      .from("profiles")
      .select("user_tags");
    let resultArray = profiles[0]["user_tags"].split(",");
    return resultArray;
  }

  async function getProjectTags() {
    let resultArray: (number | string)[][] = [];

    let { data: publicProjects, error } = await supabase.rpc("public_projects");

    for (let i = 0; i < publicProjects.length; i++) {
      let pArr = [];
      pArr.push(publicProjects[i]["tags"].split(","));
      pArr.push(publicProjects[i]["id"]);
      resultArray.push(pArr);
    }
    return resultArray;
  }

  async function recommendProjects(userTags, projectTags) {
    try {
      const recommendedProjects = projectTags.filter((project) => {
        const projectTagArray = project[0];
        return userTags.some((tag) => projectTagArray.includes(tag));
      });

      // Extract only the ids from the recommendedProjects array
      const recommendedIds = recommendedProjects.map((project) => project[1]);

      let recommendedIdsAndRatings = [];

      for (let i = 0; i < recommendedIds.length; i++) {
        let { data: avgrating, error } = await supabase.rpc(
          "avg_project_rating",
          {
            project_id_param: recommendedIds[i],
          },
        );
        //unrated projects are not taken into account
        if (avgrating != null) {
          recommendedIdsAndRatings.push([recommendedIds[i], avgrating]);
        }
      }
      const recommendations = recommendedIdsAndRatings.sort(
        (a, b) => b[1] - a[1],
      );

      return recommendations;
    } catch (error) {
      console.error("Error in recommending projects:", error.message);
      throw error;
    }
  }

  async function getPublished() {
    let { data: test, error } = await supabase.rpc(
      "get_published_learning_projects_with_avg_rating",
    );
    if (error) {
      console.error("Error fetching data:", error);
    } else {
      console.log("WIESO0OO NULL");
      console.log(test);
    }
  }

  useEffect(() => {
    const fetchData = async () => {
      try {
        const publishedProjects = await getPublished();
        setProjectsData(publishedProjects);
        const userTags = await getUserGlobalTags();
        setGlobalTags(userTags);
        const projectTags = await getProjectTags();
        const recommendations = await recommendProjects(userTags, projectTags);
        setRecommendations(recommendations);
      } catch (error) {
        console.error("Error in fetching data:", error.message);
      }
    };

    fetchData();
  }, []);

  //Recommender system functionality END

  const customSort = (a, b) => {
    const extractNumber = (str) => {
      const match = str.match(/\d+/);
      return match ? parseInt(match[0], 10) : NaN;
    };
    const numA = extractNumber(a);
    const numB = extractNumber(b);
    if (!isNaN(numA) && !isNaN(numB)) {
      return numB - numA;
    }
    if (!isNaN(numA) || !isNaN(numB)) {
      return isNaN(numA) ? -1 : 1;
    }
    return a.localeCompare(b);
  };

  const [allDistinctGroups, setAllDistinctGroups] = useState([]);

  useEffect(() => {
    console.log("Stiiiill active");
    const fetchDistinctGroups = async () => {
      try {
        const distinctGroups = await useDistinctProjectGroups();
        setAllDistinctGroups(distinctGroups.sort(customSort));
      } catch (error) {
        console.error("Error fetching distinct project groups:", error.message);
      }
    };
    fetchDistinctGroups();
  }, []);

  const [cardVisibility, setCardVisibility] = useState(
    Array(data?.length).fill(false),
  );

  const onChangeSearch = (query) => setSearchQuery(query);
  const [visible, setVisible] = useState(false);
  const hideDialog = () => setVisible(false);

  type ItemProps = { title: string };
  const Item = ({ title }: ItemProps) => (
    <View style={styles.item}>
      <Text style={styles.title}>{title}</Text>
    </View>
  );

  const { success, error: errorAlert, info, confirm } = useAlerts();
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

  interface SetType {
    created_at: string;
    id: number;
    name: string;
    project_id: number;
    type: number;
  }

  const save = async (project) => {
    try {
      const upsertedProject = await upsert([
        {
          name: project.name,
          description: project.description,
          group: project.group,
          is_published: project.is_published,
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

  if (!data) return null;

  const renderFooter = () => (
    <View style={{ flexDirection: "row" }}>
      <Divider />
      <Button mode="contained-tonal" icon="autorenew" labelStyle={{ fontSize: 18 }} onPress={() => {}}>
        Re-scramble{" "}
      </Button>
    </View>
  );

  return (
    <SafeAreaView>
      <Text
        style={{
          fontSize: 25,
          fontWeight: "bold",
          marginLeft: 10,
          color: theme.colors.primary,
        }}
      >
        Recommendations for 
      </Text>
      <Text
       style={{
        fontSize: 25,
        fontWeight: "bold",
        fontStyle: "italic",
        marginLeft: 10,
        marginBottom: 10,
        color: "rgb(132, 61, 163)",
      }}>
      "{ownName}"
      </Text>

      <Divider style={{marginBottom:10}}/>

      <FlatList
        data={data
          .filter(
            (project) =>
              recommendations.some(
                (recommendation) => recommendation[0] === project.project_id,
              ) &&
              (project.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
                project.description
                  .toLowerCase()
                  .includes(searchQuery.toLowerCase())),
          )
          .slice(0, 5)}
        renderItem={({ item, index }) => (
          <Card
            style={styles.card}
            key={index.toString()}
            onPress={() => {
              // Toggle visibility for the pressed card
              const updatedVisibility = [...cardVisibility];
              updatedVisibility[index] = !updatedVisibility[index];
              setCardVisibility(updatedVisibility);
            }}
          >
            <Card.Title title={item.name} titleVariant="titleLarge" />

            <Card.Content>
              {cardVisibility[index] && (
                <>
                  <View style={{ flexDirection: "row" }}>
                    <Text variant="bodyMedium">Description: </Text>
                    <Text variant="bodyMedium" style={{ fontWeight: "bold" }}>
                      {item.description}
                    </Text>
                  </View>

                  <View style={{ flexDirection: "row" }}>
                    <Text variant="bodyMedium">Owner: </Text>
                    <Text variant="bodyMedium" style={{ fontWeight: "bold" }}>
                      {item.username}
                    </Text>
                  </View>

                  <View style={{ flexDirection: "row" }}>
                    <Text variant="bodyMedium">Created in: </Text>
                    <Text variant="bodyMedium" style={{ fontWeight: "bold" }}>
                      {item.created_at.substring(0, 4)}
                    </Text>
                  </View>

                  <View style={{ flexDirection: "row" }}>
                    <Text variant="bodyMedium">Rating: </Text>
                    <Text variant="bodyMedium" style={{ fontWeight: "bold" }}>
                      {item.avg_rating.toFixed(2)}
                    </Text>
                    <Icon source="star" size={20} color="#ffb300" />
                  </View>

                  <Text variant="bodyMedium" style={{ fontStyle: "italic" }}>
                    Tags: {item.tags}
                  </Text>

                  <View style={styles.horizontalCardButtons}>
                    <Button
                      buttonColor={theme.colors.primary}
                      textColor="white"
                      onPress={() => {
                        save(item);
                      }}
                    >
                      Clone
                    </Button>
                  </View>
                </>
              )}
            </Card.Content>
          </Card>
        )}
        ListFooterComponent={renderFooter}
      />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {},
  item: {},
  title: {},
  card: {
    margin: 3,
    marginBottom: 10,
  },
  horizontalCardButtons: {
    flexDirection: "row",
    justifyContent: "flex-end",
  },
  flatList: {},
  semesterFilter: {},
});
