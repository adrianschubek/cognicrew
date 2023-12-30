import { create } from "zustand";

type PathType = {
  path: string[];
  color: string;
  stroke: number;
  size: number;
  type: "path";
};

type TextType = {
  x: number;
  y: number;
  text: string;
  color: string;
  type: "text";
};

type Action = PathType | TextType;

type WhiteboardStoreType = {
  actions: Action[];
  undoActions: Action[];
  color: string;
  stroke: number;

  selectedShape: "square" | "triangle" | "circle" | "none";
  shapeSize: number;
  isDrawing: boolean;
  setIsDrawing: (isDrawing: boolean) => void;
  updatePath: (x: number, y: number) => void;

  setShapeSize: (size: number) => void;
  setSelectedShape: (shape: "square" | "triangle" | "circle" | "none") => void;
  addAction: (action: Action) => void;
  setColor: (color: string) => void;
  setStroke: (stroke: number) => void;
  resetActions: () => void;
  undoLastAction: () => void;
  redoLastAction: () => void;
};

export const useWhiteboardStore = create<WhiteboardStoreType>((set) => ({
  isDrawing: false,
  actions: [],
  undoActions: [],
  color: "#FF0000",
  stroke: 12,
  selectedShape: "none",
  shapeSize: 50,

  setIsDrawing: (isDrawing) => set({ isDrawing }),
  setShapeSize: (size) => set({ shapeSize: size }),
  setSelectedShape: (shape) => set({ selectedShape: shape }),
  addAction: (action) =>
    set((state) => ({
      ...state,
      actions: [...state.actions, action],
      undoActions: [],
    })),
  setColor: (color) => set({ color }),
  setStroke: (stroke) => set({ stroke }),
  resetActions: () => set({ actions: [], undoActions: [] }),
  undoLastAction: () =>
    set((state) => {
      if (state.actions.length > 0) {
        const lastAction = state.actions[state.actions.length - 1];
        return {
          ...state,
          actions: state.actions.slice(0, -1),
          undoActions: [...state.undoActions, lastAction],
        };
      }
      return state;
    }),
  redoLastAction: () =>
    set((state) => {
      if (state.undoActions.length > 0) {
        const lastUndoAction = state.undoActions[state.undoActions.length - 1];
        return {
          ...state,
          actions: [...state.actions, lastUndoAction],
          undoActions: state.undoActions.slice(0, -1),
        };
      }
      return state;
    }),
  updatePath: (x, y) =>
    set((state) => {
      if (state.isDrawing && state.actions.length > 0) {
        const lastAction = state.actions[state.actions.length - 1];
        if (lastAction.type === "path") {
          const newPath = [...lastAction.path, `L${x} ${y}`];
          const newActions = [
            ...state.actions.slice(0, -1),
            { ...lastAction, path: newPath },
          ];
          return { ...state, actions: newActions };
        }
      }
      return state;
    }),
}));
