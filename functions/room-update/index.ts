// Called by players in a room to push changes/updates. (like submit an answer etc.)
// will trigger realtime updates for all other players in the room.

// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.177.1/http/server.ts";

serve(async (req) => {
  return new Response(JSON.stringify(await req.json()), {
    headers: { "Content-Type": "application/json" },
  });

});