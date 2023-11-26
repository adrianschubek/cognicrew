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
     * Whether the user submitted an answer in the current round.
     * @ deprecated use currentCorrect instead. it implies currentDone
     */
    // currentDone: boolean | null;
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
   * Tuple [answer (string), percentage (0-100)]
   */
  correctAnswersPercentage: [string, number][] | null;
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
   * Complete game data (incl. solutions)
   */
  gameData: {
    exercises: {
      id: number;
      question: string;
      answers: string[];
      priority: number;
      correct: number[];
    }[];
    flashcards: {
      id: number;
      question: string;
      priority: number;
      answer: string;
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

/**
 * sets
 * 
 * {
  "data": [
    {
      "id": 175,
      "name": "9999",
      "sets": [
        {
          "name": "Mathe",
          "exercises": [],
          "flashcards": [
            {
              "id": 37,
              "question": "Uii",
              "answer": "Oppo"
            }
          ]
        },
        {
          "name": "Test",
          "exercises": [
            {
              "id": 66,
              "question": "Hffg",
              "answers_exercises": [
                {
                  "id": 114,
                  "answer": "Hgg",
                  "is_correct": false
                },
                {
                  "id": 115,
                  "answer": "",
                  "is_correct": false
                },
                {
                  "id": 116,
                  "answer": "",
                  "is_correct": false
                },
                {
                  "id": 117,
                  "answer": "",
                  "is_correct": false
                }
              ]
            },
            {
              "id": 56,
              "question": "1+1?",
              "answers_exercises": [
                {
                  "id": 83,
                  "answer": "",
                  "is_correct": true
                },
                {
                  "id": 85,
                  "answer": "2",
                  "is_correct": true
                },
                {
                  "id": 84,
                  "answer": "3",
                  "is_correct": false
                },
                {
                  "id": 82,
                  "answer": "",
                  "is_correct": true
                }
              ]
            },
            {
              "id": 57,
              "question": "9999",
              "answers_exercises": [
                {
                  "id": 88,
                  "answer": "999",
                  "is_correct": true
                },
                {
                  "id": 87,
                  "answer": "8888",
                  "is_correct": false
                },
                {
                  "id": 89,
                  "answer": "",
                  "is_correct": false
                },
                {
                  "id": 86,
                  "answer": "",
                  "is_correct": false
                }
              ]
            }
          ],
          "flashcards": []
        }
      ]
    }
  ]
}
 */
