import { useUpsertMutation } from "@supabase-cache-helpers/postgrest-swr";
import React, {
  Fragment,
  useCallback,
  useEffect,
  useMemo,
  useState,
} from "react";
import { Platform, ScrollView, TouchableOpacity } from "react-native";
import { MaterialIcons } from "@expo/vector-icons";
import { Button, Divider, FAB, Text, useTheme } from "react-native-paper";
import { StyleSheet, View, SafeAreaView } from "react-native";
import { supabase } from "../../supabase";
import {
  useAlerts,
  useDeleteProject,
  useDeleteProjectRating,
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
import LoadingOverlay from "../../components/alerts/LoadingOverlay";
import { debounce } from "../../utils/common";
import { use } from "chai";

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
  const { confirm } = useAlerts();
  const theme = useTheme();

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

  const renderStars = (numStars) => {
    const starsArray = Array.from({ length: 5 }, (_, index) => index + 1);

    return (
      <View style={{ marginLeft: 20 }}>
        <View style={{ flexDirection: "row" }}>
          {starsArray.map((index) => (
            <MaterialIcons
              key={index}
              name={index-1 < numStars ? "star" : "star-border"}
              size={32}
              style={
                index-1 < numStars ? styles.starSelected : styles.starUnselected
              }
            />
          ))}
          <Text style={[styles.heading2, { marginLeft: 20 }]}>
            {arrRatings[numStars - 1]}{" "}
            {arrRatings[numStars - 1] === 1 ? "time" : "times"}
          </Text>
        </View>
      </View>
    );
  };

  const StarRating = ({ avg }) => {
    // Function to determine star type (full, half, or border)
    const getStarType = (index) => {
      const floorAvg = Math.floor(avg) + 1;
      const decimalPart = avg % 1;

      if (index < floorAvg) {
        return "star";
      } else if (index === floorAvg && decimalPart > 0) {
        return "star-half";
      } else {
        return "star-border";
      }
    };

    return (
      <View style={{ marginLeft: 20 }}>
        <View style={styles.stars}>
          {[1, 2, 3, 4, 5].map((index) => (
            <MaterialIcons
              key={index}
              name={getStarType(index)}
              size={32}
              style={styles.starSelected}
            />
          ))}
          <Text style={[styles.heading2, { marginLeft: 20 }]}>
            {avg == null
              ? "Not yet rated"
              : avg === 1
              ? "1 star"
              : `${avg} stars`}
          </Text>
        </View>
      </View>
    );
  };

  const { trigger: upsertProjectRating } = useUpsertProjectRating();
  const { user } = useAuth();
  const projectId = useProjectStore((state) => state.projectId);
  const [rating, setRating] = useState(null);
  const [allowUpdate, setAllowUpdate] = useState(false);
  const [sum, setSum] = useState(null);
  const [avg, setAvg] = useState(null);
  const [arrRatings, setArrRatings] = useState([]);
  const { trigger: deleteProjectRating } = useDeleteProjectRating();

  async function getUsersRating() {
    let { data, error } = await supabase.rpc("get_users_rating_for_project", {
      project_id_param: projectId,
      user_id_param: user.id,
    });
    if (data) {
      setOldRating(data);
    }
  }

  async function calculateSum() {
    let { data, error } = await supabase.rpc("sum_project_ratings", {
      project_id_param: projectId,
    });
    if (data) {
      setSum(data);
      //console.log(data);
    } else {
      setSum(data);
      //console.log(data);
    }
  }

  async function calculateAvg() {
    let { data, error } = await supabase.rpc("avg_project_rating", {
      project_id_param: projectId,
    });
    if (data) {
      data = data.toFixed(2);
      setAvg(data);
    } else {
      setAvg(data);
      //console.log(data);
    }

  }

  async function calculateIndividualRatings() {
    let { data, error } = await supabase.rpc("get_particular_amount_ratings", {
      project_id_param: projectId,
    });
    const dataArray = Object.values(data);
    if (dataArray) {
      setArrRatings(dataArray);
    }
  }

  async function calculateStatistics() {
    calculateSum();
    calculateAvg();
    calculateIndividualRatings();
  }
  
  useEffect(() => {
    if (!data) return;
    setRating(data);
    calculateStatistics();
  }, []);

  useFocusEffect(() => {
    const ratingsTracker = supabase
      .channel("list-ratings-tracker")
      .on(
        "postgres_changes",
        {
          event: "*",
          schema: "public",
          table: "tracker",
          filter: "key=eq.rate",
        },
        (payload) => {
          getUsersRating();
          calculateStatistics();
        },
      )
      .subscribe();
    return () => {
      ratingsTracker.unsubscribe();
    };
  });

  const handleStarPress = (newRating) => {
    if (newRating === rating) {
      deleteProjectRating({
        project_id: projectId,
        user_id: user.id,
        rating: newRating,
      });
      //setSum(sum-1);
      //setAvg(0);
      setRating(0);
    } else {
      setRating(newRating);
    }
  };

  const debouncedUpsertProjectRating = useCallback(
    debounce((pId, uId, r) => {
      upsertProjectRating({
        //@ts-expect-error
        project_id: pId,
        user_id: uId,
        rating: r,
      });
    }, 1000),
    [],
  );
  useEffect(() => {
    if (rating !== null || rating === 0) {
      // Call the debounced function
      if (allowUpdate === true) {
        debouncedUpsertProjectRating(projectId, user.id, rating);
      } else setAllowUpdate(true);
    }
  }, [rating, debouncedUpsertProjectRating]); // add debouncedEditFlashcard to dependencies

  if (isLoading || error) return <LoadingOverlay visible />;
  return (
    <ScrollView>
      <SafeAreaView style={styles.personalRating}>
        <View style={styles.container}>
          <Text style={styles.heading}>{"Tap to rate:"}</Text>
          <View style={styles.stars}>
            <TouchableOpacity
              onPress={() => {
                handleStarPress(1);
              }}
            >
              <MaterialIcons
                name={rating >= 1 ? "star" : "star-border"}
                size={32}
                style={
                  rating >= 1 ? styles.starSelected : styles.starUnselected
                }
              />
            </TouchableOpacity>
            <TouchableOpacity
              onPress={() => {
                handleStarPress(2);
              }}
            >
              <MaterialIcons
                name={rating >= 2 ? "star" : "star-border"}
                size={32}
                style={
                  rating >= 2 ? styles.starSelected : styles.starUnselected
                }
              />
            </TouchableOpacity>
            <TouchableOpacity
              onPress={() => {
                handleStarPress(3);
              }}
            >
              <MaterialIcons
                name={rating >= 3 ? "star" : "star-border"}
                size={32}
                style={
                  rating >= 3 ? styles.starSelected : styles.starUnselected
                }
              />
            </TouchableOpacity>
            <TouchableOpacity
              onPress={() => {
                handleStarPress(4);
              }}
            >
              <MaterialIcons
                name={rating >= 4 ? "star" : "star-border"}
                size={32}
                style={
                  rating >= 4 ? styles.starSelected : styles.starUnselected
                }
              />
            </TouchableOpacity>
            <TouchableOpacity
              onPress={() => {
                handleStarPress(5);
              }}
            >
              <MaterialIcons
                name={rating >= 5 ? "star" : "star-border"}
                size={32}
                style={
                  rating >= 5 ? styles.starSelected : styles.starUnselected
                }
              />
            </TouchableOpacity>
            <Text style={[styles.heading, { marginLeft: 10 }]}>
              {rating
                ? `${rating} ${rating > 1 ? "stars" : "star"}`
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
            {sum == null ? "0" : sum}
          </Text>
          <Text style={[styles.heading2, { marginLeft: 20 }]}>
            {"Project's average rating:"}
          </Text>

          <StarRating avg={avg} />
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
