import { useAuth } from "../providers/AuthProvider";
import {
  useDeleteMutation,
  useInsertMutation,
  useQuery,
  useUpsertMutation,
} from "@supabase-cache-helpers/postgrest-swr";
import { supabase } from "../supabase";
import { useEffect } from "react";
import { ManagementType } from "../types/common";
import { useFocusEffect } from "@react-navigation/native";
import { BackHandler } from "react-native";
import { RoomClientUpdate } from "../functions/rooms";
import { handleEdgeError } from "./common";
import { useAlerts } from "react-native-paper-fastalerts";
import useSWR, { mutate } from "swr";
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
export function useProjectMembers(projectId: number) {
  const { data, error, isLoading, mutate } = handleErrors(
    useQuery(
      supabase.rpc("project_members", {
        p_project_id: projectId,
      }),
    ),
  );
  return { data, error, isLoading, mutate };
}
export function useFriendsList() {
  return handleErrors(useQuery(supabase.rpc("list_friends")));
}
export function useFriendIdsAndNames() {
  const { data, error, isLoading, mutate } = handleErrors(
    useQuery(supabase.rpc("list_friends_ids_and_names")),
  );
  return { data, error, isLoading, mutate };
}
export function useFriendRelations() {
  const { data, error, isLoading, mutate } = handleErrors(
    useQuery(supabase.rpc("friend_relations")),
  );
  return { data, error, isLoading, mutate };
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
export function useDeleteFriendRequest() {
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

//Recommender system
export function useRecommendations(userId: string) {
  const query = supabase.rpc("get_recommendations", { p_user_id: userId });

  const { data, error, isLoading, mutate } = handleErrors(useQuery(query));

  useEffect(() => {
    mutate();
  }, []);
  return {
    data,
    error,
    isLoading,
    mutate,
  };
}

//Search projects

//Rate projects
export function useProjectRatings(projectId: number, userId: string) {
  const query = supabase.rpc("get_project_ratings", {
    p_user_id: userId,
    p_project_id: projectId,
  });

  const { data, error, isLoading, mutate } = handleErrors(useQuery(query));

  useEffect(() => {
    mutate();
  }, []);
  return {
    data,
    error,
    isLoading,
    mutate,
  };
}

//Project statistics
export function useProjectStatistics(projectId: number, userId: string) {
  const query = supabase.rpc("get_project_statistics", {
    p_user_id: userId,
    p_project_id: projectId,
  });
  const { data, error, isLoading, mutate } = handleErrors(useQuery(query));
  useEffect(() => {
    mutate();
  }, []);
  return {
    data,
    error,
    isLoading,
    mutate,
  };
}

export function usePublicProjects() {
  const { data, error, isLoading, mutate } = handleErrors(
    useQuery(supabase.rpc("get_public_projects")),
  );
  return { data, error, isLoading, mutate };
}
//Global statistics
export function useGlobalStatistics(userId: string) {
  const query = supabase.rpc("get_global_statistics", {
    p_user_id: userId,
  });

  const { data, error, isLoading, mutate } = handleErrors(useQuery(query));

  useEffect(() => {
    mutate();
  }, []);
  return {
    data,
    error,
    isLoading,
    mutate,
  };
}

//Settings
export function usePersonalTags() {
  const query = supabase.from("profiles").select("user_tags");

  const { data, error, isLoading, mutate } = handleErrors(useQuery(query));

  useEffect(() => {
    mutate();
  }, []);
  return {
    data,
    error,
    isLoading,
    mutate,
  };
}

//Achievements
export function useUserAchievements(userId: string) {
  return handleErrors(
    useQuery(
      supabase
        .from("user_achievements")
        .select("achievement_id")
        .eq("user_id", userId)
        .order("achievement_id"),
    ),
  );
}
export function useAchievements() {
  const { data, error, isLoading, mutate } = handleErrors(
    useQuery(supabase.rpc("get_achievements")),
  );
  return { data, error, isLoading, mutate };
}
export function useAchievement(id: number) {
  //this fails on intitalRender always, because id is 0. This has to be done in order to avoid
  //"Rendered more hooks than during the previous render" error
  const { data, error, isLoading, mutate } = useQuery(
    supabase
      .from("achievements")
      .select("id,name,icon_name,description")
      .eq("id", id),
  );
  if (!id) return { data: null, error: null, isLoading: false, mutate };
  return { data, error, isLoading, mutate };
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

export function useInsertAchievement() {
  return handleErrors(
    useInsertMutation(
      supabase.from("user_achievements"),
      ["achievement_id", "user_id"],
      "achievement_id,user_id",
    ),
  );
}
export async function useDistinctProjectGroups() {
  let { data, error } = await supabase.rpc("get_distinct_project_groups");
  const stringArray = data.map((item) => item.group);

  //console.log("Distinct groups Array:", stringArray);

  if (error) {
    console.error("Error fetching distinct groups:", error.message);
    return []; // or handle the error in some way
  } else {
    //console.log("Distinct groups:", data);
    return stringArray;
  }
}

//Returns all Sets
export function useSets(
  type: ManagementType,
  projectId: number,
  refetchIndex?: number,
) {
  const query = supabase.rpc("list_sets_for", { p_project_id: projectId, p_type: type });

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
  const query = supabase
    .from("exercises")
    .select("id,question,priority,set_id,answers_exercises(exercise)")
    .eq("set_id", setId);
  useEffect(() => {
    mutate();
  }, []);
  const { data, error, isLoading, mutate } = handleErrors(useQuery(query));
  return { data, error, isLoading, mutate };
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
    .select(
      "created_at,id,link_url,learning_project,title,subtitle,description",
    )
    .eq("learning_project", projectId)
    .order("created_at");
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

function customUseFunction(query, key, filePath) {
  const { data, error, mutate } = handleErrors(useSWR([key, filePath], query));
  return {
    data,
    isLoading: !error && !data,
    error: error,
    mutate,
  };
}
export function usePrivateFileUrl(filePath: string, bucketName?: string) {
  const bucket = bucketName || "files";
  const getSignedUrl = async () => {
    const { data, error } = await supabase.storage
      .from(bucket)
      .createSignedUrl(filePath, 3600); // URL will be valid for 1 hour
    return data ? data.signedUrl : "not found";
  };
  return customUseFunction(
    getSignedUrl,
    `getPrivateFileUrl:` /*${unique Identifier}*/,
    filePath,
  );
}
export function usePublicFileUrl(filePath: string, bucketName?: string) {
  const bucket = bucketName || "files";
  const fetchPublicUrl = async () => {
    const { data } = await supabase.storage.from(bucket).getPublicUrl(filePath);
    return data ? data.publicUrl : "not found";
  };
  return customUseFunction(fetchPublicUrl, "getPublicFileUrl:", filePath);
}
export function useFiles(
  filePath: string,
  limit?: number,
  bucketName?: string,
) {
  const bucket = bucketName || "files";
  const fetchFiles = () =>
    supabase.storage.from(bucket).list(filePath, {
      limit: limit ? limit : 100,
      offset: 0,
    });
  return customUseFunction(fetchFiles, "getFiles", filePath);
}

//not necessarily needed
export function useDeleteFile(filePath: string, bucketName?: string) {
  const bucket = bucketName || "files";
  const deleteFile = () => supabase.storage.from(bucket).remove([filePath]);
  const key = `/${bucket}/${filePath}`;
  const fetcherFunction = async () => {
    const { data, error } = await supabase.storage
      .from(bucket)
      .download(filePath);
    if (error) {
      throw error;
    }

    return { fileData: data, isDeleted: false };
  };
  const { data, error } = useSWR(key, fetcherFunction);

  const remove = async () => {
    try {
      await deleteFile();
      // Update the cache with the new state
      mutate(key, { fileData: null, isDeleted: true });
    } catch (error) {
      throw error;
    }
  };

  return {
    data: data?.fileData,
    error,
    isLoading: !error && !data,
    isDeleted: data?.isDeleted,
    remove,
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
