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
  useRemoveUserFromLearningProject,
  useSoundSystem1,
  useUpsertProjectRating,
  useUsername,
} from "../../utils/hooks";
import { Database } from "../../types/supabase";
import { useAuth } from "../../providers/AuthProvider";
import { HeaderBackButton } from "@react-navigation/elements";
import { useProjectStore } from "../../stores/ProjectStore";
import { useFocusEffect } from "@react-navigation/native";

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
          {arrRatings[numStars - 1]} {arrRatings[numStars - 1] === 1 ? "time" : "times"}
          </Text>
        </View>
      </View>
    );
  };


  const { trigger: upsertProjectRating } = useUpsertProjectRating();

  const { user } = useAuth();
  const projectId = useProjectStore((state) => state.projectId)

  const [starRating, setStarRating] = useState(null);
  const [sum, setSum] = useState(null);
  const [avg, setAvg] = useState(null);
  const [arrRatings, setArrRatings] = useState([]);
  
  async function getUsersRating() {
    let { data, error } = await supabase.rpc("get_users_rating_for_project", {project_id_param: projectId, user_id_param: user.id});
    console.log("User's Id:");
    console.log(data);
    if (data) {
      setStarRating(data);
    }
    if (error) console.error(error);
    else console.log(data);
  } 

  async function calculateSum() {
    let { data, error } = await supabase.rpc("sum_project_ratings", {project_id_param: projectId});
    if (data) {
      setSum(data);
    }
    if (error) console.error(error);
    else console.log(data);
  } 

  async function calculateAvg() {
    let { data, error } = await supabase.rpc("avg_project_rating", {project_id_param: projectId});
    if (data) {
      setAvg(data);
    }
    if (error) console.error(error);
    else console.log(data);
  } 

  async function calculateIndividualRatings() {
    let { data, error } = await supabase.rpc("get_particular_amount_ratings", {project_id_param: projectId});
    console.log("Particular ratings:");
    console.log(data);
    const dataArray = Object.values(data);
    console.log(dataArray)
    if (dataArray) {
      setArrRatings(dataArray);
    }
    if (error) console.error(error);
    else console.log(data);
  }

  async function calculateStatistics(){
    calculateSum();
    calculateAvg();
    calculateIndividualRatings();
  }
 




  useEffect(() => {
      getUsersRating();
      calculateStatistics();
  }, []
  );

  useFocusEffect(() => {
    const roomsTracker = supabase
      .channel("list-ratings-tracker")
      .on(
        "postgres_changes",
        { event: "*", schema: "public", table: "tracker", filter: "key=eq.rate" },
        (payload) => {
          getUsersRating();
          calculateStatistics();
        },
      )
      .subscribe();
    return () => {
      roomsTracker.unsubscribe();
    };
  });


 const handleStarPress = (rating) => {
  if (rating === starRating) {
    setStarRating(0);
  } else {
    setStarRating(rating);
  }

  upsertProjectRating({
    //@ts-expect-error
    project_id: projectId,
    user_id: user.id,
    rating: rating === starRating ? 0 : rating,
  });
};


  return (
    <ScrollView>
      <SafeAreaView style={styles.personalRating}>
        <View style={styles.container}>
          <Text style={styles.heading}>{"Tap to rate:"}</Text>
          <View style={styles.stars}>
            <TouchableOpacity
              onPress={() => {
              handleStarPress(1)}}
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
                handleStarPress(2)
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
                handleStarPress(3)
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
                handleStarPress(4)
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
                handleStarPress(5)
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
              <Text style={[styles.heading2, { marginLeft: 20 }]}>
                {avg === 1 ? "1 star" : `${avg} stars`}
              </Text>
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
