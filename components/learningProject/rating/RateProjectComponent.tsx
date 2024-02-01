import { TouchableOpacity, View } from "react-native";
import Star from "./Star";
import { useCallback, useEffect, useState } from "react";
import { debounce } from "../../../utils/common";
import {
  useDeleteProjectRating,
  useUpsertProjectRating,
} from "../../../utils/hooks";
import { supabase } from "../../../supabase";
import { useFocusEffect } from "@react-navigation/native";

export default function RateProjectComponent(props: {
  projectId: number;
  userId: string;
}) {
  const { projectId, userId } = props;
  const [rating, setRating] = useState<number>(null);
  const { trigger: upsertProjectRating } = useUpsertProjectRating();
  const { trigger: deleteProjectRating } = useDeleteProjectRating();
  const starsArray = Array.from({ length: 5 }, (_, index) => index + 1);
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
    if (rating === null || rating === undefined) return;
    // Call the debounced function
    debouncedBackendCall(projectId, userId, rating);
  }, [rating, debouncedBackendCall]);

  useFocusEffect(() => {
    async function fetchData() {
      try {
        const result = await supabase
          .from("project_ratings")
          .select("rating")
          .eq("user_id", userId)
          .eq("project_id", projectId);
        return result;
      } catch (error) {
        console.log("error: ", error);
      }
    }
    fetchData().then((data) => {
      //console.log("result: ", data);
      setRating(data.data[0]?.rating);
    });
  });
  return (
    <>
      <View style={{ flexDirection: "row", alignItems: "center" }}>
        {starsArray.map((number) => {
          return (
            <TouchableOpacity
              key={number}
              onPress={() => {
                handleStarPress(number);
              }}
            >
              <Star starSelected={rating >= number} size={32} />
            </TouchableOpacity>
          );
        })}
      </View>
    </>
  );
}
