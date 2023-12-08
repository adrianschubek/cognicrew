// This file must be in /functions!!! DONT MOVE

export enum ScreenState {
  LOBBY = "lobby",
  INGAME = "ingame",
  ROUND_SOLUTION = "round-solution", // after ingame and before round results screen
  ROUND_RESULTS = "round-results", // after round solution screen
  END_RESULTS = "end-results", // game end
}
export enum GameState {
  EXERCISES = "exercises",
  FLASHCARDS = "flashcards",
  WHITEBOARD = "whiteboard",
}
/**
 * (Realtime enabled) [visible to client, SELECT only]
 * Stored/updated inside public_rooms_state table. Will be send to client on each update. Client uses this to display everything.
 */
export type PublicRoomState = {
  /**
   * Display this screen
   */
  screen: ScreenState;
  /**
   * Current game type
   */
  game: GameState;
  /**
   * Connected players
   */
  players: {
    id: string;
    username: string;
    score: number;
    /**
     * Whether the user answered correctly in the current round.
     * Will be null if there is no current round, it is disabled or the user did not answer yet.
     */
    currentCorrect: boolean | null;
    /**
     * Time needed to answer the current question in milliseconds.
     * Will be null if there is no current round, it is disabled or the user did not answer yet.
     */
    currentTimeNeeded: number | null;
  }[];
  /**
   * Total rounds in this game
   */
  totalRounds: number;
  /**
   * Current round (starts at 1)
   */
  round: number;
  /**
   * Current question (quiz and flashcard)
   */
  question: string;
  /**
   * possible answers for current question (quiz only)
   */
  possibleAnswers: string[];
  /**
   * correct answers for current question
   * only when screen === ROUND_SOLUTION, otherwise null
   * answerIndex => index of this array.
   */
  userAnswers:
    | {
        answer: string;
        /**
         * Explanation of this answer
         */
        explanation?: string;
        /**
         * 0-100 percentage of players who answered this answer
         */
        percentage: number;
        isCorrect: boolean;
      }[]
    | null;
  /**
   * Round began at timestamp milliseconds
   */
  roundBeganAt: number;
  /**
   * Round ends at timestamp milliseconds
   */
  roundEndsAt: number;
};

/**
 * quiz/card answers data + user answers [hidden from client, No Access]
 * //TODO On Update Trigger -> execute Webhook -> Edge Function -> Update PublicRoomState
 */
export type PrivateRoomState = {
  /**
   * Round duration in seconds
   */
  roundDuration: number;
  /**
   * Complete game data (incl. solutions)
   */
  gameData: {
    exercises: {
      id: number;
      question: string;
      answers: string[];
      explanations: (string | null)[];
      priority: number;
      correct: number[];
    }[];
    flashcards: {
      id: number;
      question: string;
      priority: number;
      answer: string;
      explanation: string | null;
    }[];
    /**
     * // TODO: REMOVE THIS. use direct realtime client to client and skip database/function! https://supabase.com/docs/guides/realtime/broadcast
     * @deprecated
     */
    // whiteboard: {};
  };
};

/**
 * format for client -> server edge function push
 */
export type RoomClientUpdate =
  | { type: "flashcard-answer"; answer: string }
  | { type: "exercise-answer"; answerIndex: number[] }
  | { type: "reset-lobby" } /* TOOD: in db set is_ingame back to false */
  | { type: "skip-round" }; /* host only */

export type RoomClientInit =
  | {
      /**
       * 0 = flashcard, 1 = quiz
       */
      type: 0 | 1;
      sets: number[];
      roundDuration: number;
      numberOfRounds: number;
    }
  | {
      /**
       * 4 = whiteboard
       */
      type: 4;
      /**
       * save cogniboard as... in project
       */
      name: string;
    };
