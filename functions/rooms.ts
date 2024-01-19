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
    /**
     * user id
     */
    id: string;
    username: string;
    /**
     * Whether the user is the host of this room
     */
    isHost: boolean;
    /**
     * game score
     */
    score: number;
    /**
     * Number of correct answers in this game
     */
    correctQuestions: number;
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
   * Game began at timestamp milliseconds
   */
  gameBeganAt: number;
  /**
   * Round began at timestamp milliseconds
   */
  roundBeganAt: number;
  /**
   * Round ends at timestamp milliseconds
   */
  roundEndsAt: number;
   /**
   * Learning project id
   */
   projectId: number;
};

/**
 * quiz/card answers data + user answers [hidden from client, No Access]
 * //TODO On Update Trigger -> execute Webhook -> Edge Function -> Update PublicRoomState
 */
export type PrivateRoomState = {
  /**
   * Learning project id
   */
  projectId: number;
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
  };
};

export type UserProjectStats = {
  scoreQuiz: number;
  scoreFlashcards: number;
  winsQuiz: number;
  winsFlashcards: number;
  timeSpentQuiz: number;
  timeSpentFlashcards: number;
};

/**
 * format for client -> server edge function push
 */
export type RoomClientUpdate =
  | {
      /**
       * Submits the answer for the current question.
       * @param answer user answer
       */
      type: "flashcard_answer";
      answer: string;
    }
  | {
      /**
       * Submits the answer for the current question.
       * @param answerIndex index of possibleAnswers array
       */
      type: "exercise_answer";
      answerIndex: number[];
    }
  | {
      /**
       * Resets the room to the lobby state if the user is the host.
       * Otherwise, the user will be kicked from the room.
       */
      type: "reset_room";
    }
  | {
      /**
       * Skips all round and sets the game to the end state if the user is the host.
       */
      type: "end_game";
    }
  | {
      /**
       * Skips the current round if the user is the host.
       * //TODO
       */
      type: "skip_round";
    };

export type RoomClientInit =
  | {
      /**
       * 0 = flashcard, 1 = quiz
       */
      type: 0 | 1;
      projectId: number;
      sets: number[];
      roundDuration: number;
      numberOfRounds: number;
    };
