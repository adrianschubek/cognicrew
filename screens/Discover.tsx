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
import {
  Card,
  Chip,
  Dialog,
  PaperProvider,
  Portal,
  Text,
  useTheme,
} from "react-native-paper";
import { Searchbar, Button } from "react-native-paper";
import { supabase } from "../supabase";
import { mutate } from "swr";
import { useAlerts, useDistinctProjectGroups, useExercises, useFlashcards, useSets, useUpsertFlashcard, useUpsertSet } from "../utils/hooks";
import { ManagementType } from "../types/common";

export default function Discover() {
  const theme = useTheme();
  const [selectedSemester, setSelectedSemester] = useState("All"); //Default semester
  const [searchQuery, setSearchQuery] = useState("");

  const { data, mutate } = useQuery(supabase.rpc("public_projects"), {
    onSuccess(data, key, config) {
      console.log("Data fetched successfully:", data.data);
    },
    onError(err, key, config) {
      errorAlert({
        message: err.message,
      });
    },
  });

  const customSort = (a, b) => {
    const extractNumber = (str) => {
      const match = str.match(/\d+/); // Extracts the number part
      return match ? parseInt(match[0], 10) : NaN;
    };
    const numA = extractNumber(a);
    const numB = extractNumber(b);
  
    // If both are numbers, compare them in descending order
    if (!isNaN(numA) && !isNaN(numB)) {
      return numB - numA;
    }
    // If only one is a number prioritize non-number strings
    if (!isNaN(numA) || !isNaN(numB)) {
      return isNaN(numA) ? -1 : 1;
    }
    // If neither is a number, compare them as strings
    return a.localeCompare(b);
  };

  //TODO Handle "All" group properly (currently only showing projects with group "All")
  // State for distinct project groups
  const [allDistinctGroups, setAllDistinctGroups] = useState([]);

  // Fetch distinct project groups and update the state
  useEffect(() => {
      const fetchDistinctGroups = async () => {
        try {
          const distinctGroups = await useDistinctProjectGroups();
          setAllDistinctGroups(distinctGroups.sort(customSort));
        } catch (error) {
          console.error('Error fetching distinct project groups:', error.message);
        }
      };
      fetchDistinctGroups();
  }, []);

  // Add state to manage visibility for each card
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
  
  const { trigger: upsertSet } = useUpsertSet();
  const { trigger: upsertFlashcard } = useUpsertFlashcard();
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
  
      // Fetch flashcard sets for the existing project
      const { data: flashcardSets } = useSets(ManagementType.FLASHCARD, project.id);
  
      // Map over each flashcard set
      if (flashcardSets) {
        // Use Promise.all to wait for all upsertSet calls to complete
        await Promise.all(
          flashcardSets.map(async (flashcardSet) => {
            // TODO Upsert Set
            const upsertedSetArray = await upsertSet({
              //@ts-expect-error
              name: flashcardSet.title,
              type: flashcardSet.type,
              //TODO get upserted project id
              project_id: upsertedProjectId,
            });
            console.log(flashcardSet.name);
  
            // Get set id
            const upsertedSet = upsertedSetArray?.[0];
            const upsertedSetId = upsertedSet?.id;
            console.log("Test 2: ", upsertedSetId);
  
            // Fetch exercise for the existing set
            const { data: flashcards } = useFlashcards(flashcardSet.id);
  
            if (flashcards) {
              await Promise.all(
                flashcards.map(async (flashcard) => {
                  //TODO upsert Flashcard
                  await upsertFlashcard({
                    //@ts-expect-error
                    question: flashcard.question,
                    answer: flashcard.answer,
                    priority: flashcard.priority,
                    //TODO get upserted set id
                    set_id: upsertedSetId,
                  });
                })
              );
            }
          })
        );
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

  return (
    <SafeAreaView style={styles.container}>
      <View>
        <ScrollView
          horizontal={true}
          showsHorizontalScrollIndicator={false}
          pagingEnabled={true}
        >
          {allDistinctGroups &&
            allDistinctGroups.map((semester, index) => (
              <Button
                key={index.toString()}
                style={styles.semesterFilter}
                mode="outlined"
                onPress={() => {
                  setSelectedSemester(semester);
                  mutate();
                  console.log(`${semester}-Button-Pressed`);
                }}
              >
                {semester}
              </Button>
            ))}
        </ScrollView>
      </View>
      <Searchbar
        style={styles.searchbar}
        placeholder="Search"
        onChangeText={onChangeSearch}
        value={searchQuery}
      />

      <FlatList
        /*TODO : ADDING DIALOG */
        style={styles.flatList}
        data={data.filter(
          (project) =>
            project.group === selectedSemester &&
            (project.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
              project.description
                .toLowerCase()
                .includes(searchQuery.toLowerCase())),
        )}
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
                  <Text variant="bodyMedium">{item.description}</Text>
                  <Text variant="bodyMedium">{item.group}</Text>
                  <View style={styles.horizontalCardButtons}>
                    <Button
                      buttonColor={theme.colors.primary}
                      textColor="white"
                      onPress={() => {
                        console.log("Clone pressed");
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
        //keyExtractor={(item) => item.id}
      />
    </SafeAreaView>
  );
}
function errorAlert(arg0: { message: string }) {
  throw new Error("Function not implemented.");
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 15,
  },
  item: {
    padding: 10,
    marginVertical: 4,
    marginHorizontal: 10,
  },
  title: {
    fontSize: 30,
  },
  card: {
    margin: 3,
  },
  horizontalCardButtons: {
    flexDirection: "row",
    justifyContent: "flex-end",
  },
  flatList: {},
  searchbar: {
    marginBottom: 5,
  },
  semesterFilter: {
    marginBottom: 5,
    marginRight: 5,
  },
});
