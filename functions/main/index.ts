import { serve } from "https://deno.land/std@0.131.0/http/server.ts";
import * as jose from "https://deno.land/x/jose@v4.14.4/index.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.38.4";
import dayjs from "https://esm.sh/dayjs@1.11.10";
import { PublicRoomState } from "../rooms.ts";

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

// listen for realtime update from user_submitted_answers then update public_room_state -> ne race dontion mit game loop unten!

setInterval(async () => {
  const start = performance.now();
  // TODO: main game state loop here

  // TODO: for each public_room_state:
  const { data: publicRoomStates } = await supabase
    .from("public_room_states")
    .select("data,room_id");
  if (!publicRoomStates) return; /* deno assert is not null */

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
     * LOBBY -> (*) INGAME -> ROUND_SOLUTION [~2s] -> ROUND_RESULTS [~4s] -> * OR END_RESULTS
     */
    if (
      // TODO: |> if screen == INGAME && roundEndsAt < now (~ round is over) -> show ROUND_SOLUTION
      newState.screen === ScreenState.INGAME &&
      (newState.roundEndsAt < dayjs().valueOf() || // TODO: OR if all players answered -> show ROUND_SOLUTION
        newState.players.every((p) => p.currentCorrect !== null))
    ) {
      newState.screen = ScreenState.ROUND_SOLUTION;
    } else if (
      // TODO: |> else if screen == ROUND_SOLUTION && roundEndsAt + 2s < now (~ show ROUND_SOLUTION for few secs) -> show ROUND_RESULTS
      newState.screen === ScreenState.ROUND_SOLUTION &&
      newState.roundEndsAt + 2000 < dayjs().valueOf()
    ) {
      newState.screen = ScreenState.ROUND_RESULTS;
    } else if (
      // TODO: |> else if screen == ROUND_RESULTS && current round + 1 > total rounds -> show END_RESULTS
      newState.screen === ScreenState.ROUND_RESULTS &&
      newState.round + 1 > newState.totalRounds
    ) {
      newState.screen = ScreenState.END_RESULTS;
    } else if (
      // TODO: |> else if screen == ROUND_RESULTS && roundEndsAt + 4s < now (~ show ROUND_RESULTS for few secs)
      newState.screen === ScreenState.ROUND_RESULTS &&
      newState.roundEndsAt + 4000 < dayjs().valueOf()
    ) {
      newState.screen = ScreenState.INGAME;
      newState.round += 1;
      newState.roundEndsAt = dayjs().valueOf() + 10000;
    }
    // TODO: |  |> if current round + 1 <= total rounds -> load next question, increment current round, update scores. show INGAME screen.
    // TODO: |  |> else current round + 1 > total rounds -> game is over. save scores to DB, achievemnts, do nothing.

    // newState.question = "Alex " + Math.random();
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
