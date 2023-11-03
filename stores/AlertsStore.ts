import { create } from "zustand";

type AlertsStoreType = {
  open: boolean;
  icon: string;
  title: string;
  message: string;
  setOpen: (open: boolean) => void;
  setIcon: (icon: string) => void;
  setTitle: (title: string) => void;
  setMessage: (message: string) => void;
};

export const useAlertsStore = create<AlertsStoreType>((set, get) => ({
  open: false,
  icon: "information-outline",
  title: "",
  message: "",
  setOpen: (open: boolean) => set({ open: open }),
  setIcon: (icon: string) => set({ icon: icon }),
  setTitle: (title: string) => set({ title: title }),
  setMessage: (message: string) => set({ message: message }),
}));