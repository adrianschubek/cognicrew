import { TouchableOpacity, View } from "react-native";
import Star from "./Star";
import { useCallback, useEffect, useState } from "react";
import { debounce } from "../../../utils/common";
import {
  useDeleteProjectRating,
  useProjectRating,
  useUpsertProjectRating,
} from "../../../utils/hooks";

export default function RateProjectComponent(props: {
  projectId: number;
  userId: string;
  rating?: number;
}) {
  const { projectId, userId } = props;
  const [rating, setRating] = useState<number>(props.rating ?? null);
  const [isInitialized, setIsInitialized] = useState<boolean>(false);
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

  //this component is basically a way to get the rating conditionally from the backend, because 
  //god forbid we make two backend calls for RateProject when we can do it with only one! @Alex 
  function GetRating(props: {
    sendRating: (rating: number) => void;
    sendIsInitialized?: (isInitialized: boolean) => void;
    projectId: number;
    userId: string;
    isInitialized?: boolean;
  }) {
    const { data } = useProjectRating(props.projectId, props.userId);
    useEffect(() => {
      if (props.isInitialized || !data) return;
      props.sendRating(data[0]?.rating);
      props.sendIsInitialized(true);
    }, [data]);
    return null;
  }
  return (
    <>
      {!props.rating ? (
        <GetRating
          projectId={projectId}
          userId={userId}
          isInitialized={isInitialized}
          sendRating={(rating) => {
            setRating(rating);
          }}
          sendIsInitialized={(isInitialized) => {
            setIsInitialized(isInitialized);
          }}
        />
      ) : null}
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
