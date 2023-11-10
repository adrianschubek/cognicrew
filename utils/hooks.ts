import { useAuth } from "../providers/AuthProvider";
import { useAlertsStore } from "../stores/AlertsStore";
import {
  useDeleteItem,
  useDeleteMutation,
  useQuery,
  useUpsertMutation,
} from "@supabase-cache-helpers/postgrest-swr";
import { supabase } from "../supabase";
import { ifMod } from "./common";
import { useCallback, useMemo } from "react";
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
    errorAlert(fn.error.message);
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
export function useSets(type: ManagementType) {
  return handleErrors(
    useQuery(
      supabase.from("sets").select("id,name,type,project_id").eq("type", type),
    ),
  );
}
export function useDeleteSet() {
  return handleErrors(useDeleteMutation(supabase.from("sets"), ["id"], "id")); 
}
export function useUpsertSet() {
  return useUpsertMutation(supabase.from("sets"), ["id"], "id"); 
}
/**
 * Display alerts.
 * @returns An object with functions to display alerts.
 */
export function useAlerts() {
  const resetActions = useCallback(() => {
    ifMod(oldOkText, "OK", setOkText); // TODO: refactor this. use single object for all state. allow multiple alerts/objects. stack them.
    ifMod(oldCancelText, "", setCancelText);
    ifMod(oldOkAction, () => {}, setOkAction);
    ifMod(oldCancelAction, () => {}, setCancelAction);
  }, []);

  const {
    open: oldOpen,
    icon: oldIcon,
    title: oldTitle,
    message: oldMessage,
    okText: oldOkText,
    cancelText: oldCancelText,
    okAction: oldOkAction,
    cancelAction: oldCancelAction,
    setOpen,
    setIcon,
    setTitle,
    setMessage,
    setOkText,
    setCancelText,
    setOkAction,
    setCancelAction,
  } = useAlertsStore();
  return {
    success: (message: string, title: string = "") => {
      ifMod(oldOpen, true, setOpen);
      ifMod(oldIcon, "check", setIcon);
      ifMod(oldTitle, title, setTitle);
      ifMod(oldMessage, message, setMessage);
      resetActions();
    },
    error: (message: string, title: string = "") => {
      ifMod(oldOpen, true, setOpen);
      ifMod(oldIcon, "alert-circle", setIcon);
      ifMod(oldTitle, title, setTitle);
      ifMod(oldMessage, message, setMessage);
      resetActions();
    },
    info: (message: string, title: string = "") => {
      ifMod(oldOpen, true, setOpen);
      ifMod(oldIcon, "information", setIcon);
      ifMod(oldTitle, title, setTitle);
      ifMod(oldMessage, message, setMessage);
      resetActions();
    },
    okcancel: (
      message: string,
      title: string = "",
      okAction: () => void = () => {},
      cancelAction: () => void = () => {},
      okText: string = "OK",
      cancelText: string = "Cancel",
    ) => {
      ifMod(oldOpen, true, setOpen);
      ifMod(oldIcon, "information", setIcon);
      ifMod(oldTitle, title, setTitle);
      ifMod(oldMessage, message, setMessage);
      ifMod(oldOkText, okText, setOkText);
      ifMod(oldCancelText, cancelText, setCancelText);
      ifMod(oldOkAction, okAction, setOkAction);
      ifMod(oldCancelAction, cancelAction, setCancelAction);
    },
  };
}
