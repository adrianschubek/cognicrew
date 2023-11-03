import { useState, useEffect } from "react";
import { useAuth } from "../providers/AuthProvider";
import { supabase } from "../supabase";

async function getUsername(uid: string): Promise<string> {
  const { data } = await supabase
    .from("profiles")
    .select("username")
    .eq("id", uid);
  return data[0].username;
}

export function useUsername(uid: string): string {
  const { user } = useAuth();
  const [profilename, setProfilename] = useState("");

  useEffect(() => {
    getUsername(user.id).then((name) => setProfilename(name));
  }, [user.id]);

  return profilename;
}
