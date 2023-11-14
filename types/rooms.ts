/**
 * (Realtime enabled) + timer + current game + current question [visible to client,  SELECT only]
 */
export type PublicRoomState = {
  state: "lobby" | "ingame" | "results";
  game: "quiz" | "flashcards";
  current: {
    question: string;
    /**
     * Only for quiz. answer options
     */
    options: string[];
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
