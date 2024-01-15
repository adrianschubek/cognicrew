import type { SketchCanvasProps } from '../components/SketchCanvas/types';
export default function createSvgFromPaths(paths: {
    id: number;
    color: SketchCanvasProps['strokeColor'];
    style: SketchCanvasProps['strokeStyle'];
    path: string;
}[], options: {
    width: number;
    height: number;
    backgroundColor?: string;
}): string;
