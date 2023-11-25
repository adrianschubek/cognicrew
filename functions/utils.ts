import { GameState, PrivateRoomState, PublicRoomState } from "./rooms.ts";

export function err(message: string, code: number = 400): Response {
  return new Response(JSON.stringify({ message }), { status: code });
}

/**
 * Create a new public game state
 * @param gameType which game type
 * @param round next round number
 * @param pubState current public game state
 * @param prvState current private game state
 * @returns next public game state
 */
export function nextRound(
  gameType: GameState,
  round: number,
  pubState: PublicRoomState,
  prvState: PrivateRoomState,
): PublicRoomState {
  return null;
}
