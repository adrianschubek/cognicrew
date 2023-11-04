import { supabase } from "../supabase";
import { Database } from "../types/supabase";

/**
 * @deprecated Use hook useUsername instead.
 */
export async function getUsername(uid: string): Promise<string> {
  const { data, error } = await supabase
    .from("profiles")
    .select("username")
    .eq("id", uid);
  if (error) throw error;
  return data[0].username;
}

/**
 * @deprecated Use hook useAchievements instead.
 */
export async function getAchievements(): Promise<
  Database["public"]["Tables"]["achievements"]["Row"][]
> {
  const { data: achievements, error } = await supabase
    .from("achievements")
    .select("*")
    .order("id");
  if (error) throw error;
  return achievements;
}
