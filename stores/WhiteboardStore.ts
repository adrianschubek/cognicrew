import { create } from "zustand";

type WhiteboardStoreType = {
  paths: any;
  color: any;
  stroke: any;
  openColor: any;
  openStroke: any;
  setPaths: (fn: (prev: any[]) => any[]) => void;
  setColor: (color: any) => void;
  setStroke: (stroke: any) => void;
  resetPath: () => void;
  setOpenColor: (openColor: any) => void;
  setOpenStroke: (openColor: any) => void;
};

export const useWhitebardStore = create<WhiteboardStoreType>((set, get) => ({
  paths: [],
  color: "#FF0000",
  stroke: 12,
  openColor: false,
  openStroke: false,
  setPaths: (paths: (prev: any[]) => any[]) => {set({ paths: paths(get().paths) });},
  setColor: (color: any) => set({ color: color }),
  setStroke: (stroke: any) => set({ stroke: stroke }),
  resetPath: () => set({ paths: []}),
  setOpenColor: (openColor: any) => set({ openColor: openColor }),
  setOpenStroke: (openStroke: any) => set({ openStroke: openStroke }),
}));
