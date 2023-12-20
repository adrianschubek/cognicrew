import { create } from "zustand";

type AvatarState = {
  avatarUrl: string;
  setAvatarUrl: (url: string) => void;
  urlHasMatchingImage: boolean;
  setUrlHasMatchingImage: (hasMatchingImage: boolean) => void;
};

export const useAvatarStore = create<AvatarState>((set) => ({
  avatarUrl: null,
  setAvatarUrl: (url) => set({ avatarUrl: url }),
  urlHasMatchingImage: false,
  setUrlHasMatchingImage: (hasMatchingImage) =>set({ urlHasMatchingImage: hasMatchingImage }),
}));
