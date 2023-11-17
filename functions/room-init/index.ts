// verify this is called by webhook. Should only be called by database trigger on room creation.

// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.177.1/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.38.4";

serve(async (req) => {
  try {
    const supabase = createClient(
      Deno.env.get("SUPABASE_URL") ?? "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
    );

    // if not called from webhook, return 403 (check ?secret=...)
    // FIXME: put secret somewhere safe into env var.
    const SECRET = "Ur7diwgmWzT7g8er9LV6PM3HAURXM6vJ";
    if (!(await req.url.includes(`secret=${SECRET}`))) {
      return new Response("Function was not called by database", {
        status: 403,
      });
    }
    const body = await req.json();
    // body.record.id is the room id
    // TODO: if option INSERT, DELETE, UPDATE do ....
    switch (body.type) {
      /**
       * new room created. copy all project data into private_state.
       */
      case "INSERT": {
        const { data, error } = await supabase
          .from("learning_projects")
          .select(
            `id,
                  name,
                  sets(
                    name,
                    exercises(
                      id,
                      question,
                      answers_exercises(
                        id,
                        answer,
                        is_correct
                      )
                    ),
                    flashcards(
                      id,
                      question,
                      answer
                    )
                  )`,
          )
          .eq("id", body.record.project_id);

        if (error) {
          throw error;
        }
        return new Response(JSON.stringify({ data }), {
          headers: { "Content-Type": "application/json" },
          status: 200,
        });
      }
      /**
       * if is_ingame updated -> start game
       */
      case "UPDATE":
        break;
      /**
       * old_record.project_id is the room id
       */
      case "DELETE":
        break;
      default:
        return new Response("Error Invalid body type!", { status: 400 });
    }
  } catch (err) {
    return new Response(String(err?.message ?? err), { status: 500 });
  }
});

// To invoke:
// curl 'http://localhost:<KONG_HTTP_PORT>/functions/v1/hello' \
//   --header 'Authorization: Bearer <anon/service_role API key>'
