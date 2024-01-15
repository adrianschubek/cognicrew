export default function createHistoryStack<T>(current: T): {
    push: (value: T | ((payload: T) => T)) => T;
    undo: () => T;
    redo: () => T;
};
