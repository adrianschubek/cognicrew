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

// listen for realtime update from user_submitted_answers then update public_room_state -> ne race dontion mit game loop unten!

setInterval(async () => {
  const start = performance.now();
  // TODO: main game state loop here

  // TODO: for each public_room_state:
  const { data: pubRoomStatesObj } = await supabase
    .from("public_room_states")
    .select("data,room_id");

  const publicRoomStates = (pubRoomStatesObj ?? []).map(
    (pr) => pr.data,
  ) as PublicRoomState[];

  /**  // FIXME: race condition wenn mehre edge fucntin aufrufen und JSON updaten -> besser queue? 
    -> JSONB ok and update though postgres jsonb functions -> supabase doesnt support jsonb functions! -> pg function
    das hier main loop ok. nur bei answer updaten from clients race condition (!)

    lösung?? für updates von client pg fucntion callen die mit SELECT * FOR UPDATE die rows locked ???
    client callen edge function -> edge function callt pg function die row lockt und updatet. ????
    => wahrscheinlich beste idee. 

    solved: revoke all: wie pg function nur callable from server edge function machen

    alternative: TRANSACTION ISOLATION LEVEL SERILIZABLE

    */

    // TODO: wie mentimeter je schneller (und richtig) man antwortet desto mehr Punkte pro Runde

  for (const state of publicRoomStates) {
    // TODO: |> if players is not in room connected -> remove them from the players[]
    // TODO: |> if roundEndsAt < now (~ round is over)
    // TODO: |  |> if current round + 1 <= total rounds -> show ROUND_RESULTS
    // TODO: |  |> else current round + 1 > total rounds -> show END_RESULTS
    // TODO: |> if screen == ROUND_RESULTS and roundEndsAt + 4s < now (~ show ROUND_RESULTS for few secs)
    // TODO: |  |> if current round + 1 <= total rounds -> load next question, increment current round, update scores. show INGAME screen.
    // TODO: |  |> else current round + 1 > total rounds -> game is over. save scores to DB, achievemnts, do nothing.
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
