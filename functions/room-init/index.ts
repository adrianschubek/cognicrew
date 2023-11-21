// verify this is called by webhook. Should only be called by database trigger on room creation.

// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.177.1/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.38.4";
import {
  GameState,
  PrivateRoomState,
  PublicRoomState,
  ScreenState,
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

    // get current room user is in
    const { data: roomData, error: roomError } = await supabase
      .from("profiles")
      .select("room_id")
      .eq("id", user?.id)
      .single();
    if (roomError)
      return new Response("User is not in a room", { status: 400 });

    const rid: string = roomData.room_id;
    console.log(rid);

    // check host is owner of room
    const { data, error } = await supabase
      .from("rooms")
      .select("*")
      .eq("host", user?.id)
      .eq("id", rid)
      .eq("is_ingame", false)
      .single();
    if (error) return new Response("User is not host of room", { status: 401 });

    const pid: number = data.project_id;
    console.log(data);

    // get all connected users in room
    const { data: users, error: errorUsers } = await supabase
      .from("profiles")
      .select("id,username")
      .eq("room_id", rid);
    if (errorUsers) throw errorUsers;

    const body = (await req.json()) as {
      type: 0 /* quiz */ | 1 /* flashcard */;
      sets: number[];
      roundDuration: number;
      numberOfRounds: number;
    };
    console.log(body);

    // validate body
    if (body.type !== 0 && body.type !== 1)
      return new Response("Invalid type", { status: 400 });
    if (body.sets.length === 0)
      return new Response("No sets selected", { status: 400 });
    if (body.roundDuration <= 0 || body.roundDuration > 600)
      return new Response("Invalid round duration", { status: 400 });
    if (body.numberOfRounds <= 0 || body.numberOfRounds > 100)
      return new Response("Invalid number of rounds", { status: 400 });

    // private game state
    const { data: gamedata, error: errorGamedata } = await supabase
      .from("learning_projects")
      .select(
        `id,
            name,
            sets(
              name,
              exercises(
                id,
                question,
                priority,
                answers_exercises(
                  id,
                  answer,
                  is_correct
                )
              ),
              flashcards(
                id,
                question,
                priority,
                answer
              )
            )`,
      )
      .eq("id", pid)
      .single();
    if (errorGamedata || !gamedata) {
      throw errorGamedata;
    }

    const privateState: PrivateRoomState = {
      gameData: {
        exercises: gamedata.sets
          .map((set) => set.exercises)
          .flat()
          .map((exercise) => ({
            id: exercise.id,
            question: exercise.question,
            answers: exercise.answers_exercises.map((answer) => answer.answer),
            priority: exercise.priority,
            /* get correct answer index */
            correct: exercise.answers_exercises.reduce(
              (acc, answer, index) =>
                answer.is_correct ? [...acc, index] : acc,
              [] as number[],
            ),
          })),
        flashcards: gamedata.sets
          .map((set) => set.flashcards)
          .flat()
          .map((flashcard) => ({
            id: flashcard.id,
            question: flashcard.question,
            priority: flashcard.priority,
            answer: flashcard.answer,
          })),
      },
      playerAnswers: users.map((user) => ({
        id: user.id,
        exercises: [],
        flashcards: [],
      })),
    };
    console.log(privateState);

    const publicState: PublicRoomState = {
      players: users.map((user) => ({
        id: user.id,
        username: user.username,
        score: 0,
      })),
      screen: ScreenState.LOBBY,
      game: GameState.FLASHCARDS,
      totalRounds: 0,
      round: 0,
      question: "",
      possibleAnswers: [],
      roundEndsAt: undefined,
    };
    console.log(publicState);

    console.log("room-init: took " + (performance.now() - start) + "ms");
    return new Response("OK", { status: 200 });
  } catch (err) {
    return new Response(String(err?.message ?? err), { status: 504 });
  }
  return new Response("????", { status: 500 });
});

// To invoke:
// curl 'http://localhost:<KONG_HTTP_PORT>/functions/v1/hello' \
//   --header 'Authorization: Bearer <anon/service_role API key>'
