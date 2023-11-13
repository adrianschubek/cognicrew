import { create } from "zustand";

type RefetchIndexStoreType = {
  refetchIndex: number | null;
  incrementRefetchIndex: () => void;
  reset: () => void;
};
export const useRefetchIndexStore = create<RefetchIndexStoreType>((set, get) => ({
  refetchIndex: 0,
  incrementRefetchIndex: () => set((state) => ({ refetchIndex: state.refetchIndex + 1 })),
  reset: () => set({ refetchIndex: 0 }),
}));

