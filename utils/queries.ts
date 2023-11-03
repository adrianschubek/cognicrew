import { supabase } from "../supabase";
import { Database } from "../types/supabase";

export async function getUsername(uid: string): Promise<string> {
  const { data } = await supabase
    .from("profiles")
    .select("username")
    .eq("id", uid);
  return data[0].username;
}
export async function getAchievements(): Promise<Database["public"]["Tables"]["achievements"]["Row"][]>{
  const { data: achievements} = await supabase
  .from('achievements').select('*').order('id');
  return achievements ;
}
