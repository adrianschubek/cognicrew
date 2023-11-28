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
import dayjs from "https://esm.sh/dayjs@1.11.10";
import { err } from "../utils.ts";

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
    if (roomError || !roomData)
      return err("User is not in a room (#40)", 400);

    const rid: string = roomData.room_id;
    // console.log(rid);

    // check host is owner of room
    const { data, error } = await supabase
      .from("rooms")
      .select("*")
      .eq("host", user?.id)
      .eq("id", rid)
      .eq("is_ingame", false)
      .single();
    if (error)
      return err(
        /* TODO: dont error. instead overwrite room (remove old room states first!)) */
        "User is not host of room or room is already ingame (#41)",
        400,
      );

    const pid: number = data.project_id;
    // console.log(data);

    // get all connected users in room
    const { data: users, error: errorUsers } = await supabase
      .from("profiles")
      .select("id,username")
      .eq("room_id", rid);
    if (errorUsers) throw errorUsers;

    const body = (await req.json()) as {
      /**
       * 0 = flashcard
       * 1 = quiz
       */
      type: 1 /* quiz */ | 0 /* flashcard */;
      sets: number[];
      roundDuration: number;
      numberOfRounds: number;
    };
    // console.log(body);

    // validate body
    if (body.type !== 0 && body.type !== 1)
      return err("Invalid type [rint:bvl0]", 400);
    if (body.sets.length === 0) return err("No sets selected (#42)", 400);
    if (body.roundDuration <= 0 || body.roundDuration > 600)
      return err("Invalid round duration (#43)", 400);
    if (body.numberOfRounds <= 0 || body.numberOfRounds > 100)
      return err("Invalid number of rounds (#44)", 400);

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
      .in("sets.id", body.sets)
      .single();
    if (errorGamedata || !gamedata) {
      throw errorGamedata;
    }

    // check if sets contain at least one exercise/flashcard
    const exercisesNum = gamedata.sets.flatMap((set) => set.exercises).length;
    const flashcardsNum = gamedata.sets.flatMap((set) => set.flashcards).length;
    if (
      (body.type === 1 && exercisesNum === 0) ||
      (body.type === 0 && flashcardsNum === 0)
    )
      return err(
        `Selected sets do not contain any ${
          body.type === 1 ? "questions" : "flashcards"
        } (#45)`,
        400,
      );

    // TODO: sort questions/flashacards randomly by priority

    const privateState: PrivateRoomState = {
      gameData: {
        exercises:
          body.type === 1
            ? gamedata.sets
                .map((set) => set.exercises)
                .flat()
                .map((exercise) => ({
                  id: exercise.id,
                  question: exercise.question,
                  answers: exercise.answers_exercises.map(
                    (answer) => answer.answer,
                  ),
                  priority: exercise.priority,
                  /* get correct answer index */
                  correct: exercise.answers_exercises.reduce(
                    (acc, answer, index) =>
                      answer.is_correct ? [...acc, index] : acc,
                    [] as number[],
                  ),
                }))
                .sort(
                  (a, b) => a.priority - b.priority,
                ) /* TODO: randomize/shuffle */
                .slice(0, body.numberOfRounds)
            : [],
        flashcards:
          body.type === 0
            ? gamedata.sets
                .map((set) => set.flashcards)
                .flat()
                .map((flashcard) => ({
                  id: flashcard.id,
                  question: flashcard.question,
                  priority: flashcard.priority,
                  answer: flashcard.answer,
                }))
                .sort(
                  (a, b) => a.priority - b.priority,
                ) /* TODO: randomize/shuffle */
                .slice(0, body.numberOfRounds)
            : [],
      },
      roundDuration: body.roundDuration,
    };
    console.log(privateState);

    // load first question/flashcard
    const publicState: PublicRoomState = {
      players: users.map((user) => ({
        id: user.id,
        username: user.username,
        score: 0,
        currentCorrect: null,
        currentTimeNeeded: null,
        // currentDone: null,
      })),
      screen: ScreenState.INGAME,
      game: body.type === 0 ? GameState.FLASHCARDS : GameState.EXERCISES,
      totalRounds: body.type === 1 ? exercisesNum : flashcardsNum,
      round: 1,
      question:
        body.type === 1
          ? privateState.gameData.exercises[0].question
          : privateState.gameData.flashcards[0].question,
      possibleAnswers:
        body.type === 1 ? privateState.gameData.exercises[0].answers : [],
      userAnswers: null,
      roundBeganAt: dayjs().valueOf(),
      roundEndsAt: dayjs().add(body.roundDuration, "second").valueOf(),
    };
    // console.log(publicState);

    // save to db
    const { error: errSavePriv } = await supabase
      .from("private_room_states")
      .upsert({
        room_id: rid,
        data: privateState,
        updated_at: new Date(),
      });
    if (errSavePriv) throw errSavePriv;

    const { error: errSavePub } = await supabase
      .from("public_room_states")
      .upsert({
        room_id: rid,
        data: publicState,
        updated_at: new Date(),
      });
    if (errSavePub) throw errSavePub;

    // set room to ingame (locks room)
    const { error: errSetIngame } = await supabase
      .from("rooms")
      .update({ is_ingame: true })
      .eq("id", rid);
    if (errSetIngame) throw errSetIngame;

    console.log(
      `room-init: created game states for room ${rid} "${gamedata.name}"`,
    );
    console.log(`room-init: took ${performance.now() - start}ms`);
    return new Response("OK", { status: 200 });
  } catch (_) {
    return err("Something went wrong (#46)", 500);
  }
});
