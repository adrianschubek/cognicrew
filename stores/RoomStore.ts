import { create } from "zustand";
import { Database } from "../types/supabase";
import { PublicRoomState } from "../functions/rooms";
import { createJSONStorage, persist } from "zustand/middleware";
import AsyncStorage from "@react-native-async-storage/async-storage";

type RoomStore = {
  room: Database["public"]["Tables"]["rooms"]["Row"] | null;
  setRoom: (room: Database["public"]["Tables"]["rooms"]["Row"] | null) => void;
};

/**
 * Current room info without any room state.
 */
export const useRoomStore = create<RoomStore>((set, get) => ({
  room: null,
  setRoom: (room) => set({ room }),
}));

type RoomState = {
  roomState: PublicRoomState | null;
  setRoomState: (roomState: PublicRoomState | null) => void;
};

/**
 * Access to roomState. Updated by Edge Function.
 */
export const useRoomStateStore = create<RoomState>((set, get) => ({
  roomState: null,
  setRoomState: (roomState) => set({ roomState }),
}));
