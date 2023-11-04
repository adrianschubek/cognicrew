import { useState, useEffect } from "react";
import { useAuth } from "../providers/AuthProvider";
import { getAchievements, getUsername } from "./queries";
import { useAlertsStore } from "../stores/AlertsStore";
import { Database } from "../types/supabase";

/**
 * Returns the username of the user with the given uid.
 * If no uid is given, the username of the current user is returned.
 * @param uid The uid of the user whose username to get.
 * @returns The username of the user with the given uid.
 * @deprecated Use useQuery with getUsername instead.
 */
export function useUsername(uid?: string): string {
  const { user } = useAuth();
  const [profilename, setProfilename] = useState("");
  const { error: errorAlert } = useAlerts();

  useEffect(() => {
    getUsername(uid ?? user.id)
      .then((name) => setProfilename(name))
      .catch((error) => errorAlert(error.message));
  }, [user.id]);

  return profilename;
}

/**
 * @deprecated Use useQuery with getAchievements instead.
 */
export function useAchievements(): Database["public"]["Tables"]["achievements"]["Row"][] {
  const [achievements, setAchievements] = useState([]);
  const { error: errorAlert } = useAlerts();

  useEffect(() => {
    getAchievements()
      .then((achievements) => setAchievements(achievements))
      .catch((error) => errorAlert(error));
  });
  return achievements;
}

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
