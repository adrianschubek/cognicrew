import { create } from "zustand";

type ProjectStoreType = {
  projectId: number | null;
  setProjectId: (id: number) => void;
  reset: () => void;
};

export const useProjectStore = create<ProjectStoreType>((set, get) => ({
  projectId: null,
  setProjectId: (id: number) => set({ projectId: id }),
  reset: () => set({ projectId: null }),
}));

