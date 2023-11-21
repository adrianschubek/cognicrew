import { Database } from "./supabase";

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

  playerCount: number;
  
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
    // questions: {
    //   id: number;
    //   question: string;
    //   answers: string[];
    //   correct: number[];
    // }[];
    // flashcards: {
    //   id: number;
    //   question: string;
    //   answer: string;
    // }[];
    sets: Database["public"]["Tables"]["exercises"]["Row"],


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