import { useAuth } from "../providers/AuthProvider";
import { Alert, useAlertsStore } from "../stores/AlertsStore";
import {
  useDeleteItem,
  useDeleteMutation,
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
 * Returns all achievements.
 */
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

//Returns all Sets
export function useSets(type: ManagementType, projectId: number) {
  return handleErrors(
    useQuery(
      supabase.from("sets").select("id,name,type,project_id").eq("type", type).eq("project_id", projectId)
    ),
  );
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
      supabase.from("flashcards").select("id,question,answer,priority,set_id").eq("set_id", setId)
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
      supabase.from("exercises").select("id,question,priority,set_id").eq("set_id", setId)
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
      supabase.from("answers_exercises").select("answer,exercise,is_correct").eq("exercise", exerciseId)
    ),
  );
}
export function useUpsertAnswersExercise() {
  return handleErrors(
    useUpsertMutation(
      supabase.from("answers_exercises"),
      ["exercise"],
      "answer,exercise,is_correct",
    ),
  );
}
/**
 *  dont show duplicate alerts with same message.
 * Display alerts.
 * @returns An object with functions to display alerts.
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
