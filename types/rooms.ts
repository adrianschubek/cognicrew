import { Database } from "./supabase";

export const enum ScreenState {
  LOBBY = "lobby",
  INGAME = "ingame",
  RESULTS = "results",
}
export const enum GameState {
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
    name: string;
    points: number;
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
   * Round ends at timestamp
   */
  roundEndsAt: EpochTimeStamp;
};

/**
 * quiz/card answers data + user answers [hidden from client, No Access]
 * //TODO On Update Trigger -> execute Webhook -> Edge Function -> Update PublicRoomState
 */
export type PrivateRoomState = {
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
    whiteboard: {};
  };
  /**
   * submitted answers by players
   */
  playerAnswers: {
    /**
     * user uuid
     */
    id: string;
    /**
     * exercise game
     */
    exercises: {
      /**
       * question id
       */
      id: number;
      /**
       * which indices from possible answers were selected by user
       */
      answerIndex: number[];
    }[];
    /*+
     * flashcard game
     */
    flashcards: {
      /**
       * flashcard id
       */
      id: number;
      /**
       * answer by user
       */
      answer: string;
    }[];
    /**
     * // TODO: REMOVE THIS. use direct realtime client to client and skip database/function! https://supabase.com/docs/guides/realtime/broadcast
     * @deprecated
     */
    whiteboard: {}; //
  }[];
};

/**
 * Client messages to server
 */
type FlashcardClientUpdate = { answer: string };
type ExerciseClientUpdate = { answerIndex: number[] };
/**
 * format for client -> server edge function push
 */
export type RoomClientUpdate =
  | { type: "flashcard-answer"; data: FlashcardClientUpdate }
  | { type: "exercise-answer"; data: ExerciseClientUpdate };

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
