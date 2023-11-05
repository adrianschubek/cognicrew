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
      supabase
        .from("public_profiles")
        .select("username")
        .eq("id", uid ?? user.id),
    ),
  );
}

/**
 * Returns all achievements.
 */
export function useAchievements() {
  return handleErrors(
    useQuery(supabase.from("achievements").select("id,name,icon_name,description").order("id")),
  );
}

/**
 * Display alerts.
 * @returns An object with functions to display alerts.
 */
export function useAlerts() {
  const { setOpen, setIcon, setTitle, setMessage, setOkText, setCancelText } =
    useAlertsStore();
  return {
    success: (message: string, title: string = "") => {
      setOpen(true);
      setIcon("check");
      setTitle(title);
      setMessage(message);
      setCancelText("");
    },
    error: (message: string, title: string = "") => {
      setOpen(true);
      setIcon("alert-circle");
      setTitle(title);
      setMessage(message);
      setCancelText("");
    },
  };
}
