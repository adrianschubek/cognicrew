//=== Edge function to be deployed to server directly!
/**
 * (Realtime enabled) + timer + current game + current question [visible to client,  SELECT only]
 */
export type PublicRoomState = {
  screen: "lobby" | "ingame" | "results";
  game: "quiz" | "flashcards" | "whiteboard";
  current: {
    /**
     * An index number / round number. Starts at 1. Not a reference to quiz/exercise id.
     */
    index: number;
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
  };
};

/**
 * quiz/card answers data + user answers [hidden from client, No Access]
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
     * // TODO: REMOVE THIS. maybe use direct realtime client to client and skip database! https://supabase.com/docs/guides/realtime/broadcast
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

    answer: string;
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
     * // TODO: REMOVE THIS. maybe use direct realtime client to client and skip database! https://supabase.com/docs/guides/realtime/broadcast
     * @deprecated
     */
    whiteboard: {}; //
  };
};
