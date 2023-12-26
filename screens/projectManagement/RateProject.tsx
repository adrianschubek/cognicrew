import React, { Fragment, useCallback, useEffect, useState } from "react";
import { Platform, ScrollView, TouchableOpacity } from "react-native";
import { MaterialIcons } from "@expo/vector-icons";
import { Divider, Text, useTheme } from "react-native-paper";
import { StyleSheet, View, SafeAreaView } from "react-native";
import { supabase } from "../../supabase";
import {
  useDeleteProjectRating,
  useUpsertProjectRating,
  useUsername,
} from "../../utils/hooks";
import { Database } from "../../types/supabase";
import { useAuth } from "../../providers/AuthProvider";
import { useProjectStore } from "../../stores/ProjectStore";
import { useFocusEffect } from "@react-navigation/native";
import { debounce } from "../../utils/common";
import { useAlerts } from "react-native-paper-fastalerts";
import StatisticCategory from "../../components/profile/StatisticCategory";

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
  const { edit: project } = route.params;

  const username = useUsername(project?.owner_id ?? null);
  const { confirm } = useAlerts();
  const theme = useTheme();

  useEffect(() => {
    navigation.setOptions({
      title: "Rate Project",
    });
  }, []);

  const starsArray = Array.from({ length: 5 }, (_, index) => index + 1);
  const renderStars = (numStars) => {
    return (
      <View>
        <View style={{ flexDirection: "row", alignItems: "center" }}>
          {starsArray.map((index) => (
            <MaterialIcons
              key={index}
              name={index - 1 < numStars ? "star" : "star-border"}
              size={32}
              style={
                index - 1 < numStars
                  ? styles.starSelected
                  : styles.starUnselected
              }
            />
          ))}
          <Text style={{ marginLeft: 10 }}>{arrRatings[numStars - 1]}</Text>
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
      <View>
        <View style={{ flexDirection: "row", alignItems: "center" }}>
          {starsArray.map((index) => (
            <MaterialIcons
              key={index}
              name={getStarType(index)}
              size={32}
              style={styles.starSelected}
            />
          ))}
        </View>
      </View>
    );
  };

  const { trigger: upsertProjectRating } = useUpsertProjectRating();
  const { user } = useAuth();
  const projectId = useProjectStore((state) => state.projectId);
  const [rating, setRating] = useState(null);
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
      setRating(data);
    }
  }
  async function calculateSum() {
    let { data, error } = await supabase.rpc("sum_project_ratings", {
      project_id_param: projectId,
    });
    setSum(data);
  }

  async function calculateAvg() {
    let { data, error } = await supabase.rpc("avg_project_rating", {
      project_id_param: projectId,
    });
    if (data) {
      data = parseFloat(data.toFixed(2));
      setAvg(data);
    } else {
      setAvg(data);
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
    getUsersRating();
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
      setRating(0);
    } else {
      setRating(newRating);
    }
  };

  const debouncedDeleteOrUpsert = debounce((pId, uId, r) => {
    if (r === 0) {
      deleteProjectRating({
        project_id: pId,
        user_id: uId,
      });
    } else
      upsertProjectRating({
        //@ts-expect-error
        project_id: pId,
        user_id: uId,
        rating: r,
      });
  }, 500);
  const debouncedBackendCall = useCallback(debouncedDeleteOrUpsert, []);

  useEffect(() => {
    if (rating === null) return;
    // Call the debounced function
    debouncedBackendCall(projectId, user.id, rating);
  }, [rating, debouncedBackendCall]);

  const rateProjectComponent = (
    <View style={{ flexDirection: "row", alignItems: "center" }}>
      {starsArray.map((number) => {
        return (
          <TouchableOpacity
            key={number}
            onPress={() => {
              handleStarPress(number);
            }}
          >
            <MaterialIcons
              name={rating >= number ? "star" : "star-border"}
              size={32}
              style={
                rating >= number ? styles.starSelected : styles.starUnselected
              }
            />
          </TouchableOpacity>
        );
      })}
    </View>
  );

  const ratingStatistics = [
    {
      title: "Tap to rate:",
      dataPointCategories: [
        {
          dataPoints: [{ customNode: rateProjectComponent }],
        },
      ],
    },
    {
      title: "General rating:",
      dataPointCategories: [
        {
          dataPoints: [
            {
              customNode: (
                <View style={{ flexDirection: "row" }}>
                  <Text>{"Total amount:"}</Text>
                  <Text style={{ color: "red", marginLeft: 10 }}>
                    {sum == null ? "0" : sum}
                  </Text>
                </View>
              ),
            },
            {
              text: `Total average:`,
              customNode: <StarRating avg={avg} />,
            },
          ],
        },
      ],
    },
    {
      title: `Individual ratings:`,
      dataPointCategories: [
        {
          dataPoints: [{ customNode: (
            <>
              {starsArray.map((e, index) => (
                <Fragment key={index}>{renderStars(e)}</Fragment>
              ))}
            </>
          ), }],
        },
      ]
    }
  ];
  return (
    <ScrollView>
      {ratingStatistics.map((item, index) => {
        return (
          <StatisticCategory
            key={index}
            data={{
              title: item.title,
              dataPointCategories: item.dataPointCategories,
            }}
          />
        );
      })}
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
  
  starUnselected: {
    color: "#aaa",
  },
  starSelected: {
    color: "#ffb300",
  },
});
