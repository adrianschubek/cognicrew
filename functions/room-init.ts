// verify this is called by webhook. Should only be called by database trigger on room creation.

// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

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

// To invoke:
// curl 'http://localhost:<KONG_HTTP_PORT>/functions/v1/hello' \
//   --header 'Authorization: Bearer <anon/service_role API key>'
