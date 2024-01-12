import { serve } from "https://deno.land/std@0.131.0/http/server.ts";
import * as jose from "https://deno.land/x/jose@v4.14.4/index.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.38.4";
import dayjs from "https://esm.sh/dayjs@1.11.10";
import {
  PrivateRoomState,
  PublicRoomState,
  UserProjectStats,
} from "../rooms.ts";
import { Database, Json } from "../../types/supabase.ts";

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

/**
 * Game Loop interval helpers
 */

let gameLoopIntervalId: number | null = null;
async function startGameLoop(handler: () => Promise<void>, interval: number) {
  if (gameLoopIntervalId === null) {
    await handler();
    gameLoopIntervalId = setInterval(handler, interval);
  } else {
    console.warn(
      "Interval is already running. Stop it first before starting a new one.",
    );
  }
}

function stopGameLoop() {
  if (gameLoopIntervalId !== null) {
    clearInterval(gameLoopIntervalId);
    gameLoopIntervalId = null;
  } else {
    console.warn("No interval is currently running.");
  }
}

async function updateGameLoop(
  handler: () => Promise<void>,
  newInterval: number,
) {
  stopGameLoop();
  await startGameLoop(handler, newInterval);
}

const supabase = createClient<Database>(
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

const enum State {
  ROUND_SOLUTION,
  ROUND_RESULTS,
  INGAME_OR_END_RESULTS,
  AFTER_END_RESULTS,
}

const ROUND_SOLUTION_DURATION = 3000; // ms
const ROUND_RESULTS_DURATION = 4000;
const END_RESULTS_DURATION = 10000;

async function mainLoop() {
  const start = performance.now();
  let commandsCount = 0;

  const { data: publicRoomStates } = await supabase
    .from("public_room_states")
    .select("data,room_id");
  if (!publicRoomStates) return;

  const { data: privateRoomStates } = await supabase
    .from("private_room_states")
    .select("data,room_id");
  // This can happen after a game is complete and room is now back in lobby
  if (!privateRoomStates) return;

  const { data: playerAnswers } = await supabase
    .from("player_answers")
    .select("*");

  for (const room of publicRoomStates) {
    const publicState = room.data as PublicRoomState;
    const privateState = privateRoomStates.find(
      (prs) => prs.room_id === room.room_id,
    )?.data as PrivateRoomState;
    // safeguard for unexpected desync
    if (!privateState) continue;

    // |> foreach player in room -> update if player has submitted an answer already
    updatePlayerAnswers(publicState, room, playerAnswers);

    /**
     * ScreenState:
     * LOBBY -> (*) INGAME -> ROUND_SOLUTION [~2s] -> ROUND_RESULTS [~2s + ~3s] -> * OR END_RESULTS
     * initial state is LOBBY (if already played once) or INGAME (if fresh lobby)
     */
    switch (nextState(publicState)) {
      case State.ROUND_SOLUTION:
        await stateRoundSolution(
          publicState,
          privateState,
          room,
          playerAnswers,
        );
        break;
      case State.ROUND_RESULTS:
        await stateRoundResults(publicState, privateState, room, playerAnswers);
        break;
      case State.INGAME_OR_END_RESULTS:
        await stateIngameOrEndResults(publicState, privateState);
        break;
      case State.AFTER_END_RESULTS:
        await stateAfterEndResults(publicState, room);
        break;
      default:
        break;
    }

    // Process commands for this room
    commandsCount = await processCommands(publicState, privateState, room);

    console.log(publicState);
    await supabase
      .from("public_room_states")
      .update({ data: publicState })
      .eq("room_id", room.room_id);
  }

  // Process achievements
  await processAchievements();

  const end = performance.now();
  console.log(
    /* use `logs -t` to show timestamps */
    `main_loop: ${
      publicRoomStates.length
    } states and ${commandsCount} commands processed in ${end - start}ms`,
  );
}

/**
 * States
 */

async function stateRoundResults(
  publicState: PublicRoomState,
  privateState: PrivateRoomState,
  room: { data: Json; room_id: string },
  playerAnswers: Database["public"]["Tables"]["player_answers"]["Row"][] | null,
) {
  publicState.screen = ScreenState.ROUND_RESULTS;
  publicState.players = publicState.players.map((player) => {
    const plr = playerAnswers?.find(
      (plr) =>
        plr.user_id === player.id &&
        plr.room_id === room.room_id &&
        plr.round === publicState.round &&
        plr.answer_correct,
    );
    return {
      ...player,
      score: !plr
        ? player.score
        : player.score +
          /* Score algorithm: 1p per 100ms. [0,100] */
          Math.round(
            (Math.max(
              0,
              Math.min(
                privateState.roundDuration * 1000,
                /* to account for networking latencies give players 2.5s for free */
                privateState.roundDuration * 1000 - plr.answer_time + 2500,
              ),
            ) /* Normalize to [0,100] */ /
              (privateState.roundDuration * 1000)) *
              100,
          ),
      currentCorrect: null,
      currentTimeNeeded: null,
    };
  });
}

async function stateRoundSolution(
  publicState: PublicRoomState,
  privateState: PrivateRoomState,
  room: { data: Json; room_id: string },
  playerAnswers: Database["public"]["Tables"]["player_answers"]["Row"][] | null,
) {
  publicState.screen = ScreenState.ROUND_SOLUTION;

  // if this triggered by all players already answered then set roundEndsAt to now so that the following screens don't delay.
  if (publicState.players.every((p) => p.currentCorrect !== null)) {
    publicState.roundEndsAt = dayjs().valueOf();
  }

  switch (publicState.game) {
    case GameState.EXERCISES: {
      let submittedAnswers = 0;
      const roundAnswers =
        privateState.gameData.exercises[publicState.round - 1];
      let answersWithCountWithIsCorrect: [string, number, boolean][] =
        roundAnswers.answers.map((answer, i) => [
          answer,
          0,
          roundAnswers.correct.includes(i),
        ]);

      for (const player of publicState.players) {
        const playerAnswer = playerAnswers?.find(
          (pa) =>
            pa.user_id === player.id &&
            pa.room_id === room.room_id &&
            pa.round === publicState.round,
        );
        if (!playerAnswer) continue;
        submittedAnswers += playerAnswer.answer.split(",").length;
        answersWithCountWithIsCorrect = answersWithCountWithIsCorrect.map(
          ([answer, count, isCorrect], i) => [
            answer,
            // playerAnswer.answer is the numeric index array for quiz game.
            count +
              (playerAnswer.answer
                .split(",")
                .map((a: string) => +a)
                .includes(i)
                ? 1
                : 0),
            isCorrect,
          ],
        );
      }
      publicState.userAnswers = answersWithCountWithIsCorrect.map(
        ([answer, count, isCorrect]) => ({
          answer,
          percentage: Math.max(
            0,
            Math.min(100, Math.floor((count / submittedAnswers) * 100)),
          ),
          isCorrect,
        }),
      );
      break;
    }
    case GameState.FLASHCARDS: {
      let submittedAnswers = 0;
      const roundAnswers = {
        ...privateState.gameData.flashcards[publicState.round - 1],
        answers:
          privateState.gameData.flashcards[publicState.round - 1].answer.split(
            ",",
          ),
      };
      const playerAnswersForRound =
        playerAnswers?.filter(
          (pa) => pa.room_id === room.room_id && pa.round === publicState.round,
        ) ?? [];
      // @ts-expect-error may contain fewer elements
      let answersWithCountWithIsCorrect: [string, number, boolean][] =
        roundAnswers.answers
          .map((answer, i) => [
            answer,
            0,
            roundAnswers.answers.includes(answer),
          ])
          .concat(
            playerAnswersForRound?.flatMap((pa) =>
              pa.answer
                .split(",")
                .map((ans) => [ans, 0, roundAnswers.answers.includes(ans)]),
            ) ?? [],
          )
          .filter(
            (v, i, a) => a.findIndex((t) => t[0] === v[0]) === i,
          ); /* remove duplicates */

      for (const pa of playerAnswersForRound) {
        submittedAnswers += pa.answer.split(",").length;
        console.log(submittedAnswers);
        answersWithCountWithIsCorrect = answersWithCountWithIsCorrect.map(
          ([answer, count, isCorrect], i) => [
            answer,
            count +
              (pa.answer.split(",").some((a: string) => a === answer) ? 1 : 0),
            isCorrect,
          ],
        );
        publicState.userAnswers = answersWithCountWithIsCorrect.map(
          ([answer, count, isCorrect]) => ({
            answer,
            percentage: Math.max(
              0,
              Math.min(100, Math.floor((count / submittedAnswers) * 100)),
            ),
            isCorrect,
          }),
        );
      }
      break;
    }
    case GameState.WHITEBOARD:
      break;
    default:
      console.error("invalid game type (#0)");
  }
}

async function stateIngameOrEndResults(
  publicState: PublicRoomState,
  privateState: PrivateRoomState,
) {
  publicState.userAnswers = null;
  publicState.players = publicState.players.map((player) => ({
    ...player,
    currentCorrect: null,
    currentTimeNeeded: null,
  }));

  if (publicState.round + 1 <= publicState.totalRounds) {
    // |  |> if current round + 1 <= total rounds -> load next question, increment current round, update scores. show INGAME screen.
    publicState.round += 1;
    publicState.roundBeganAt = dayjs().valueOf();
    publicState.roundEndsAt =
      dayjs().valueOf() + privateState.roundDuration * 1000;
    publicState.screen = ScreenState.INGAME;

    // Load next question
    switch (publicState.game) {
      case GameState.EXERCISES:
        publicState.question =
          privateState.gameData.exercises[publicState.round - 1].question;
        publicState.possibleAnswers =
          privateState.gameData.exercises[publicState.round - 1].answers;
        break;
      case GameState.FLASHCARDS:
        publicState.question =
          privateState.gameData.flashcards[publicState.round - 1].question;
        break;
      default:
        console.error("invalid game type");
        return;
    }
  } else {
    // |  |> else current round + 1 > total rounds -> game is over. save scores to DB, achievements, do nothing.
    publicState.screen = ScreenState.END_RESULTS;

    await updateStats(publicState, privateState);
  }
}

async function stateAfterEndResults(
  publicState: PublicRoomState,
  state: { data: Json; room_id: string },
) {
  // After game end / END_RESULTS screen is shown
  // don't close lobby instead let stay in obby so host can start new game
  publicState.screen = ScreenState.LOBBY;
  publicState.round = 0; // fixes bug where answers not updated in quiz game on startup

  // delete old game data
  await supabase
    .from("private_room_states")
    .delete()
    .eq("room_id", state.room_id);
  // delete player answers
  await supabase.from("player_answers").delete().eq("room_id", state.room_id);
}

/**
 * Utility functions
 */

async function processAchievements() {
  // TODO: HERE ALEX !!
}

/**
 * Returns the next state based on the current state or false if no state change is needed
 */
function nextState(publicState: PublicRoomState): State | false {
  if (
    // |> if screen == INGAME && roundEndsAt < now (~ round is over) -> show ROUND_SOLUTION
    publicState.screen === ScreenState.INGAME &&
    (publicState.roundEndsAt < dayjs().valueOf() || // OR if all players answered -> show ROUND_SOLUTION
      publicState.players.every((p) => p.currentCorrect !== null))
  )
    return State.ROUND_SOLUTION;
  else if (
    // |> else if screen == ROUND_SOLUTION && roundEndsAt + 2s < now (~ show ROUND_SOLUTION for few secs) -> show ROUND_RESULTS
    publicState.screen === ScreenState.ROUND_SOLUTION &&
    publicState.roundEndsAt + ROUND_SOLUTION_DURATION < dayjs().valueOf()
  )
    return State.ROUND_RESULTS;
  else if (
    // |> else if screen == ROUND_RESULTS && roundEndsAt + 3s < now (~ show ROUND_RESULTS for few secs)
    publicState.screen === ScreenState.ROUND_RESULTS &&
    publicState.roundEndsAt + ROUND_SOLUTION_DURATION + ROUND_RESULTS_DURATION <
      dayjs().valueOf()
  )
    return State.INGAME_OR_END_RESULTS;
  else if (
    publicState.screen === ScreenState.END_RESULTS &&
    publicState.roundEndsAt +
      ROUND_SOLUTION_DURATION +
      ROUND_RESULTS_DURATION +
      END_RESULTS_DURATION <
      dayjs().valueOf()
  )
    return State.AFTER_END_RESULTS;
  return false;
}

async function achieve(achievementId: number, userId: string) {
  const { error } = await supabase
    .from("user_achievements")
    .insert([{ achievement_id: achievementId, user_id: userId }]);
  if (error) console.error("Achievement Error: " + error);
}

/**
 * Updates player.currentCorrect and player.currentTimeNeeded in room state
 */
function updatePlayerAnswers(
  publicState: PublicRoomState,
  room: { data: Json; room_id: string },
  playerAnswers: Database["public"]["Tables"]["player_answers"]["Row"][] | null,
) {
  for (const player of publicState.players) {
    const playerAnswer = playerAnswers?.find(
      (pa) =>
        pa.user_id === player.id &&
        pa.room_id === room.room_id &&
        pa.round === publicState.round,
    );
    if (!playerAnswer) continue;
    player.currentCorrect = playerAnswer.answer_correct;
    player.currentTimeNeeded = playerAnswer.answer_time;
  }
}

async function processCommands(
  publicState: PublicRoomState,
  privateState: PrivateRoomState,
  room: { data: Json; room_id: string },
) {
  // Poll all commands from queue
  const { data: commands, error } = await supabase
    .from("queue")
    .delete()
    .neq("type", null)
    .select("id,room_id,type,data")
    .order("created_at", { ascending: true });
  if (error) console.error("queue: ", error);

  let commandsCount = 0;
  const roomCmds = commands?.filter((cmd) => cmd.room_id === room.room_id);
  if (roomCmds) {
    for (const cmd of roomCmds) {
      commandsCount++;
      switch (cmd.type) {
        case "reset_room":
          console.log("reset_room");

          await updateStats(publicState, privateState);

          publicState.screen = ScreenState.LOBBY;
          publicState.round = 0; // fixes bug where answers not updated in quiz game on startup

          // delete old game data
          await supabase
            .from("private_room_states")
            .delete()
            .eq("room_id", room.room_id);
          // delete player answers
          await supabase
            .from("player_answers")
            .delete()
            .eq("room_id", room.room_id);
          break;
        default:
          console.error(`Unhandled command type '${cmd.type}'`);
      }
    }
  }
  return commandsCount;
}

async function updateStats(
  publicState: PublicRoomState,
  privateState: PrivateRoomState,
) {
  let gameWonPlayerId;
  let maxScore = 0;
  let draw = true;

  for (const player of publicState.players) {
    if (player.score >= maxScore) {
      gameWonPlayerId = player.id;
      maxScore = player.score;
      draw = false;
    }
  }

  //Check if there are two "winners" resulting in a draw
  for (const player of publicState.players) {
    if (player.score == maxScore && player.id != gameWonPlayerId) {
      draw = true;
      break;
    }
  }

  for (const player of publicState.players) {
    const { data: dbstats, error } = await supabase
      .from("user_learning_projects")
      .select("stats")
      .eq("user_id", player.id)
      .eq("learning_project_id", privateState.projectId)
      .single();
    if (error) {
      console.error(error);
      continue;
    }

    const stats: UserProjectStats = (dbstats?.stats as UserProjectStats) ?? {
      scoreQuiz: 0,
      scoreFlashcards: 0,
      winsQuiz: 0,
      winsFlashcards: 0,
      timeSpentQuiz: 0,
      timeSpentFlashcards: 0,
      timeSpentWhiteboard: 0,
    };

    stats.scoreQuiz +=
      publicState.game == GameState.EXERCISES ? player.score : 0;
    stats.scoreFlashcards +=
      publicState.game == GameState.FLASHCARDS ? player.score : 0;
    stats.winsQuiz +=
      publicState.game == GameState.EXERCISES &&
      gameWonPlayerId == player.id &&
      !draw
        ? 1
        : 0;
    stats.winsFlashcards +=
      publicState.game == GameState.FLASHCARDS &&
      gameWonPlayerId == player.id &&
      !draw
        ? 1
        : 0;

    const timeSpentSeconds = Math.min(
      Math.max(0, (dayjs().valueOf() - publicState.gameBeganAt) / 1000),
      privateState.roundDuration * publicState.totalRounds,
    );
    stats.timeSpentQuiz +=
      publicState.game == GameState.EXERCISES ? timeSpentSeconds : 0;
    stats.timeSpentFlashcards +=
      publicState.game == GameState.FLASHCARDS ? timeSpentSeconds : 0;
    stats.timeSpentWhiteboard +=
      publicState.game == GameState.WHITEBOARD ? timeSpentSeconds : 0;

    const { error: errUpdate } = await supabase
      .from("user_learning_projects")
      .update({ stats })
      .eq("user_id", player.id)
      .eq("learning_project_id", privateState.projectId);
    if (errUpdate) console.error(errUpdate);
  }
}

startGameLoop(mainLoop, 1000);

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
    // @ts-expect-error Cannot find name 'EdgeRuntime'.deno-ts(2304)
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
