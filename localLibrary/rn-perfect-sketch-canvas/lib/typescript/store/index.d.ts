import type { Point, SketchCanvasProps } from '../components/SketchCanvas/types';
interface CompletedPoints {
    id: number;
    points: Point[];
    color: SketchCanvasProps['strokeColor'];
    width: SketchCanvasProps['strokeWidth'];
    style: SketchCanvasProps['strokeStyle'];
}
export declare const drawingState: {
    isDrawing: boolean;
    currentPoints: {
        points: Point[] | null;
        width?: SketchCanvasProps['strokeWidth'];
    };
    completedPoints: CompletedPoints[];
};
export declare const derivedPaths: object & {
    current: string | null;
    completed: {
        id: number;
        color: SketchCanvasProps['strokeColor'];
        style: SketchCanvasProps['strokeStyle'];
        path: string;
    }[];
};
export {};
