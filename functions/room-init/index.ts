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
    // TODO: if option INSERT, DELETE, UPDATE do ....
    if (body.type === "INSERT") {
      return new Response(JSON.stringify(await req.json()));
    }

    switch (body.type) {
      case "INSERT": {
        const { data, error } = await supabase.from("learning_projects")
          .select(`id,
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
                  )`); // .eq("id",projectId)

        if (error) {
          throw error;
        }

        return new Response(JSON.stringify({ data }), {
          headers: { "Content-Type": "application/json" },
          status: 200,
        });
      }
      case "UPDATE":
        break;
      case "DELETE":
        break;
      default:
        return new Response("Error Invalid body type!");
    }
  } catch (err) {
    return new Response(String(err?.message ?? err), { status: 500 });
  }
});

// To invoke:
// curl 'http://localhost:<KONG_HTTP_PORT>/functions/v1/hello' \
//   --header 'Authorization: Bearer <anon/service_role API key>'