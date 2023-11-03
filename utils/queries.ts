import { supabase } from "../supabase";

export async function getUsername(uid: string): Promise<string> {
  const { data } = await supabase
    .from("profiles")
    .select("username")
    .eq("id", uid);
  return data[0].username;
}
