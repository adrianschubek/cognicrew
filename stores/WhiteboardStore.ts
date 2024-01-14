import { create } from "zustand";

type WhiteboardStoreType = {
  color: string;
  stroke: number;
  selectedShape: "square" | "triangle" | "circle" | "none";
  shapeSize: number;
  setShapeSize: (size: number) => void;
  setSelectedShape: (shape: "square" | "triangle" | "circle" | "none") => void;
  setColor: (color: string) => void;
  setStroke: (stroke: number) => void;
};

export const useWhiteboardStore = create<WhiteboardStoreType>((set) => ({
  color: "#FF0000",
  stroke: 12,
  selectedShape: "none",
  shapeSize: 50,
  setShapeSize: (size) => set({ shapeSize: size }),
  setSelectedShape: (shape) => set({ selectedShape: shape }),
  setColor: (color) => set({ color }),
  setStroke: (stroke) => set({ stroke }),
}));
