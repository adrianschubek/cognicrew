import { Canvas, Path, useCanvasRef, useTouchHandler } from '@shopify/react-native-skia';
import React, { forwardRef, useEffect, useImperativeHandle, useMemo } from 'react';
import { drawingState, derivedPaths } from '../../store';
import { useSnapshot } from 'valtio';
import { createHistoryStack, createSvgFromPaths } from '../../utils';
import { ImageFormat } from './types';
import { STROKE_COLOR, STROKE_STYLE, STROKE_WIDTH } from './constants';
export const SketchCanvas = /*#__PURE__*/forwardRef((_ref, ref) => {
  let {
    strokeWidth = STROKE_WIDTH,
    strokeColor = STROKE_COLOR,
    strokeStyle = STROKE_STYLE,
    containerStyle,
    children,
    topChildren,
    bottomChildren
  } = _ref;
  const pathsSnapshot = useSnapshot(derivedPaths);
  const canvasRef = useCanvasRef();
  const stack = useMemo(() => createHistoryStack({
    currentPoints: drawingState.currentPoints,
    completedPoints: drawingState.completedPoints
  }), []);
  useEffect(() => {
    drawingState.currentPoints.width = strokeWidth;
  }, [strokeWidth]);
  useImperativeHandle(ref, () => ({
    reset() {
      drawingState.currentPoints.points = null;
      drawingState.completedPoints = [];
      stack.push({
        currentPoints: drawingState.currentPoints,
        completedPoints: drawingState.completedPoints
      });
    },

    undo() {
      const value = stack.undo();
      drawingState.currentPoints = value.currentPoints;
      drawingState.completedPoints = value.completedPoints;
    },

    redo() {
      const value = stack.redo();
      drawingState.currentPoints = value.currentPoints;
      drawingState.completedPoints = value.completedPoints;
    },

    toBase64: (format, quality) => {
      var _canvasRef$current;

      const image = (_canvasRef$current = canvasRef.current) === null || _canvasRef$current === void 0 ? void 0 : _canvasRef$current.makeImageSnapshot();

      if (image) {
        return image.encodeToBase64( // @ts-expect-error: Internal
        format ?? ImageFormat.PNG, quality ?? 100);
      }

      return undefined;
    },
    toImage: () => {
      var _canvasRef$current2;

      return (_canvasRef$current2 = canvasRef.current) === null || _canvasRef$current2 === void 0 ? void 0 : _canvasRef$current2.makeImageSnapshot();
    },
    toSvg: (width, height, backgroundColor) => {
      return createSvgFromPaths(derivedPaths.completed, {
        width,
        height,
        backgroundColor
      });
    },
    toPoints: () => {
      return drawingState.completedPoints.map(p => p.points);
    },
    addPoints: (points, style) => {
      const formatted = points.map(data => ({
        id: Date.now(),
        points: data,
        color: (style === null || style === void 0 ? void 0 : style.strokeColor) ?? STROKE_COLOR,
        width: (style === null || style === void 0 ? void 0 : style.strokeWidth) ?? STROKE_WIDTH,
        style: (style === null || style === void 0 ? void 0 : style.strokeStyle) ?? STROKE_STYLE
      }));
      drawingState.completedPoints = formatted;
    }
  }));
  const touchHandler = useTouchHandler({
    onStart: touchInfo => {
      drawingState.isDrawing = true;
      drawingState.currentPoints.points = [[touchInfo.x, touchInfo.y]];
    },
    onActive: touchInfo => {
      if (!drawingState.isDrawing) {
        return;
      }

      drawingState.currentPoints.points = [...(drawingState.currentPoints.points ?? []), [touchInfo.x, touchInfo.y]];
    },
    onEnd: touchInfo => {
      drawingState.isDrawing = false;

      if (!drawingState.currentPoints.points) {
        return;
      }

      drawingState.completedPoints = [...drawingState.completedPoints, {
        id: touchInfo.timestamp,
        points: drawingState.currentPoints.points,
        width: drawingState.currentPoints.width,
        color: strokeColor,
        style: strokeStyle
      }];
      drawingState.currentPoints.points = null;
      stack.push({
        currentPoints: drawingState.currentPoints,
        completedPoints: drawingState.completedPoints
      });
    }
  }, [strokeColor, strokeStyle]);
  return /*#__PURE__*/React.createElement(Canvas, {
    ref: canvasRef,
    onTouch: touchHandler,
    style: containerStyle
  }, bottomChildren, children, pathsSnapshot.completed.map(path => /*#__PURE__*/React.createElement(Path, {
    path: path.path,
    key: path.id,
    style: path.style,
    color: path.color
  })), pathsSnapshot.current ? /*#__PURE__*/React.createElement(Path, {
    path: pathsSnapshot.current,
    color: strokeColor,
    style: strokeStyle
  }) : /*#__PURE__*/React.createElement(React.Fragment, null), topChildren);
});
//# sourceMappingURL=SketchCanvas.js.map