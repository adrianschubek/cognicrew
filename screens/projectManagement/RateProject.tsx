import React, { Fragment, useEffect, useState } from "react";
import { Platform, ScrollView } from "react-native";
import { MaterialIcons } from "@expo/vector-icons";
import { Text } from "react-native-paper";
import { StyleSheet, View } from "react-native";
import { supabase } from "../../supabase";
import { useProjectRatings } from "../../utils/hooks";
import { Database } from "../../types/supabase";
import { useAuth } from "../../providers/AuthProvider";
import { useProjectStore } from "../../stores/ProjectStore";
import { useFocusEffect } from "@react-navigation/native";
import StatisticCategory from "../../components/profile/StatisticCategory";
import Star from "../../components/learningProject/rating/Star";
import RateProjectComponent from "../../components/learningProject/rating/RateProjectComponent";

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
            <Star key={index} starSelected={index <= numStars} size={32} />
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

  const { user } = useAuth();
  const projectId = useProjectStore((state) => state.projectId);
  //const [rating, setRating] = useState(null);
  //const [isInitialised, setIsInitialised] = useState(false);
  const [sum, setSum] = useState(null);
  const [avg, setAvg] = useState(null);
  const [arrRatings, setArrRatings] = useState([]);
  const { data, error, isLoading, mutate } = useProjectRatings(
    projectId,
    user.id,
  );
  useEffect(() => {
    if (!data || isLoading) return;
    /* if (!isInitialised) {
      setRating(data[0]["user_rating"]);
    }*/
    setAvg(data[0]["avg_rating"]);
    setSum(data[0]["count_all_ratings"]);
    const ratingsObject = data[0]["individual_ratings_arr"];
    setArrRatings([
      ratingsObject["count_one_star"],
      ratingsObject["count_two_star"],
      ratingsObject["count_three_star"],
      ratingsObject["count_four_star"],
      ratingsObject["count_five_star"],
    ]);
    //if (!isInitialised) setIsInitialised(true);
  }, [data]);

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
          mutate();
        },
      )
      .subscribe();
    return () => {
      ratingsTracker.unsubscribe();
    };
  });

  const ratingStatistics = [
    {
      title: "Tap to rate:",
      dataPointCategories: [
        {
          dataPoints: [
            {
              customNode: (
                <RateProjectComponent
                  projectId={projectId}
                  userId={user.id}
                />
              ),
            },
          ],
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
          dataPoints: [
            {
              customNode: (
                <>
                  {starsArray.map((e, index) => (
                    <Fragment key={index}>{renderStars(e)}</Fragment>
                  ))}
                </>
              ),
            },
          ],
        },
      ],
    },
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

  starSelected: {
    color: "#ffb300",
  },
});
