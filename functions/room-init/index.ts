// verify this is called by webhook. Should only be called by database trigger on room creation.

// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.177.1/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.38.4";
import { PublicRoomState } from "../../types/rooms.ts";

serve(async (req) => {
  try {
    const supabase = createClient(
      Deno.env.get("SUPABASE_URL") ?? "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
    );

    const supabaseUser = createClient(
      Deno.env.get("SUPABASE_URL") ?? "",
      Deno.env.get("SUPABASE_ANON_KEY") ?? "",
      {
        global: {
          headers: { Authorization: req.headers.get("Authorization")! },
        },
      },
    );

    const {
      data: { user },
    } = await supabaseUser.auth.getUser();

    // if not called from webhook, return 403 (check ?secret=...)
    // FIXME: put secret somewhere safe into env var.

    // => host should invoke it on game satrt from frontend!

    /*  const SECRET = "Ur7diwgmWzT7g8er9LV6PM3HAURXM6vJ";
    if (!(await req.url.includes(`secret=${SECRET}`))) {
      return new Response("Function was not called by database", {
        status: 403,
      });
    } */

    // get current room user is in
    const { data: roomData, error: roomError } = await supabase
      .from("profiles")
      .select("room_id")
      .eq("id", user?.id)
      .single();
    if (roomError)
      return new Response("User is not in a room", { status: 400 });

    const rid = roomData.room_id;
    console.log(rid);

    // check host is owner of room
    const { data, error } = await supabase
      .from("rooms")
      .select("*")
      .eq("host", user?.id)
      .eq("id", rid)
      .eq("is_ingame", false)
      .single();

    console.log(data);

    if (error) return new Response("User is not host of room", { status: 401 });

    // TODO: create supabase db fucntino that schedules cronjob. use for round duration (30s) then let it call "room-init ipdate" !
    
    const body = await req.json(); // <-- erro already read?
    console.log(body)
    console.log(req)

    return new Response("OK", { status: 200 });
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

        const publicState: PublicRoomState = {};

        // TODO: save data to private_state
        // TODO: save data to public_state
        // TODO: set is_ingame to true (close lobby)

        return new Response(JSON.stringify({ data }), {
          headers: { "Content-Type": "application/json" },
          status: 200,
        });
      }
      /**
       * if is_ingame updated -> start game
       */
      case "UPDATE":
        return new Response("Not implemented yet UPDATE", { status: 501 });
        break;
      /**
       * old_record.project_id is the room id
       */
      case "DELETE":
        return new Response("Not implemented yet DELETE", { status: 501 });
        break;
      default:
        return new Response("Error Invalid body type!", { status: 400 });
    }
  } catch (err) {
    return new Response(String(err?.message ?? err), { status: 504 });
  }
  return new Response("????", { status: 500 });
});

// To invoke:
// curl 'http://localhost:<KONG_HTTP_PORT>/functions/v1/hello' \
//   --header 'Authorization: Bearer <anon/service_role API key>'
