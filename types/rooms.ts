export const enum ScreenState {
  LOBBY,
  INGAME,
  RESULTS,
}
export const enum GameState {
  QUIZ,
  FLASHCARDS,
  WHITEBOARD,
}
/**
 * (Realtime enabled) + timer + current game + current question [visible to client,  SELECT only]
 * Stored/updated inside public_rooms_state table. Will be send to lcient on each update.
 */ // TODO: Supabase on insert send webhook -> edge function!!!
export type PublicRoomState = {
  screen: ScreenState;
  game: GameState;
  /**
   * Connected players
   */
  players: {
    id: string;
    name: string;
  }[];
  numRounds: number;
  // current: {
  /**
   * An index number / round number. Starts at 1. Not a reference to quiz/exercise id.
   */
  round: number;
  question: string;
  /**
   * Only for quiz. answer options
   */
  options: string[];

  /**
   * Remaining time in seconds.
   * // TODO: Alternative use Timestamp day.js
   */
  remainingSeconds: number;
  // };
};

/**
 * quiz/card answers data + user answers [hidden from client, No Access]
 * //TODO On Update Trigger -> execute Webhook -> Edge Function -> Update PublicRoomState
 */
export type PrivateRoomState = {
  gameData: {
    questions: {
      id: number;
      question: string;
      answers: string[];
      correct: number[];
    }[];
    flashcards: {
      id: number;
      question: string;
      answer: string;
    }[];
    /**
     * // TODO: REMOVE THIS. use direct realtime client to client and skip database/function! https://supabase.com/docs/guides/realtime/broadcast
     * @deprecated
     */
    whiteboard: {};
  };
  userAnswers: {
    /**
     * References the question/flashcard id
     */
    id: number;
    /**
     * user uuid
     */
    user: string;

    questions: {
      id: number;
      answerIndex: number;
    }[];
    flashcards: {
      id: number;
      answer: string;
    }[];
    /**
     * // TODO: REMOVE THIS. use direct realtime client to client and skip database/function! https://supabase.com/docs/guides/realtime/broadcast
     * @deprecated
     */
    whiteboard: {}; //
  }[];
};
