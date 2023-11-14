import { useAuth } from "../providers/AuthProvider";
import { Alert, useAlertsStore } from "../stores/AlertsStore";
import {
  useDeleteItem,
  useDeleteMutation,
  useInsertMutation,
  useQuery,
  useUpsertMutation,
} from "@supabase-cache-helpers/postgrest-swr";

import { supabase } from "../supabase";
import { ifMod } from "./common";
import { useCallback, useEffect, useMemo } from "react";
import { ManagementType } from "../types/common";

/**
 * Handles errors thrown by the given supabase query.
 * Shows an alert if an error is thrown.
 */
function handleErrors<T>(fn: T): T {
  const { error: errorAlert } = useAlerts();
  // @ts-ignore fn.error always exists
  if (fn.error) {
    // @ts-ignore
    errorAlert({ title: "Error", message: fn.error.message });
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
/**
 * Returns all Friends.
 */
export function useFriends() {
  return handleErrors(
    useQuery(supabase.from("friends").select("user_from_id,user_to_id")),
  );
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

//Returns all Sets
export function useSets(
  type: ManagementType,
  projectId: number,
  refetchIndex?: number,
) {
  const query = supabase
    .from("sets")
    .select("id,name,type,project_id")
    .eq("type", type)
    .eq("project_id", projectId);

  const { data, isLoading, error, mutate } = useQuery(query);
  if (!refetchIndex) return { data, isLoading, error };
  useEffect(() => {
    mutate();
  }, [refetchIndex]);

  return { data, isLoading, error };
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
  return handleErrors(
    useQuery(
      supabase
        .from("flashcards")
        .select("id,question,answer,priority,set_id")
        .eq("set_id", setId),
    ),
  );
}

export function useFlashcardsMultipleSets(sets: { id: number; name: string; type: number; project_id: number }[]) {
  const setIds = sets.map(set => set.id);

  return handleErrors(
    useQuery(
      supabase
        .from("flashcards")
        .select("id,question,answer,priority,set_id")
        .in("set_id", setIds),
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
export function useExercises(setId: number) {
  return handleErrors(
    useQuery(
      supabase
        .from("exercises")
        .select("id,question,priority,set_id")
        .eq("set_id", setId),
    ),
  );
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
export function useAnswersExercises(exerciseId: number) {
  return handleErrors(
    useQuery(
      supabase
        .from("answers_exercises")
        .select("id,answer,exercise,is_correct")
        .eq("exercise", exerciseId),
    ),
  );
}

export function useExercisesAndAnswers(setId: number){
  return handleErrors(
    useQuery(
      supabase
      .from("exercises")
      .select("id,question,priority,set_id")
      //.eq("set_id", setId)
    )
  )
}

export function useUpsertAnswersExercise() {
  return handleErrors(
    useUpsertMutation(
      supabase.from("answers_exercises"),
      ["id"],
      "id,answer,exercise,is_correct",
    ),
  );
}

export function useLinks(projectId: number) {
  return handleErrors(
    useQuery(
      supabase
        .from("links")
        .select("id,link_url,learning_project,title,subtitle,description")
        .eq("learning_project", projectId),
    ),
  );
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

/**
 * Display alerts.
 * @returns functions to display alerts.
 */
export function useAlerts() {
  const dispatch = useAlertsStore((state) => state.dispatch);

  return {
    alert: (config: Partial<Alert>) => {
      dispatch(config);
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
        icon: "information",
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
