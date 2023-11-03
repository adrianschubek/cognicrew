import { useState, useEffect } from "react";
import { useAuth } from "../providers/AuthProvider";
import { getUsername } from "./queries";

export function useUsername(uid?: string): string {
  const { user } = useAuth();
  const [profilename, setProfilename] = useState("");

  useEffect(() => {
    getUsername(uid ?? user.id).then((name) => setProfilename(name));
  }, [user.id]);

  return profilename;
}
