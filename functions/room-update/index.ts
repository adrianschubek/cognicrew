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
      case "flashcard-answer":
      case "exercise-answer": {
        // |check if user answer is correct and save it to db. update public_room_state ONLY IN MAIN LOOP TO AVOID RACE CONDITION (currentCOrrect, etc.)
        // store "true" or "false" in db

        // check if round is active
        if (
          publicState.roundEndsAt < dayjs().valueOf() ||
          publicState.roundBeganAt > dayjs().valueOf()
        )
          return err("Round is over (#24a)", 400);
        // check if round is still active
        if (publicState.screen !== ScreenState.INGAME)
          return err("Round is over (#24b)", 400);

        // TODO: game option: can users change their answer?

        // check and save if answer is correct
        const { error } = await supabase.from("player_answers").upsert({
          room_id: rid,
          user_id: user.id,
          round: publicState.round,
          /* correct === user_answers */
          answer_correct:
            body.type === "exercise-answer"
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
            body.type === "exercise-answer"
              ? body.answerIndex.toString()
              : body.answer,
        });
        if (error) {
          return err("Could not save answer (#25)", 500);
        }
        break;
      }
      case "reset-room": {
        // check if user is host
        const { data: hostData, error: hostError } = await supabase
          .from("rooms")
          .select("host_id")
          .eq("id", rid)
          .single();
        break;
      }
      case "skip-round":
        return err("Not implemented (#27)", 501);
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
