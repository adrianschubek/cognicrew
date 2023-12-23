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
  ScreenState,
} from "../rooms.ts";
import dayjs from "https://esm.sh/dayjs@1.11.10";

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

    if (!user) return err("User not found (#20)", 400);

    // TODO: move to helper function
    // get current room user is in
    const { data: roomData, error: roomError } = await supabase
      .from("profiles")
      .select("room_id")
      .eq("id", user?.id)
      .single();
    if (roomError || !roomData) return err("User is not in a room (#21)", 400);

    const rid: string = roomData.room_id;
    // console.log(rid);

    const body = (await req.json()) as RoomClientUpdate;
    // console.log(body);

    // fetch private state
    const { data: rawPrivateState, error: rdataerror } = await supabase
      .from("private_room_states")
      .select("data")
      .eq("room_id", rid)
      .single();
    const privateState = rawPrivateState?.data as PrivateRoomState;
    // console.log(privateState);

    if (rdataerror || !rawPrivateState)
      return err("Could not fetch game data (#22)", 500);

    // fetch public state
    const { data: rawPublicState, error: rdataerror2 } = await supabase
      .from("public_room_states")
      .select("data")
      .eq("room_id", rid)
      .single();
    const publicState = rawPublicState?.data as PublicRoomState;
    // console.log(publicState);

    if (rdataerror2 || !rawPublicState)
      return err("Could not fetch game data (#23)", 500);

    switch (body.type) {
      case "flashcard_answer":
      case "exercise_answer": {
        // check if round is active
        if (
          publicState.roundEndsAt < dayjs().valueOf() ||
          publicState.roundBeganAt > dayjs().valueOf()
        )
          return err("Round is over (#24A)", 400);
        // check if round is still active
        if (publicState.screen !== ScreenState.INGAME)
          return err("Round is over (#24B)", 400);

        // check and save if answer is correct
        const { error } = await supabase.from("player_answers").upsert({
          room_id: rid,
          user_id: user.id,
          round: publicState.round,
          /* correct === user_answers */
          answer_correct:
            body.type === "exercise_answer"
              ? privateState.gameData.exercises[
                  publicState.round - 1
                ].correct.every((e) => body.answerIndex.includes(e)) &&
                body.answerIndex.every((e) =>
                  privateState.gameData.exercises[
                    publicState.round - 1
                  ].correct.includes(e),
                )
              : body.answer ===
                privateState.gameData.flashcards[publicState.round - 1]
                  .answer /* TODO. maybe save actual answer to display user answers with % */,
          answered_at: dayjs().valueOf(),
          answer_time: dayjs().valueOf() - publicState.roundBeganAt,
          answer:
            body.type === "exercise_answer"
              ? body.answerIndex.toString()
              : body.answer,
        });
        if (error) {
          return err("Could not save answer (#25)", 500);
        }
        break;
      }
      case "reset_room": {
        // FIXME: Disclaimer
        return err(
          "The 'reset_room' command is currently unavailable due to a potential critical error that causes the game loop to crash. Please restart the app to continue (#26X)",
          500,
        );

        // => reset room back to lobby if host. ---nein otherwise leave room (clientside return true to leave room for non host)
        // check if user is host
        // FIXME: refactor use is_host in publicState
        const { data: hostData, error: hostError } = await supabase
          .from("rooms")
          .select("host")
          .eq("id", rid)
          .single();
        if (hostError || !hostData)
          return err("Could not fetch host (#26)", 500);

        if (hostData.host !== user.id) await supabaseUser.rpc("leave_room");
        else {
          // reset room
          // submit command to queue table so that main thread can poll queue for changes and execute it
          const { error: errSaveQueue } = await supabase.from("queue").insert({
            room_id: rid,
            type: "reset_room",
            data: null,
          });
          if (errSaveQueue) return err("Could not queue command (#30)", 500);
        }
        break;
      }
      case "skip_round":
        return err("Not implemented (#27)", 501);
        break;
      case "end_game":
        return err("Not implemented (#27A)", 501);

        break;
      default:
        return err(`Invalid action "${(body as any).type} (#28)"`, 400);
    }

    console.log(`room-update: took ${performance.now() - start}ms`);
    return new Response("OK", { status: 200 });
  } catch (_) {
    return err("Something went wrong (#29)", 500);
  }
});
