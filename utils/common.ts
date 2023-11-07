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

export function getRandomColor(): string {
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

  const randomIndex = Math.floor(Math.random() * materialColorsHex.length);
  return materialColorsHex[randomIndex];
}
