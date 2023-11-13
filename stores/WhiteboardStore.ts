import { create } from "zustand";

type PathType = { path: string[]; color: string; stroke: number };

type WhiteboardStoreType = {
  paths: PathType[];
  undoPaths: PathType[];
  color: string;
  stroke: number;
  openColor: boolean;
  openStroke: boolean;
  selectedShape: "square" | "triangle" | "circle" | "none";
  setSelectedShape: (shape: "square" | "triangle" | "circle" | "none") => void;
  setPaths: (fn: (prev: PathType[]) => PathType[]) => void;
  setColor: (color: string) => void;
  setStroke: (stroke: number) => void;
  resetPath: () => void;
  undoLastPath: () => void;
  redoLastPath: () => void;
  setOpenColor: (open: boolean) => void;
  setOpenStroke: (open: boolean) => void;
};

export const useWhiteboardStore = create<WhiteboardStoreType>((set) => ({
  selectedShape: "none",
  setSelectedShape: (shape) => set({ selectedShape: shape }),
  paths: [],
  undoPaths: [],
  color: "#FF0000",
  stroke: 12,
  openColor: false,
  openStroke: false,
  setPaths: (fn) =>
    set((state) => {
      const newPaths = fn(state.paths);
      return { ...state, paths: newPaths, undoPaths: [] };
    }),
  setColor: (color) => set({ color }),
  setStroke: (stroke) => set({ stroke }),
  resetPath: () => set({ paths: [], undoPaths: [] }),
  undoLastPath: () =>
    set((state) => {
      if (state.paths.length > 0) {
        const newUndoPaths = [
          ...state.undoPaths,
          state.paths[state.paths.length - 1],
        ];
        return {
          ...state,
          paths: state.paths.slice(0, -1),
          undoPaths: newUndoPaths,
        };
      }
      return state;
    }),
  redoLastPath: () =>
    set((state) => {
      if (state.undoPaths.length > 0) {
        const lastUndoPath = state.undoPaths[state.undoPaths.length - 1];
        return {
          ...state,
          paths: [...state.paths, lastUndoPath],
          undoPaths: state.undoPaths.slice(0, -1),
        };
      }
      return state;
    }),
  setOpenColor: (open) => set({ openColor: open }),
  setOpenStroke: (open) => set({ openStroke: open }),
}));
