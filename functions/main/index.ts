import { serve } from "https://deno.land/std@0.131.0/http/server.ts";
import * as jose from "https://deno.land/x/jose@v4.14.4/index.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.38.4";
import dayjs from "https://esm.sh/dayjs@1.11.10";
import { GameState, PrivateRoomState, PublicRoomState } from "../rooms.ts";

console.log("main function started");

const JWT_SECRET = Deno.env.get("JWT_SECRET");
const VERIFY_JWT = Deno.env.get("VERIFY_JWT") === "true";

function getAuthToken(req: Request) {
  const authHeader = req.headers.get("authorization");
  if (!authHeader) {
    throw new Error("Missing authorization header");
  }
  const [bearer, token] = authHeader.split(" ");
  if (bearer !== "Bearer") {
    throw new Error(`Auth header is not 'Bearer {token}'`);
  }
  return token;
}

async function verifyJWT(jwt: string): Promise<boolean> {
  const encoder = new TextEncoder();
  const secretKey = encoder.encode(JWT_SECRET);
  try {
    await jose.jwtVerify(jwt, secretKey);
  } catch (err) {
    console.error(err);
    return false;
  }
  return true;
}
// TODO: Whiteboard realtime use Presence!!
// TODO: https://supabase.com/docs/guides/realtime/presence#sending-state
const supabase = createClient(
  Deno.env.get("SUPABASE_URL") ?? "",
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
);

// @ from rooms.ts
enum ScreenState {
  LOBBY = "lobby",
  INGAME = "ingame",
  ROUND_SOLUTION = "round-solution", // after ingame and before round results screen
  ROUND_RESULTS = "round-results", // after round solution screen
  END_RESULTS = "end-results", // game end
}
// @ from rooms.ts
enum GameState {
  EXERCISES = "exercises",
  FLASHCARDS = "flashcards",
  WHITEBOARD = "whiteboard",
}

const ROUND_SOLUTION_DURATION = 4000;
const ROUND_RESULTS_DURATION = 5000;

// listen for realtime update from user_submitted_answers then update public_room_state -> ne race dontion mit game loop unten!

setInterval(async () => {
  const start = performance.now();
  // TODO: main game state loop here

  // TODO: for each public_room_state:
  const { data: publicRoomStates } = await supabase
    .from("public_room_states")
    .select("data,room_id");
  if (!publicRoomStates) return; /* deno assert is not null */

  const { data: privateRoomSates } = await supabase
    .from("private_room_states")
    .select("data,room_id");
  if (!privateRoomSates) return; /* deno assert is not null */

  const { data: playerAnswers } = await supabase
    .from("player_answers")
    .select("*");

  /**  // FIXME: race condition wenn mehre edge fucntin aufrufen und JSON updaten -> besser queue? 
    -> JSONB ok and update though postgres jsonb functions -> supabase doesnt support jsonb functions! -> pg function
    das hier main loop ok. nur bei answer updaten from clients race condition (!)

    lösung?? für updates von client pg fucntion callen die mit SELECT * FOR UPDATE die rows locked ???
    client callen edge function -> edge function callt pg function die row lockt und updatet. ????
    => wahrscheinlich beste idee. 

    solved: revoke all: wie pg function nur callable from server edge function machen

    alternative: TRANSACTION ISOLATION LEVEL SERILIZABLE
    ^^^bullshit ist geklärt -> extra table.
    */

  // TODO: wie mentimeter je schneller (und richtig) man antwortet desto mehr Punkte pro Runde

  for (const state of publicRoomStates) {
    const newState = state.data as PublicRoomState;
    const privateState = privateRoomSates.find(
      (prs) => prs.room_id === state.room_id,
    )?.data as PrivateRoomState;
    // Later TODO: |> if players is not in room -> remove them from the players[]. later. Performacne cost?

    // TODO: |> foreach player in room -> update currentCorrect if player has submitted an answer
    // TODO: only do this when timer ends  ?
    for (const player of newState.players) {
      const playerAnswer = playerAnswers?.find(
        (pa) =>
          pa.user_id === player.id &&
          pa.room_id === state.room_id &&
          pa.round === newState.round,
      );
      if (!playerAnswer) continue;
      player.currentCorrect =
        playerAnswer.answer_correct; /* TODO: gameoption: if plr cant change answer -> ignore when currentCorrect !== null */
      player.currentTimeNeeded = playerAnswer.answer_time;
    }

    /**
     * ScreenState:
     * LOBBY -> (*) INGAME -> ROUND_SOLUTION [~2s] -> ROUND_RESULTS [~2s + ~3s] -> * OR END_RESULTS
     */
    if (
      // TODO: |> if screen == INGAME && roundEndsAt < now (~ round is over) -> show ROUND_SOLUTION
      newState.screen === ScreenState.INGAME &&
      (newState.roundEndsAt < dayjs().valueOf() || // OR if all players answered -> show ROUND_SOLUTION
        newState.players.every((p) => p.currentCorrect !== null))
    ) {
      newState.screen = ScreenState.ROUND_SOLUTION;
      // Tuple [answer (string), percentage of player who chose this answer (0-100), isCorrect (boolean)]

      let submittedAnswers = 0;
      newState.answersPercentage = playerAnswers
        ?.filter(
          (pa) => pa.room_id === state.room_id && pa.round === newState.round,
        )
        .reduce(
          (acc: [string, number, boolean][], pa) => {
            const player = newState.players.find((p) => p.id === pa.user_id);
            if (!player) return acc;
            submittedAnswers++;
            // if answer already exists in acc -> increment percentage
            if (acc.some((e) => e[0] === pa.answer)) {
              return acc.map((e) =>
                e[0] === pa.answer /* FIXME */
                  ? [e[0], e[1] + 100 / submittedAnswers, e[2]]
                  : e,
              );
            } else
              return [
                ...acc /* FIXME */,
                [pa.answer, 100 / submittedAnswers, pa.answer_correct],
              ];
          },
          [] as [string, number, boolean][],
        );
      // TODO: ....
    } else if (
      // TODO: |> else if screen == ROUND_SOLUTION && roundEndsAt + 2s < now (~ show ROUND_SOLUTION for few secs) -> show ROUND_RESULTS
      newState.screen === ScreenState.ROUND_SOLUTION &&
      newState.roundEndsAt + ROUND_SOLUTION_DURATION < dayjs().valueOf()
    ) {
      newState.screen = ScreenState.ROUND_RESULTS;
    } else if (
      // TODO: |> else if screen == ROUND_RESULTS && roundEndsAt + 3s < now (~ show ROUND_RESULTS for few secs)
      newState.screen === ScreenState.ROUND_RESULTS &&
      newState.roundEndsAt + ROUND_SOLUTION_DURATION + ROUND_RESULTS_DURATION <
        dayjs().valueOf()
    ) {
      newState.answersPercentage = null;
      newState.players = newState.players.map((player) => {
        const plr = playerAnswers?.find(
          (plr) =>
            plr.user_id === player.id &&
            plr.room_id === state.room_id &&
            plr.round === newState.round &&
            plr.answer_correct,
        );
        return {
          ...player,
          score: !plr
            ? player.score
            : player.score +
              (privateState.roundDuration * 1000 - plr.answer_time),
          currentCorrect: null,
          currentTimeNeeded: null,
        };
      });
      if (newState.round + 1 <= newState.totalRounds) {
        // TODO: |  |> if current round + 1 <= total rounds -> load next question, increment current round, update scores. show INGAME screen.
        newState.round += 1;
        newState.roundBeganAt = dayjs().valueOf();
        newState.roundEndsAt =
          dayjs().valueOf() + privateState.roundDuration * 1000;
        newState.screen = ScreenState.INGAME;

        // Load next question
        switch (newState.game) {
          case GameState.EXERCISES:
            newState.question =
              privateState.gameData.exercises[newState.round - 1].question;
            newState.possibleAnswers =
              privateState.gameData.exercises[newState.round - 1].answers;
            break;
          case GameState.FLASHCARDS:
            newState.question =
              privateState.gameData.flashcards[newState.round - 1].question;
            break;
          default:
            console.error("invalid game type");
            continue;
        }
      } else {
        // TODO: |  |> else current round + 1 > total rounds -> game is over. save scores to DB, achievemnts, do nothing.
        newState.screen = ScreenState.END_RESULTS;
      }
    }

    console.log(newState);
    await supabase
      .from("public_room_states")
      .update({ data: newState })
      .eq("room_id", state.room_id);
  }

  const end = performance.now();
  console.log(
    `${new Date().toISOString()} | main_loop: updated ${
      publicRoomStates.length
    } states in ${end - start}ms`,
  );
}, 1000);

serve(async (req: Request) => {
  if (req.method !== "OPTIONS" && VERIFY_JWT) {
    try {
      const token = getAuthToken(req);
      const isValidJWT = await verifyJWT(token);

      if (!isValidJWT) {
        return new Response(JSON.stringify({ msg: "Invalid JWT" }), {
          status: 401,
          headers: { "Content-Type": "application/json" },
        });
      }
    } catch (e) {
      console.error(e);
      return new Response(JSON.stringify({ msg: e.toString() }), {
        status: 401,
        headers: { "Content-Type": "application/json" },
      });
    }
  }

  const url = new URL(req.url);
  const { pathname } = url;
  const path_parts = pathname.split("/");
  const service_name = path_parts[1];

  if (!service_name || service_name === "") {
    const error = { msg: "missing function name in request" };
    return new Response(JSON.stringify(error), {
      status: 400,
      headers: { "Content-Type": "application/json" },
    });
  }

  const servicePath = `/home/deno/functions/${service_name}`;
  console.error(`serving the request with ${servicePath}`);

  const memoryLimitMb = 150;
  const workerTimeoutMs = 1 * 60 * 1000;
  const noModuleCache = false;
  const importMapPath = null;
  const envVarsObj = Deno.env.toObject();
  const envVars = Object.keys(envVarsObj).map((k) => [k, envVarsObj[k]]);

  try {
    const worker = await EdgeRuntime.userWorkers.create({
      servicePath,
      memoryLimitMb,
      workerTimeoutMs,
      noModuleCache,
      importMapPath,
      envVars,
    });
    return await worker.fetch(req);
  } catch (e) {
    const error = { msg: e.toString() };
    return new Response(JSON.stringify(error), {
      status: 500,
      headers: { "Content-Type": "application/json" },
    });
  }
});
