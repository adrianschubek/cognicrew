import "react-native-url-polyfill/auto";
import { createClient } from "@supabase/supabase-js";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { Database } from "./types/supabase";

export const supabase = createClient<Database>(
  "https://iptk.w101.de/",
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNjk3ODM5MjAwLAogICJleHAiOiAxODU1NjkyMDAwCn0.LU2OYjzUweZD40EcoyT0f4tY35IWlSdWRmcf8sBYcws",
  {
    auth: {
      storage: AsyncStorage,
      autoRefreshToken: true,
      persistSession: true,
      detectSessionInUrl: false,
    },
  }
);
