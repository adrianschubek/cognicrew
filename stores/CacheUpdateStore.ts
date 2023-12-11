import { create } from "zustand";

type CacheUpdateStoreType = {
  cacheUpdateLocked: boolean;
  lockCacheUpdate: () => void;
  freeCacheUpdate: () => void;
};

export const useCacheUpdateStore = create<CacheUpdateStoreType>((set, get) => ({
  cacheUpdateLocked: false,
  lockCacheUpdate: () => set({ cacheUpdateLocked: true }),
  freeCacheUpdate: () => set({ cacheUpdateLocked: false }),
}));
