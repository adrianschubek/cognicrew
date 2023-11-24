import { useUpsertMutation } from "@supabase-cache-helpers/postgrest-swr";
import React, { Fragment, useEffect, useMemo, useState } from "react";
import { Platform, ScrollView, TouchableOpacity } from "react-native";
import { MaterialIcons } from "@expo/vector-icons";
import { Button, Divider, FAB, Text, useTheme } from "react-native-paper";
import { StyleSheet, View, SafeAreaView } from "react-native";
import { supabase } from "../../supabase";
import {
  useAlerts,
  useDeleteProject,
  useProjectRating,
  useRemoveUserFromLearningProject,
  useSoundSystem1,
  useUpsertProjectRating,
  useUsername,
} from "../../utils/hooks";
import { Database } from "../../types/supabase";
import { useAuth } from "../../providers/AuthProvider";
import { HeaderBackButton } from "@react-navigation/elements";
import { useProjectStore } from "../../stores/ProjectStore";

export default function RateProject({
  navigation,
  route,
}: {
  navigation: any;
  route: {
    params: {
      edit: Database["public"]["Tables"]["learning_projects"]["Row"] | null;
    };
  };
}) {
  useSoundSystem1();

  const { edit: project } = route.params;

  const username = useUsername(project?.owner_id ?? null);
  const { success, error: errorAlert, info, confirm } = useAlerts();
  const theme = useTheme();

  const myid = useAuth().user.id;

  useEffect(() => {
    navigation.setOptions({
      title: "Rate Project",
    });
  }, []);

  useEffect(() => {
    navigation.setOptions({
      headerLeft: (props) => (
        <HeaderBackButton
          {...props}
          style={styles.fixHeaderStyles}
          onPress={() => {
            confirm({
              title: "Discard changes?",
              message:
                "All unsaved changes will be lost. Do you want to continue?",
              okText: "Continue",
              okAction: () => navigation.goBack(),
            });
          }}
        />
      ),
    });
  }, [navigation]);
  const { trigger: removeUserFromLearningProject } =
    useRemoveUserFromLearningProject();
  const { trigger: deleteProject } = useDeleteProject();
  const [title, setTitle] = useState(project?.name ?? "");
  const [description, setDescription] = useState(project?.description ?? "");
  const [group, setGroup] = useState(project?.group ?? "");
  const [isPublished, setIsPublished] = useState(
    project?.is_published ?? false,
  );
  const [owner, setOwner] = useState(username.data);
  const [tags, setTags] = useState(project?.tags ?? "");

  const { isMutating, trigger: upsert } = useUpsertMutation(
    supabase.from("learning_projects"),
    ["id"],
    "id,name,description,group,is_published,tags",
    {
      onSuccess: () => {
        success({
          title: `Saved`,
          message: "Thank you for rating this project!",
          okAction: () => navigation.goBack(),
        });
      },
      onError: (error) => {
        let err = "";
        switch (error.message) {
          case "E2":
            err = "X";
            break;
          case "E1":
            err = "X";
            break;
          default:
            err = error.message;
        }
        errorAlert({
          message: err,
        });
      },
    },
  );

  const save = () => {
    upsert({
      // @ts-expect-error
      id: project?.id,
      name: title,
      description,
      group,
      is_published: isPublished,
      tags,
    });
  };

  const renderStars = (numStars) => {
    const starsArray = Array.from({ length: 5 }, (_, index) => index + 1);

    return (
      <View style={{ marginLeft: 20 }}>
        <View style={{ flexDirection: "row" }}>
          {starsArray.map((star, index) => (
            <MaterialIcons
              key={index}
              name={index < numStars ? "star" : "star-border"}
              size={32}
              style={
                index < numStars ? styles.starSelected : styles.starUnselected
              }
            />
          ))}
          <Text style={[styles.heading2, { marginLeft: 20 }]}>
            {arrRatings && arrRatings[numStars-1]}
          </Text>
        </View>
      </View>
    );
  };

  const [starRating, setStarRating] = useState(null);

  const { trigger: upsertProjectRating } = useUpsertProjectRating();

  const { user } = useAuth();

  const projectId = useProjectStore((state) => state.projectId);

  const { data: ratings } = useProjectRating();

  const [sum, setSum] = useState(null);

  async function calulateSum() {
    let { data, error } = await supabase.rpc("sum_project_ratings");
    console.log("Count");
    console.log(data);

    if (data) {
      setSum(data);
    }

    if (error) console.error(error);
    else console.log(data);

    return data;
  }

  const [avg, setAvg] = useState(null);

  async function calulateAverage() {
    let { data, error } = await supabase.rpc("avg_project_rating");
    console.log("Avg");
    console.log(data);
    if (data) {
      setAvg(data);
    }
    if (error) console.error(error);
    else console.log(data);
  }

  const [arrRatings, setArrRatings] = useState(null);

  async function calculateIndividualRatings() {
    let { data, error } = await supabase.rpc("get_particular_amount_ratings");
    console.log("Partiular ratings:");
    console.log(data);
    const dataArray = Object.values(data);
    console.log(dataArray)
    if (dataArray) {
      setArrRatings(dataArray);
    }
    if (error) console.error(error);
    else console.log(data);
  }
  

  async function calulateStatistics() {
    calulateSum();
    calulateAverage();
    calculateIndividualRatings();
  }



  return (
    <ScrollView>
      <SafeAreaView style={styles.personalRating}>
        <View style={styles.container}>
          <Text style={styles.heading}>{"Tap to rate:"}</Text>
          <View style={styles.stars}>
            <TouchableOpacity
              onPress={() => {
                setStarRating(1);
                upsertProjectRating({
                  //@ts-expect-error
                  project_id: projectId,
                  user_id: user.id,
                  rating: 1,
                });
              }}
            >
              <MaterialIcons
                name={starRating >= 1 ? "star" : "star-border"}
                size={32}
                style={
                  starRating >= 1 ? styles.starSelected : styles.starUnselected
                }
              />
            </TouchableOpacity>
            <TouchableOpacity
              onPress={() => {
                setStarRating(2);
                upsertProjectRating({
                  //@ts-expect-error
                  project_id: projectId,
                  user_id: user.id,
                  rating: 2,
                });
              }}
            >
              <MaterialIcons
                name={starRating >= 2 ? "star" : "star-border"}
                size={32}
                style={
                  starRating >= 2 ? styles.starSelected : styles.starUnselected
                }
              />
            </TouchableOpacity>
            <TouchableOpacity
              onPress={() => {
                setStarRating(3);
                upsertProjectRating({
                  //@ts-expect-error
                  project_id: projectId,
                  user_id: user.id,
                  rating: 3,
                });
              }}
            >
              <MaterialIcons
                name={starRating >= 3 ? "star" : "star-border"}
                size={32}
                style={
                  starRating >= 3 ? styles.starSelected : styles.starUnselected
                }
              />
            </TouchableOpacity>
            <TouchableOpacity
              onPress={() => {
                setStarRating(4);
                upsertProjectRating({
                  //@ts-expect-error
                  project_id: projectId,
                  user_id: user.id,
                  rating: 4,
                });
              }}
            >
              <MaterialIcons
                name={starRating >= 4 ? "star" : "star-border"}
                size={32}
                style={
                  starRating >= 4 ? styles.starSelected : styles.starUnselected
                }
              />
            </TouchableOpacity>
            <TouchableOpacity
              onPress={() => {
                setStarRating(5);
                upsertProjectRating({
                  //@ts-expect-error
                  project_id: projectId,
                  user_id: user.id,
                  rating: 5,
                });
              }}
            >
              <MaterialIcons
                name={starRating >= 5 ? "star" : "star-border"}
                size={32}
                style={
                  starRating >= 5 ? styles.starSelected : styles.starUnselected
                }
              />
            </TouchableOpacity>
            <Text style={[styles.heading, { marginLeft: 10 }]}>
              {starRating
                ? `${starRating} ${starRating > 1 ? "stars" : "star"}`
                : "Unrated"}
            </Text>
          </View>
        </View>
      </SafeAreaView>

      <Divider />

      <View style={styles.container}>
        <Text style={styles.heading}>{"Statistics:"}</Text>

        <Button onPress={() => calulateStatistics()}>Show statistics</Button>

        <View style={styles.box}>
          <Text style={[styles.heading2, { marginLeft: 20 }]}>
            {"Total number of ratings:"}
          </Text>
          <Text style={[styles.heading2, { marginLeft: 20, color: "red" }]}>
              {sum}
          </Text>
          <Text style={[styles.heading2, { marginLeft: 20 }]}>
            {"Project's average rating:"}
          </Text>
          <View style={{ marginLeft: 20 }}>
            <View style={styles.stars}>
              <MaterialIcons
                name={avg >= 1 ? "star" : "star-border"}
                size={32}
                style={avg >= 1 ? styles.starSelected : styles.starUnselected}
              />
              <MaterialIcons
                name={avg >= 2 ? "star" : "star-border"}
                size={32}
                style={avg >= 2 ? styles.starSelected : styles.starUnselected}
              />

              <MaterialIcons
                name={avg >= 3 ? "star" : "star-border"}
                size={32}
                style={avg >= 3 ? styles.starSelected : styles.starUnselected}
              />

              <MaterialIcons
                name={avg >= 4 ? "star" : "star-border"}
                size={32}
                style={avg >= 4 ? styles.starSelected : styles.starUnselected}
              />

              <MaterialIcons
                name={avg >= 5 ? "star" : "star-border"}
                size={32}
                style={avg >= 5 ? styles.starSelected : styles.starUnselected}
              />
            </View>
          </View>
        </View>

        <View style={styles.box}>
          <Text style={[styles.heading2, { marginLeft: 20 }]}>
            {"Amount of particular ratings:"}
          </Text>

          {renderStars(1)}
          {renderStars(2)}
          {renderStars(3)}
          {renderStars(4)}
          {renderStars(5)}
        </View>
      </View>

      <Divider />

      {(!project || project?.owner_id === myid) && (
        <FAB
          icon={"check"}
          color={theme.colors.onPrimary}
          style={{
            position: "absolute",
            margin: 16,
            right: 0,
            bottom: 0,
            backgroundColor: theme.colors.primary,
          }}
          label={"Save"}
          onPress={() => {
            save();
          }}
          disabled={isMutating}
        />
      )}
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  fixHeaderStyles: {
    ...Platform.select({
      android: {
        marginLeft: -3,
        marginRight: 29,
      },
    }),
  },

  box: {
    borderWidth: 1, // Border width
    borderColor: "#000", // Border color (you can use any color value)
    borderRadius: 8, // Border radius to round the corners (optional)
    padding: 10, // Padding inside the box (optional)
    marginBottom: 15,
  },

  personalRating: {
    flex: 0.5,
    flexDirection: "row",
  },
  heading2: {
    fontSize: 20,
    fontWeight: "bold",
    marginBottom: 20,
  },

  container: {
    padding: 20,
  },
  heading: {
    fontSize: 24,
    fontWeight: "bold",
    marginBottom: 20,
  },
  stars: {
    display: "flex",
    flexDirection: "row",
  },
  starUnselected: {
    color: "#aaa",
  },
  starSelected: {
    color: "#ffb300",
  },
});
