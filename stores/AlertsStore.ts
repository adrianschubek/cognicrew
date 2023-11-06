import { create } from "zustand";

type AlertsStoreType = {
  open: boolean;
  icon: string;
  title: string;
  message: string;
  okText: string;
  cancelText: string;
  okAction: () => void;
  cancelAction: () => void;
  setOpen: (open: boolean) => void;
  setIcon: (icon: string) => void;
  setTitle: (title: string) => void;
  setMessage: (message: string) => void;
  setOkText: (text: string) => void;
  setCancelText: (text: string) => void;
  setOkAction: (action: () => void) => void;
  setCancelAction: (action: () => void) => void;
};

export const useAlertsStore = create<AlertsStoreType>((set, get) => ({
  open: false,
  icon: "information-outline",
  title: "",
  message: "",
  okText: "OK",
  cancelText: "Cancel",
  okAction: () => {},
  cancelAction: () => {},
  setOpen: (open: boolean) => set({ open: open }),
  setIcon: (icon: string) => set({ icon: icon }),
  setTitle: (title: string) => set({ title: title }),
  setMessage: (message: string) => set({ message: message }),
  setOkText: (text: string) => set({ okText: text }),
  setCancelText: (text: string) => set({ cancelText: text }),
  setOkAction: (action: () => void) => set({ okAction: action }),
  setCancelAction: (action: () => void) => set({ cancelAction: action }),
}));
