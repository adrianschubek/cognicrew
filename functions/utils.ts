
export function err(message: string, code: number = 400): Response {
  return new Response(JSON.stringify({ message }), { status: code });
}