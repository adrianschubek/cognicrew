import { create } from "zustand";

type WhiteboardStoreType = {
  paths: any;
  color: any;
  stroke: any;
  setPaths: (fn: (prev: any[]) => any[]) => void;
  setColor: (color: any) => void;
  setStroke: (stroke: any) => void;

  resetPath: () => void;

  openColor: any;
  openStroke: any;
  setOpenColor: (openColor: any) => void;
  setOpenStroke: (openColor: any) => void;
};

export const useWhitebardStore = create<WhiteboardStoreType>((set, get) => ({
  paths: [],
  color: "#FF0000",
  stroke: 18,
  setPaths: (paths: (prev: any[]) => any[]) => {
    set({ paths: paths(get().paths) }); // get() is the previous state. pass it to the path function
  },
  setColor: (color: any) => set({ color: color }),
  setStroke: (stroke: any) => set({ stroke: stroke }),

  resetPath: () => set({ paths: []}),

  openColor: false,
  openStroke: false,
  setOpenColor: (openColor: any) => set({ openColor: openColor }),
  setOpenStroke: (openStroke: any) => set({ openStroke: openStroke }),
}));
