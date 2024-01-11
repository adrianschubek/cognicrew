import { create } from "zustand";

type PresenceStoreType = {
  online: {
    user_id: string;
    online_at: number;
  }[];
  update: (
    users: {
      user_id: string;
      online_at: number;
    }[],
  ) => void;
  /**
   * Flashcard/quiz IDs -> user names array of users editing this
   */
  cardQuizEditing: Record<number, string[]>;
  updateCardQuizEditing: (id: number, users: string[]) => void;
};

export const usePresenceStore = create<PresenceStoreType>((set) => ({
  online: [],
  update: (users) => set({ online: users }),
  cardQuizEditing: [],
  updateCardQuizEditing: (id, users) =>
    set((s) => ({
      cardQuizEditing: { ...s.cardQuizEditing, [id]: users },
    })),
}));
