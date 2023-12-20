import {
  useQuery,
  useUpsertMutation,
} from "@supabase-cache-helpers/postgrest-swr";
import React, { useEffect, useState } from "react";
import { SafeAreaView, View, FlatList } from "react-native";
import {
  Card,
  Divider,
  Icon,
  Text,
  useTheme,
} from "react-native-paper";
import { Button } from "react-native-paper";
import { supabase } from "../supabase";
import { useUsername } from "../utils/hooks";
import { ManagementType } from "../types/common";
import { useAlerts } from "react-native-paper-fastalerts";

export default function Discover() {
  const theme = useTheme();
  const { data: ownName } = useUsername();
  const { confirm } = useAlerts();

  //Get all published learning projects and relevant data
  const [getData, setData] = useState(null);
  const { data } = useQuery(
    supabase.rpc("get_published_learning_projects_with_avg_rating"),
    {
      onSuccess(data) {
        console.log("Data fetched successfully:", data.data);
      },
      onError(err) {
        errorAlert({
          message: err.message,
        });
      },
    },
  );

  //Recommender system functionality START

  const [projectsUserIsIn, setUsersProjects] = useState([]);
  const [recommendations, setRecommendations] = useState([]);

  async function getUserGlobalTags() {
    let { data: profiles, error } = await supabase
      .from("profiles")
      .select("user_tags");
    let resultArray = profiles[0]["user_tags"].split(",");
    return resultArray;
  }

  async function getPublishedProjectTags() {
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

  async function getUserProjectTags() {
    let resultArray = [];

    let { data: usersProjects, error } = await supabase
      .from("learning_projects")
      .select("*");

    for (let i = 0; i < usersProjects.length; i++) {
      let tags = usersProjects[i]["tags"].split(",");
      if (tags.some((tag) => tag.trim() !== "")) {
        resultArray.push(tags);
      }
    }
    resultArray = resultArray.flat();

    return resultArray;
  }

  async function recommendProjects(
    ownGlobalTags,
    usersProjectTags,
    publishedProjectTags,
  ) {
    console.log(ownGlobalTags);
    console.log(usersProjectTags);
    console.log(publishedProjectTags);

    try {
      let recommendedProjects = publishedProjectTags.filter((project) => {
        const projectTagArray = project[0];
        return ownGlobalTags.some((tag) => projectTagArray.includes(tag));
      });

      recommendedProjects = recommendedProjects.concat(
        publishedProjectTags.filter((project) => {
          const userProjectTagArray = project[0];
          return usersProjectTags.some((tag) =>
            userProjectTagArray.includes(tag),
          );
        }),
      );

      console.log(recommendedProjects);

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
      return recommendedIdsAndRatings;
    } catch (error) {
      console.error("Error in recommending projects:", error.message);
      throw error;
    }
  }

  async function getUsersProjects() {
    let { data: user_learning_projects, error } = await supabase
      .from("user_learning_projects")
      .select("learning_project_id");

    return user_learning_projects;
  }

  useEffect(() => {
    const fetchData = async () => {
      try {
        const usersProjects = await getUsersProjects(); //get projects user is member of so they get excluded from being displayed
        setUsersProjects(usersProjects);

        const userTags = await getUserGlobalTags(); //get global, personal preference tags to match published projects tags
        const usersProjectTags = await getUserProjectTags(); //get project tags of projects the user is a member of to match published projects tags
        const publishedProjectTags = await getPublishedProjectTags(); //get published projects tags and ids of projects
        const recommendations = await recommendProjects(
          userTags,
          usersProjectTags,
          publishedProjectTags,
        ); //return the recommended projects
        setRecommendations(recommendations);
      } catch (error) {
        console.error("Error in fetching data:", error.message);
      }
    };

    fetchData();
  }, []);

  //Recommender system functionality END

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

  //Visibility and scramble functionss for display of the list

  const [cardVisibility, setCardVisibility] = useState(
    Array(data?.length).fill(false),
  );

  const toggleCardVisibility = (index) => {
    const updatedVisibility = [...cardVisibility];
    updatedVisibility[index] = !updatedVisibility[index];
    setCardVisibility(updatedVisibility);
  };

  function reScramble() {
    setData(
      data
        .filter(
          (project) =>
            recommendations.some(
              (recommendation) => recommendation[0] === project.project_id,
            ) &&
            !projectsUserIsIn.some(
              (projectObj) =>
                projectObj.learning_project_id === project.project_id,
            ),
        )
        .sort(() => Math.random() - 0.5)
        .slice(0, 5)
        .sort((a, b) => b["avg_rating"] - a["avg_rating"]),
    );
  }
  //Render footer and header of the projects FlatList

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
          Recommendations for you
        </Text>

        <Divider style={{ marginBottom: 10 }} />
      </View>
    );
  };

  const renderFooter = () => (
    <View style={{ flexDirection: "row" }}>
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
        data={
          getData ??
          data
            .filter(
              (project) =>
                recommendations.some(
                  (recommendation) => recommendation[0] === project.project_id,
                ) &&
                !projectsUserIsIn.some(
                  (projectObj) =>
                    projectObj.learning_project_id === project.project_id,
                ),
            )
            .slice(0, 5)
            .sort((a, b) => b["avg_rating"] - a["avg_rating"])
        }
        renderItem={({ item, index }) => {
          const stats = [
            { title: "Description", data: item.description },
            { title: "Owner", data: item.username },
            { title: "Created in", data: item.created_at.substring(0, 4) },
            {
              title: "Rating",
              data: item.avg_rating.toFixed(2) + " ",
              icon: <Icon source="star" size={20} color="#ffb300" />,
            },
          ];
          return (
            <Card
              style={{ margin: 3, marginBottom: 10 }}
              key={index.toString()}
              onPress={() => toggleCardVisibility(index)}
            >
              <Card.Title title={item.name} titleVariant="titleLarge" />

              <Card.Content style={{ gap: 5 }}>
                {cardVisibility[index] && (
                  <>
                    {stats.map((stat, index) => {
                      return (
                        <View style={{ flexDirection: "row" }} key={index}>
                          <Text variant="bodyMedium">{stat.title}: </Text>
                          <Text
                            variant="bodyMedium"
                            style={{ fontWeight: "bold" }}
                          >
                            {stat.data}
                          </Text>
                          {stat.icon && stat.icon}
                        </View>
                      );
                    })}
                    <Text variant="bodyMedium" style={{ fontStyle: "italic" }}>
                      Tags: {item.tags}
                    </Text>

                    <View
                      style={{
                        flexDirection: "row",
                        justifyContent: "flex-end",
                      }}
                    >
                      <Button
                        buttonColor={theme.colors.primary}
                        textColor={theme.colors.onPrimary}
                        onPress={() => {
                          confirm({
                            title: "Clone project",
                            icon: "content-copy",
                            okText: "Clone",
                            okAction: (vars) => {
                              save(item, vars[0]);
                            },
                            fields: [
                              {
                                label: "New project name",
                                type: "text",
                                required: true,
                                errorText:
                                  "Cannot clone this project without a new name",
                              },
                            ],
                          });
                        }}
                      >
                        Clone
                      </Button>
                    </View>
                  </>
                )}
              </Card.Content>
            </Card>
          );
        }}
        ListHeaderComponent={renderHeader}
        ListFooterComponent={renderFooter}
      />
    </SafeAreaView>
  );
}
