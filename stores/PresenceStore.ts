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
};

export const usePresenceStore = create<PresenceStoreType>((set) => ({
  online: [],
  update: (users) => set({ online: users }),
}));
