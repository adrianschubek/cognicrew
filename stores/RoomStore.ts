import { create } from "zustand";
import { Database } from "../types/supabase";

type RoomStore = {
  room: Database["public"]["Tables"]["rooms"]["Row"] | null;
  setRoom: (room: Database["public"]["Tables"]["rooms"]["Row"]) => void;
};

export const useRoomStore = create<RoomStore>((set, get) => ({
  room: null,
  setRoom: (room) => set({ room }),
}));
