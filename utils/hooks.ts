import { useAuth } from "../providers/AuthProvider";
//import { Alert, useAlertsStore } from "../stores/AlertsStore";
import {
  useDeleteMutation,
  useInsertMutation,
  useQuery,
  useUpsertMutation,
} from "@supabase-cache-helpers/postgrest-swr";

import { supabase } from "../supabase";
import { useCallback, useEffect } from "react";
import { ManagementType } from "../types/common";
import { useSoundsStore } from "../stores/SoundsStore";
import { useFocusEffect } from "@react-navigation/native";
import { BackHandler } from "react-native";
import { Json } from "../types/supabase";
import { RoomClientUpdate } from "../functions/rooms";
import { handleEdgeError } from "./common";

export function useSoundSystem1() {
  const { playSound, stopSound, loadSound1 } = useSoundsStore();
  useFocusEffect(
    useCallback(() => {
      const { isLoaded } = useSoundsStore.getState();
      if (!isLoaded) {
        const audioSource = require("../assets/sounds/musicmusicmusic.mp3");
        loadSound1(audioSource);
      } else {
        playSound();
      }
      return () => {
        stopSound();
      };
    }, []),
  );
}

export function useSoundSystem2() {
  const { playSound, stopSound, loadSound2 } = useSoundsStore();
  useFocusEffect(
    useCallback(() => {
      const { isLoaded2 } = useSoundsStore.getState();
      if (!isLoaded2) {
        const audioSource = require("../assets/sounds/Tetris.mp3");
        loadSound2(audioSource);
      } else {
        playSound();
      }
      return () => {
        stopSound();
      };
    }, []),
  );
}

/**
 * Handles errors thrown by the given supabase query.
 * Shows an alert if an error is thrown.
 */
function handleErrors<T>(
  fn: T,
  getErrorMessage: (errorMsg: string) => string = (errorMsg) => errorMsg,
): T {
  const { error: errorAlert } = useAlerts();
  // @ts-expect-error fn.error always exists
  if (fn.error) {
    // @ts-expect-error
    errorAlert({ title: "Error", message: getErrorMessage(fn.error.message) });
    // @ts-expect-error
    console.log("[handleErrors] " + getErrorMessage(fn.error.message));
  }
  return fn;
}

/**
 * Returns the username of the user with the given uid.
 * If no uid is given, the username of the current user is returned.
 * @param uid The uid of the user whose username to get.
 */
export function useUsername(uid?: string) {
  const { user } = useAuth();

  return handleErrors(
    useQuery(
      supabase.rpc("getUsername", {
        user_id: uid ?? user?.id,
      }),
    ),
  );
}

export async function useUsernamesByRoom() {
  let { data, error } = await supabase.rpc("list_room_members");
  if (error) console.error(error);
  //console.log(data);
  return { data, error };
}

export function useRoomByUserId(userId?: string) {
  console.log("UserId: " + userId);
  return handleErrors(
    useQuery(supabase.from("profiles").select("room_id").eq("id", userId)),
  );
}

export function useUserNames(userIds: string[], refetchIndex?: number) {
  const query = supabase.rpc("get_usernames", {
    user_ids: userIds,
  });
  const { data, isLoading, error, mutate } = handleErrors(useQuery(query));
  useEffect(() => {
    mutate();
  }, [refetchIndex]);
  return { data, isLoading, error };
}
export function useRemoveUserFromLearningProject() {
  return handleErrors(
    useDeleteMutation(
      supabase.from("user_learning_projects"),
      ["learning_project_id", "user_id"],
      "learning_project_id,user_id",
    ),
  );
}
export function useFriendsList() {
  return handleErrors(useQuery(supabase.rpc("list_friends")));
}
export async function friendIdsAndNames() {
  let { data, error } = await supabase.rpc("list_friends_ids_and_names");
  if (error) console.log(error);
  return { data, error };
}
/**
 * Returns all Friends.
 * @see Use {@link useFriendsList} instead if you only want tuples non pending friends.
 */
export function useFriends(refetchIndex?: number) {
  const query = supabase.from("friends").select("user_from_id,user_to_id");
  const { data, isLoading, error, mutate } = handleErrors(useQuery(query));
  useEffect(() => {
    mutate();
  }, [refetchIndex]);
  return { data, isLoading, error, mutate };
}
export function useDeleteFriend() {
  return handleErrors(
    useDeleteMutation(
      supabase.from("friends"),
      ["user_from_id", "user_to_id"],
      "user_from_id,user_to_id",
    ),
  );
}
export function useInsertFriend() {
  return handleErrors(
    useInsertMutation(
      supabase.from("friends"),
      ["user_from_id", "user_to_id"],
      "user_from_id,user_to_id",
    ),
    (error) => {
      if (error.includes("duplicate key value violates unique constraint")) {
        return "You already sent a friend request or are already friends with this user.";
      } else if (
        error.includes("new row violates row-level security policy for table")
      ) {
        return "You cannot send a friend request to yourself.";
      } else return error;
    },
  );
}

//Project ratings

export function useUpsertProjectRating() {
  return handleErrors(
    useUpsertMutation(
      supabase.from("project_ratings"),
      ["project_id", "user_id"],
      "project_id, user_id, rating",
    ),
  );
}

export function useDeleteProjectRating() {
  return handleErrors(
    useDeleteMutation(
      supabase.from("project_ratings"),
      ["project_id", "user_id"],
      "project_id,user_id,rating",
    ),
  );
}

export function useAchievements() {
  return handleErrors(
    useQuery(
      supabase
        .from("achievements")
        .select("id,name,icon_name,description")
        .order("id"),
    ),
  );
}

/**
 * Returns all achievements for a specific user.
 */
export function useAchievementsByUser(userId: string) {
  const { data: userAchievements, isLoading: isLoadingUserAchievements } =
    useQuery(
      supabase
        .from("user_achievements")
        .select("achievement_id")
        .eq("user_id", userId),
    );

  const userAchievementIds =
    userAchievements?.map((ua) => ua.achievement_id) || [];

  const { data: allAchievements, isLoading: isLoadingAllAchievements } =
    useQuery(
      supabase
        .from("achievements")
        .select("id, name, icon_name, description")
        .in("id", userAchievementIds)
        .order("id"),
    );

  const isLoading = isLoadingUserAchievements || isLoadingAllAchievements;

  return { data: allAchievements, isLoading };
}

/**
 * Returns all achievements not achieved by a specific user.
 */
export function useNotAchievementsByUser(userId: string) {
  const { data: userAchievements, isLoading: isLoadingUserAchievements } =
    useQuery(
      supabase
        .from("user_achievements")
        .select("achievement_id")
        .eq("user_id", userId),
    );

  const userAchievementIds =
    userAchievements?.map((ua) => ua.achievement_id) || [];

  const { data: allAchievements, isLoading: isLoadingAllAchievements } =
    useQuery(
      supabase
        .from("achievements")
        .select("id, name, icon_name, description")
        .order("id"),
    );

  // Filter out user achievements
  const notAchieved =
    allAchievements?.filter(
      (achievement) => !userAchievementIds.includes(achievement.id),
    ) || [];

  const isLoading = isLoadingUserAchievements || isLoadingAllAchievements;

  return { data: notAchieved, isLoading };
}

export function useUnlockAchievement() {
  const { user } = useAuth();

  const unlockAchievement = async (achievementId) => {
    const { data, error } = await supabase.from("user_achievements").upsert({
      user_id: user?.id,
      achievement_id: achievementId,
    });

    if (error) {
      console.error("Error unlocking achievement: ", error);
      return { success: false, error: error.message };
    }

    return { success: true, data };
  };

  return unlockAchievement;
}

export async function useDistinctProjectGroups() {
  let { data, error } = await supabase.rpc("get_distinct_project_groups");
  const stringArray = data.map((item) => item.group);

  console.log("Distinct groups Array:", stringArray);

  if (error) {
    console.error("Error fetching distinct groups:", error.message);
    return []; // or handle the error in some way
  } else {
    console.log("Distinct groups:", data);
    return stringArray;
  }
}

//Returns all Sets
export function useSets(
  type: ManagementType,
  projectId: number,
  refetchIndex?: number,
) {
  const query = supabase
    .from("sets")
    .select("id,name,type,project_id,created_at")
    .eq("type", type)
    .eq("project_id", projectId);

  const { data, isLoading, error, mutate } = handleErrors(useQuery(query));
  useEffect(() => {
    mutate();
  }, [refetchIndex]);
  return { data, isLoading, error, mutate };
}
export function useDeleteSet() {
  return handleErrors(useDeleteMutation(supabase.from("sets"), ["id"], "id"));
}
export function useUpsertSet() {
  return handleErrors(
    useUpsertMutation(supabase.from("sets"), ["id"], "id,name,type,project_id"),
  );
}
export function useFlashcards(setId: number) {
  const query = supabase
    .from("flashcards")
    .select("id,question,answer,priority,set_id,created_at")
    .eq("set_id", setId)
    .order("created_at");
  const { data, isLoading, error, mutate } = handleErrors(useQuery(query));
  useEffect(() => {
    mutate();
  }, []);
  return { data, isLoading, error, mutate };
}

export function useFlashcardsMultipleSets(sets: { id: number }[]) {
  return handleErrors(
    useQuery(
      supabase
        .from("flashcards")
        .select("id,question,answer,priority,set_id")
        .in("set_id", sets),
    ),
  );
}

export function useUpsertFlashcard() {
  return handleErrors(
    useUpsertMutation(
      supabase.from("flashcards"),
      ["id"],
      "id,question,answer,priority,set_id",
    ),
  );
}
export function useDeleteFlashcard() {
  return handleErrors(
    useDeleteMutation(supabase.from("flashcards"), ["id"], "id"),
  );
}
export function useExercises(setId: number) {
  const query = supabase
    .from("exercises")
    .select("id,question,priority,set_id,created_at")
    .eq("set_id", setId)
    .order("created_at");
  const { data, isLoading, error, mutate } = handleErrors(useQuery(query));
  useEffect(() => {
    mutate();
  }, []);
  return { data, isLoading, error, mutate };
}

export function useUpsertExercise() {
  return handleErrors(
    useUpsertMutation(
      supabase.from("exercises"),
      ["id"],
      "id,question,priority,set_id",
    ),
  );
}
export function useDeleteExercise() {
  return handleErrors(
    useDeleteMutation(supabase.from("exercises"), ["id"], "id"),
  );
}
export function useAnswersExercises(exerciseId: number) {
  const query = supabase
    .from("answers_exercises")
    .select("answer,exercise,is_correct,order_position")
    .eq("exercise", exerciseId)
    .order("order_position");
  const { data, isLoading, error, mutate } = handleErrors(useQuery(query));
  useEffect(() => {
    mutate();
  }, []);
  return { data, isLoading, error, mutate };
}

export function useExercisesAndAnswers(setId: number) {
  return handleErrors(
    useQuery(
      supabase
        .from("exercises")
        .select("id,question,priority,set_id,answers_exercises(exercise)")
        .eq("set_id", setId),
    ),
  );
}

export function useUpsertAnswersExercise() {
  return handleErrors(
    useUpsertMutation(
      supabase.from("answers_exercises"),
      ["exercise", "order_position"],
      "answer,exercise,is_correct,order_position",
    ),
  );
}
//creates race condition with itself when called multiple times
export function useDeleteAnswersExercise() {
  return handleErrors(
    useDeleteMutation(
      supabase.from("answers_exercises"),
      ["exercise", "order_position"],
      "exercise,order_position",
    ),
  );
}
export function useLinks(projectId: number) {
  const query = supabase
    .from("links")
    .select("id,link_url,learning_project,title,subtitle,description")
    .eq("learning_project", projectId);
  const { data, isLoading, error, mutate } = handleErrors(useQuery(query));
  useEffect(() => {
    mutate();
  }, []);
  return { data, isLoading, error, mutate };
}

export function useDeleteLink() {
  return handleErrors(useDeleteMutation(supabase.from("links"), ["id"], "id"));
}

export function useUpsertLink() {
  return handleErrors(
    useUpsertMutation(
      supabase.from("links"),
      ["id"],
      "id,link_url,learning_project,title,subtitle,description",
    ),
  );
}
export function useDeleteProject() {
  return handleErrors(
    useDeleteMutation(supabase.from("learning_projects"), ["id"], "id"),
  );
}

/**
 * Display alerts.
 * @returns functions to display alerts.
 */
export function useAlerts() {
  const dispatch = useAlertsStore((state) => state.dispatch);

  return {
    alert: (config: Partial<Alert>) => {
      dispatch({
        icon: "",
        ...config,
      });
    },
    /**
     * Creates a success alert using the given config.
     */
    success: (config: Partial<Alert>) => {
      dispatch({
        icon: "check",
        title: "Success",
        ...config,
      });
    },
    error: (config: Partial<Alert>) => {
      dispatch({
        icon: "alert-decagram",
        title: "Error",
        ...config,
      });
    },
    warning: (config: Partial<Alert>) => {
      dispatch({
        icon: "alert",
        title: "Warning",
        ...config,
      });
    },
    info: (config: Partial<Alert>) => {
      dispatch({
        icon: "information-outline",
        title: "Info",
        ...config,
      });
    },
    confirm: (config: Partial<Alert>) => {
      dispatch({
        icon: "help-box",
        title: "Confirm",
        cancelText: "Cancel",
        okText: "OK",
        ...config,
      });
    },
  };
}

export function useConfirmLeaveLobby() {
  const { confirm } = useAlerts();
  useFocusEffect(() => {
    const onBackPress = () => {
      confirm({
        key: "leaveroom",
        title: "Leave game?",
        message: "Do you want to leave this game and return to lobby?",
        icon: "location-exit",
        okText: "Leave",
        okAction: async () => {
          const { error } = await supabase.functions.invoke("room-update", {
            body: {
              type: "reset_room",
            } as RoomClientUpdate,
          });
          if (error) return await handleEdgeError(error);
        },
      });
      return true;
    };

    const listener = BackHandler.addEventListener(
      "hardwareBackPress",
      onBackPress,
    );

    return () => listener.remove();
  });
}
