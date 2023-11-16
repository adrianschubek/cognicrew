// Called by players in a room to push changes/updates. (like submit an answer etc.)

import { serve } from "https://deno.land/std@0.177.1/http/server.ts";

serve(async (req) => {
  return new Response(JSON.stringify(await req.json()), {
    headers: { "Content-Type": "application/json" },
  });
// TODO: use immer to update state
  return new Response(
    `"Hello from Edge Functions! xxxxxyyyyyyyyyyyyyyyyyyyyyyyy"`,
    { headers: { "Content-Type": "application/json" } },
  );
});