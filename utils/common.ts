import { FunctionsHttpError } from "@supabase/supabase-js";
import { orderByPrinciple } from "../types/common";

/**
 * Updates a value if it has changed.
 * Prevents too deep update error.
 */
export function ifMod<T>(
  oldVal: T,
  newVal: T,
  updateFn: (val: T) => any,
): void {
  if (oldVal !== newVal) {
    updateFn(newVal);
  }
}

/**
 * Returns the same color for the same input string.
 */
export function getRandomColor(str: string = ""): string {
  const materialColorsHex = [
    "#F44336",
    "#E91E63",
    "#9C27B0",
    "#673AB7",
    "#3F51B5",
    "#2196F3",
    "#03A9F4",
    "#00BCD4",
    "#009688",
    "#4CAF50",
    "#8BC34A",
    "#CDDC39",
    "#FFEB3B",
    "#FFC107",
    "#FF9800",
    "#FF5722",
    "#795548",
    "#9E9E9E",
    "#607D8B",
  ] as const;

  let hash = 0;
  for (let i = 0; i < str.length; i++) {
    hash = str.charCodeAt(i) + ((hash << 5) - hash);
  }

  // Ensure the hash is positive
  hash = Math.abs(hash);

  // Map the hash to an index in materialColorsHex array
  const index = hash % materialColorsHex.length;

  // Return the color corresponding to the index
  return materialColorsHex[index];

  // const randomIndex = Math.floor(Math.random() * materialColorsHex.length);
  // return materialColorsHex[randomIndex];
}
export function sortByOrder(list: any[], order: orderByPrinciple) {
  return list.sort((a, b) => {
    let isReverse = order.substring(0, 8) === "reverse_";
    let orderPrinciple = isReverse ? order.substring(8, order.length) : order;
    return a[orderPrinciple] < b[orderPrinciple]
      ? isReverse
        ? 1
        : -1
      : a[orderPrinciple] > b[orderPrinciple]
      ? isReverse
        ? -1
        : 1
      : 0;
  });
}
export function debounce(func, delay: number) {
  let timer;
  let args;
  return (...newArgs) => {
    args = newArgs;
    clearTimeout(timer);
    timer = setTimeout(() => {
      func(...args);
    }, delay);
  };
}
export async function handleEdgeError(error: Error): Promise<string> {
  let errMsg: string;
  try {
    errMsg =
      error instanceof FunctionsHttpError
        ? (await error.context.json())?.message
        : JSON.stringify(error);
  } catch (error) {
    errMsg =
      "Something went wrong. This usually indicates an unexpected error inside an edge function. Please try again later. (#68)";
  }
  return (
    errMsg ??
    "Something went wrong. This usually indicates an unexpected error inside an edge function. Please try again later. (#68)"
  );
}
