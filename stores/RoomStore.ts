import { create } from "zustand";
import { Database } from "../types/supabase";
import { PublicRoomState } from "../types/rooms";

type RoomStore = {
  room: Database["public"]["Tables"]["rooms"]["Row"] | null;
  setRoom: (room: Database["public"]["Tables"]["rooms"]["Row"] | null) => void;
  roomState: PublicRoomState | null;
  setRoomState: (roomState: PublicRoomState | null) => void;
};

export const useRoomStore = create<RoomStore>((set, get) => ({
  room: null,
  setRoom: (room) => set({ room }),
  roomState: null,
  setRoomState: (roomState) => set({ roomState }),
}));
