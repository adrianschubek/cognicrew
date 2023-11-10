import { create } from "zustand";

type WhiteboardStoreType = {
    paths: any;
    color: any;
    stroke: any; 
    setPaths:   (paths:any) => void;
    setColor:  (color:any) => void;
    setStroke:  (stroke:any) => void;

    openColor: any;
    openStroke: any;
    setOpenColor: (openColor:any) => void;
    setOpenStroke: (openColor:any) => void;
};

export const useWhitebardStore = create<WhiteboardStoreType>((set, get) => ({
    paths: [],
    color: '#FF0000',
    stroke:  18,
    setPaths: (paths:any) => set({ paths: paths }),
    setColor: (color:any) => set({ color: color }),
    setStroke: (stroke:any) => set({ stroke: stroke }),

    openColor: false,
    openStroke: false,
    setOpenColor: (openColor:any) => set({openColor: openColor}),
    setOpenStroke: (openStroke:any) => set({openStroke: openStroke}),
}));



