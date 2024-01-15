"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.SketchCanvas = void 0;

var _reactNativeSkia = require("@shopify/react-native-skia");

var _react = _interopRequireWildcard(require("react"));

var _store = require("../../store");

var _valtio = require("valtio");

var _utils = require("../../utils");

var _types = require("./types");

var _constants = require("./constants");

function _getRequireWildcardCache(nodeInterop) { if (typeof WeakMap !== "function") return null; var cacheBabelInterop = new WeakMap(); var cacheNodeInterop = new WeakMap(); return (_getRequireWildcardCache = function (nodeInterop) { return nodeInterop ? cacheNodeInterop : cacheBabelInterop; })(nodeInterop); }

function _interopRequireWildcard(obj, nodeInterop) { if (!nodeInterop && obj && obj.__esModule) { return obj; } if (obj === null || typeof obj !== "object" && typeof obj !== "function") { return { default: obj }; } var cache = _getRequireWildcardCache(nodeInterop); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (key !== "default" && Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj.default = obj; if (cache) { cache.set(obj, newObj); } return newObj; }

const SketchCanvas = /*#__PURE__*/(0, _react.forwardRef)((_ref, ref) => {
  let {
    strokeWidth = _constants.STROKE_WIDTH,
    strokeColor = _constants.STROKE_COLOR,
    strokeStyle = _constants.STROKE_STYLE,
    containerStyle,
    children,
    topChildren,
    bottomChildren
  } = _ref;
  const pathsSnapshot = (0, _valtio.useSnapshot)(_store.derivedPaths);
  const canvasRef = (0, _reactNativeSkia.useCanvasRef)();
  const stack = (0, _react.useMemo)(() => (0, _utils.createHistoryStack)({
    currentPoints: _store.drawingState.currentPoints,
    completedPoints: _store.drawingState.completedPoints
  }), []);
  (0, _react.useEffect)(() => {
    _store.drawingState.currentPoints.width = strokeWidth;
  }, [strokeWidth]);
  (0, _react.useImperativeHandle)(ref, () => ({
    reset() {
      _store.drawingState.currentPoints.points = null;
      _store.drawingState.completedPoints = [];
      stack.push({
        currentPoints: _store.drawingState.currentPoints,
        completedPoints: _store.drawingState.completedPoints
      });
    },

    undo() {
      const value = stack.undo();
      _store.drawingState.currentPoints = value.currentPoints;
      _store.drawingState.completedPoints = value.completedPoints;
    },

    redo() {
      const value = stack.redo();
      _store.drawingState.currentPoints = value.currentPoints;
      _store.drawingState.completedPoints = value.completedPoints;
    },

    toBase64: (format, quality) => {
      var _canvasRef$current;

      const image = (_canvasRef$current = canvasRef.current) === null || _canvasRef$current === void 0 ? void 0 : _canvasRef$current.makeImageSnapshot();

      if (image) {
        return image.encodeToBase64( // @ts-expect-error: Internal
        format ?? _types.ImageFormat.PNG, quality ?? 100);
      }

      return undefined;
    },
    toImage: () => {
      var _canvasRef$current2;

      return (_canvasRef$current2 = canvasRef.current) === null || _canvasRef$current2 === void 0 ? void 0 : _canvasRef$current2.makeImageSnapshot();
    },
    toSvg: (width, height, backgroundColor) => {
      return (0, _utils.createSvgFromPaths)(_store.derivedPaths.completed, {
        width,
        height,
        backgroundColor
      });
    },
    toPoints: () => {
      return _store.drawingState.completedPoints.map(p => p.points);
    },
    addPoints: (points, style) => {
      const formatted = points.map(data => ({
        id: Date.now(),
        points: data,
        color: (style === null || style === void 0 ? void 0 : style.strokeColor) ?? _constants.STROKE_COLOR,
        width: (style === null || style === void 0 ? void 0 : style.strokeWidth) ?? _constants.STROKE_WIDTH,
        style: (style === null || style === void 0 ? void 0 : style.strokeStyle) ?? _constants.STROKE_STYLE
      }));
      _store.drawingState.completedPoints = formatted;
    }
  }));
  const touchHandler = (0, _reactNativeSkia.useTouchHandler)({
    onStart: touchInfo => {
      _store.drawingState.isDrawing = true;
      _store.drawingState.currentPoints.points = [[touchInfo.x, touchInfo.y]];
    },
    onActive: touchInfo => {
      if (!_store.drawingState.isDrawing) {
        return;
      }

      _store.drawingState.currentPoints.points = [...(_store.drawingState.currentPoints.points ?? []), [touchInfo.x, touchInfo.y]];
    },
    onEnd: touchInfo => {
      _store.drawingState.isDrawing = false;

      if (!_store.drawingState.currentPoints.points) {
        return;
      }

      _store.drawingState.completedPoints = [..._store.drawingState.completedPoints, {
        id: touchInfo.timestamp,
        points: _store.drawingState.currentPoints.points,
        width: _store.drawingState.currentPoints.width,
        color: strokeColor,
        style: strokeStyle
      }];
      _store.drawingState.currentPoints.points = null;
      stack.push({
        currentPoints: _store.drawingState.currentPoints,
        completedPoints: _store.drawingState.completedPoints
      });
    }
  }, [strokeColor, strokeStyle]);
  return /*#__PURE__*/_react.default.createElement(_reactNativeSkia.Canvas, {
    ref: canvasRef,
    onTouch: touchHandler,
    style: containerStyle
  }, bottomChildren, children, pathsSnapshot.completed.map(path => /*#__PURE__*/_react.default.createElement(_reactNativeSkia.Path, {
    path: path.path,
    key: path.id,
    style: path.style,
    color: path.color
  })), pathsSnapshot.current ? /*#__PURE__*/_react.default.createElement(_reactNativeSkia.Path, {
    path: pathsSnapshot.current,
    color: strokeColor,
    style: strokeStyle
  }) : /*#__PURE__*/_react.default.createElement(_react.default.Fragment, null), topChildren);
});
exports.SketchCanvas = SketchCanvas;
//# sourceMappingURL=SketchCanvas.js.map