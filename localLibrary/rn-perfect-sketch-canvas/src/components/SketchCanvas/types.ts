import type { Color, SkImage } from '@shopify/react-native-skia';
import type { StyleProp, ViewStyle } from 'react-native';

export enum ImageFormat {
  PNG,
  JPEG,
  WEBP,
}

export type StrokeStyle = 'stroke' | 'fill';

export interface SketchCanvasRef {
  reset: () => void;
  undo: () => void;
  redo: () => void;
  toBase64: (format?: ImageFormat, quality?: number) => string | undefined;
  toImage: () => SkImage | undefined;
  toSvg: (width: number, height: number, backgroundColor?: string) => string;
  toPoints: () => Point[][];
  addPoints: (points: Point[][], style?: StyleOptions) => void;
}

export interface SketchCanvasProps {
  strokeWidth?: number;
  strokeColor?: Color;
  strokeStyle?: 'stroke' | 'fill';
  containerStyle?: StyleProp<ViewStyle>;
  children?: React.ReactNode;
  topChildren?: React.ReactNode;
  bottomChildren?: React.ReactNode;
  onTouchEnd?: () => void;
}

export interface StyleOptions {
  strokeColor?: Color;
  strokeStyle?: 'stroke' | 'fill';
  strokeWidth?: number;
}

export type Point = [number, number];
