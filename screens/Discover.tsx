import { useQuery, useUpsertMutation } from "@supabase-cache-helpers/postgrest-swr";
import React, { useEffect, useState } from "react";
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
import { Dialog, PaperProvider, Portal, Text } from "react-native-paper";
import { Searchbar, Button } from "react-native-paper";
import { supabase } from "../supabase";
import { mutate } from "swr";
import { useDistinctProjectGroups } from "../utils/hooks";

//TODO realtime updating
export default function Discover() {
  const [selectedSemester, setSelectedSemester] = useState("All"); //Default semester
  const [searchQuery, setSearchQuery] = useState("");

  const { data , mutate } = useQuery(supabase.rpc("public_projects"), {
    onSuccess(data, key, config) {
      console.log("Data fetched successfully:", data.data);
    },
    onError(err, key, config) {
      errorAlert({
        message: err.message,
      });
    },
  });

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
          .select("id,link_url,title,subtitle,description,learning_project,created_at")
          .eq("learning_project", projectId)
          .order("created_at");
          return query;
        };

        const fetchFiles = async (filePath: string, limit?: number) => {
          try {
            const { data, error } = await supabase.storage.from('files').list(filePath, {
              limit: limit || 100,
              offset: 0,
            });
        
            if (error) {
              console.error('Error fetching files:', error.message);
              return null; // Return null or handle the error as needed
            }
        
            return data; // Return the list of files
          } catch (error) {
            console.error('Error in fetchFiles:', error.message);
            return null; // Return null or handle the error as needed
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
          console.log("Save");
          console.log(project.id);
          console.log(project.name);
        
          try {
            // Upsert the project and get the project_id
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
            console.log("Test 1: ", upsertedProject[0]?.id);
        
            // FLASHCARDS
            const flashcardSets = await fetchSets(ManagementType.FLASHCARD, project.id);
        
            // Check if flashcardSets.data is not null or undefined and it's an array
            if (flashcardSets && flashcardSets.data && Array.isArray(flashcardSets.data)) {
        
                flashcardSets.data.map(async (flashcardSet) => {
                  // Upsert Set
                  await supabase
                    .from("sets")
                    .upsert([
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
                          await supabase
                            .from("flashcards")
                            .upsert([
                              {
                                question: flashcard.question,
                                answer: flashcard.answer,
                                priority: flashcard.priority,
                                set_id: upsertedSetId,
                              },
                            ]);
                        })
                    }
                })
            }

            // EXERCISES
            const exerciseSets = await fetchSets(ManagementType.EXERCISE, project.id);

            // Check if exerciseSets.data is not null or undefined and it's an array
            if (exerciseSets && exerciseSets.data && Array.isArray(exerciseSets.data)) {
        
                exerciseSets.data.map(async (exerciseSet) => {
                  // Upsert Set
                  await supabase
                    .from("sets")
                    .upsert([
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
                          await supabase
                            .from("exercises")
                            .upsert([
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
                
                            console.log("Upserted Exercise Information:", upsertedExerciseInformation);
                
                          const upsertedExerciseId = upsertedExerciseInformation?.data.id;
                          console.log("Existing Exercise Id", exercise.id);
                          console.log("Upserted Exercise Id", upsertedExerciseId);

                      // Fetch answers for the existing exercise
                      const answers = await fetchAnswers(exercise.id);

                      if (answers && answers.data && Array.isArray(answers.data)) {
                        answers.data.map(async (answer) => {
                          await supabase
                          .from("answers_exercises")
                          .upsert([
                            {
                              order_position: answer.order_position,
                              answer: answer.answer,
                              is_correct: answer.is_correct,
                              exercise: upsertedExerciseId,
                            },
                          ]);
                        });
                      }
                        })
                    }
                })
            }
              // LINKS
              // Fetch links for the existing project
              const links = await fetchLinks(project.id);
  
              if (links && links.data && Array.isArray(links.data)) {
                links.data.map(async (link) => {
                    // Upsert Link
                    await supabase
                      .from("links")
                      .upsert([
                        {
                          link_url: link.link_url,
                          title: link.title,
                          subtitle: link.subtitle,
                          description: link.description,
                          learning_project: upsertedProjectId,
                        },
                      ]);
                  })
              }
              // TODO FILES
              // Fetch files for the existing project
              // documents
/*              const documents = await fetchFiles(`${project.id}/documents`);
              console.log("Documents: ", documents);
              try {
                // Use the copy method to clone files to the destination folder
                await Promise.all(
                  documents.map(async (file) => {
                    const sourcePath = `${project.id}/documents/${file.name}`;
                    const destinationPath = `${upsertedProjectId}/documents/${file.name}`;
            
                    await supabase.storage.from('files').copy(sourcePath, destinationPath);
                  })
                );
              } catch (error) {
                console.error(`Error copying files`, error.message);
                throw error;
              }

        
            success({
              message: "The Project has been cloned.",
            }); */
          } catch (error) {
            errorAlert({
              message: "There was an error trying to clone the project.",
            });
            console.error("Save error:", error.message);
          }
        }; 
        
  


  const CourseDialog = () => {
    const [visible, setVisible] = useState(false);

    const showDialog = () => setVisible(true);

    const hideDialog = () => setVisible(false);

    return (
      <PaperProvider>
        <View>
          <Button onPress={showDialog}>Show Dialog</Button>
          <Portal>
            <Dialog visible={visible} onDismiss={hideDialog}>
              <Dialog.Title>Alert</Dialog.Title>
              <Dialog.Content>
                <Text variant="bodyMedium">This is simple dialog</Text>
              </Dialog.Content>
              <Dialog.Actions>
                <Button onPress={hideDialog}>Done</Button>
              </Dialog.Actions>
            </Dialog>
          </Portal>
        </View>
      </PaperProvider>
    );
  };
if (!data) return null

  return (
    <SafeAreaView style={styles.container}>
      <Searchbar
        style={styles.searchbar}
        placeholder="Search"
        onChangeText={onChangeSearch}
        value={searchQuery}
      />
      <View>
        <ScrollView
          horizontal={true}
          showsHorizontalScrollIndicator={false}
          pagingEnabled={true}
        >
          <Button
            style={styles.WI23}
            mode="outlined"
            onPress={() => {
              setSelectedSemester("Winter 2023/24");
              mutate();
              console.log("WI23-Button-Pressed");
            }}
          >
            WI 23/24
          </Button>
          <Text> </Text>
          <Button
            style={styles.WI23}
            mode="outlined"
            onPress={() => {
              setSelectedSemester("Summer 2023");
              mutate();
              console.log("*TODO*");
            }}
          >
            SO 23
          </Button>
          <Text> </Text>
          <Button
            style={styles.WI23}
            mode="outlined"
            onPress={() => {
              setSelectedSemester("Winter 2022/23");
              mutate();
            }}
          >
            WI 22/23
          </Button>
          <Text> </Text>
          <Button
            style={styles.WI23}
            mode="outlined"
            onPress={() => {
              setSelectedSemester("All");
              mutate();
            }}
          >
            All
          </Button>
        </ScrollView>
      </View>
      <FlatList
        /*TODO : ADDING DIALOG */
        style={styles.flatList}
        data={data.filter(project=>project.group===selectedSemester)}
        renderItem={({ item, index }) => (
          <TouchableOpacity
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
                  <Text variant="bodyMedium">{item.description}</Text>
                  <Text variant="bodyMedium">{item.group}</Text>
                  <View style={styles.horizontalCardButtons}>
                    <Button
                      buttonColor={theme.colors.primary}
                      textColor="white"
                      onPress={() => {
                        console.log("Clone pressed");
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
        //keyExtractor={(item) => item.id}
      />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: StatusBar.currentHeight || 5,
  },
  item: {
    backgroundColor: "#C6D1DD",
    padding: 10,
    marginVertical: 4,
    marginHorizontal: 10,
  },
  title: {
    fontSize: 32,
  },
  flatList: {},
  searchbar: {
    marginBottom: 5,
  },
  WI23: {
    height: 40,
    backgroundColor: "white",
  },
});
