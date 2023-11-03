import { useState, useEffect } from "react";
import { useAuth } from "../providers/AuthProvider";
import { getUsername } from "./queries";

/**
 * Returns the username of the user with the given uid.
 * If no uid is given, the username of the current user is returned.
 * @param uid The uid of the user whose username to get.
 * @returns The username of the user with the given uid.
 */
export function useUsername(uid?: string): string {
  const { user } = useAuth();
  const [profilename, setProfilename] = useState("");

  useEffect(() => {
    getUsername(uid ?? user.id).then((name) => setProfilename(name));
  }, [user.id]);

  return profilename;
}
