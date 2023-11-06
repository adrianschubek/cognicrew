import { useAuth } from "../providers/AuthProvider";
import { useAlertsStore } from "../stores/AlertsStore";
import { useQuery } from "@supabase-cache-helpers/postgrest-swr";
import { supabase } from "../supabase";

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

/**
 * Display alerts.
 * @returns An object with functions to display alerts.
 */
export function useAlerts() {
  const {
    open: oldOpen,
    icon: oldIcon,
    title: oldTitle,
    message: oldMessage,
    cancelText: oldCancelText,
    setOpen,
    setIcon,
    setTitle,
    setMessage,
    setOkText,
    setCancelText,
  } = useAlertsStore();
  return {
    success: (message: string, title: string = "") => {
      if (oldOpen !== true) setOpen(true);
      if (oldIcon !== "check") setIcon("check");
      if (oldTitle !== title) setTitle(title);
      if (oldMessage !== message) setMessage(message);
      if (oldCancelText !== "") setCancelText("");
    },
    error: (message: string, title: string = "") => {
      if (oldOpen !== true) setOpen(true);
      if (oldIcon !== "alert-circle") setIcon("alert-circle");
      if (oldTitle !== title) setTitle(title);
      if (oldMessage !== message) setMessage(message);
      if (oldCancelText !== "") setCancelText("");
      // fixes too deep update depth
    },
  };
}
