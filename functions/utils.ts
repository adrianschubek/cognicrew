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

export function shuffle<T>(array: T[]): T[] {
  const newArray = [...array];
  for (let i = newArray.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [newArray[i], newArray[j]] = [newArray[j], newArray[i]];
  }
  return newArray;
}