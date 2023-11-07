/**
 * Updates a value if it has changed.
 * Prevents too deep update error.
 */
export function ifMod<T>(oldVal: T, newVal: T, updateFn: (val: T) => any): void {
  if (oldVal !== newVal) {
    updateFn(newVal);
  }
}
