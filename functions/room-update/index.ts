// Called by players in a room to push changes/updates. (like submit an answer etc.)
// will trigger realtime updates for all other players in the room.

// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.177.1/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.38.4";
import { err } from "../utils.ts";
import {
  PrivateRoomState,
  PublicRoomState,
  RoomClientUpdate,
} from "../rooms.ts";

serve(async (req) => {
  const start = performance.now();
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

    // TODO: move to helper function
    // get current room user is in
    const { data: roomData, error: roomError } = await supabase
      .from("profiles")
      .select("room_id")
      .eq("id", user?.id)
      .single();
    if (roomError || !roomData)
      return err("User is not in a room [rupd:unf]", 400);

    const rid: string = roomData.room_id;
    console.log(rid);

    const body = (await req.json()) as RoomClientUpdate;
    console.log(body);

    // fetch private state
    const { data: rawPrivateState, error: rdataerror } = await supabase
      .from("private_room_states")
      .select("data")
      .eq("room_id", rid)
      .single();
    const privateState = rawPrivateState?.data as PrivateRoomState;
    console.log(privateState);

    if (rdataerror || !rawPrivateState)
      return err("Could not fetch game data [rupd:prv]", 500);

    // fetch public state
    const { data: rawPublicState, error: rdataerror2 } = await supabase
      .from("public_room_states")
      .select("data")
      .eq("room_id", rid)
      .single();
    const publicState = rawPublicState?.data as PublicRoomState;
    console.log(publicState);

    if (rdataerror2 || !rawPublicState)
      return err("Could not fetch game data [rupd:pub]", 500);

    switch (body.type) {
      case "flashcard-answer":
        return err("Not implemented [rupd:nimpl1]", 501);
        break;
      case "exercise-answer": {
        // FIXME: should i save the literial input of the uiser. OR should save whether its correct??
        // latter.

        // |> check if user answer is correct and save it to db. update public_room_state ONLY IN MAIN LOOP TO AVOID RACE CONDITION (currentCOrrect, etc.)
        // store "true" or "false" in db

        // what if user submits when round is over?

        // const { data, error } = await supabase.from("player_answers").upsert({
        //   room_id: rid,
        //   user_id: user?.id,
        //   answer: body.answerIndex.toString(),
        // });
        break;
      }
      case "reset-lobby":
        return err("Not implemented [rupd:nimpl2]", 501);
        break;
      case "skip-round":
        return err("Not implemented [rupd:nimpl3]", 501);
        break;
      default:
        return err(`Invalid action "${(body as any).type} [rupd:ivact]"`, 400);
    }

    console.log(`room-update: took ${performance.now() - start}ms`);
    return new Response("OK", { status: 200 });
  } catch (_) {
    return err("Something went wrong [rupd:uxpct]", 500);
  }
});
