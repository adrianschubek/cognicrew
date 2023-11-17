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
 */
export const useRoomStore = create<RoomStore>()(
  persist(
    (set, get) => ({
      room: null,
      setRoom: (room) => set({ room }),
    }),
    {
      name: "room",
      storage: createJSONStorage(() => AsyncStorage),
      // potential bottleneck? when roomState is updated often. Solution: split stores
    },
  ),
);

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
