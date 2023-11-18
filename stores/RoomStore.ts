import { create } from "zustand";
import { Database } from "../types/supabase";
import { PublicRoomState } from "../types/rooms";
import { createJSONStorage, persist } from "zustand/middleware";
import AsyncStorage from "@react-native-async-storage/async-storage";

type RoomStore = {
  room: Database["public"]["Tables"]["rooms"]["Row"] | null;
  setRoom: (room: Database["public"]["Tables"]["rooms"]["Row"] | null) => void;
};

/**
 * Current room info without any room state.
 * //FIXME: removed persist bc it was creating bug project -> null on rejin startup.
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
