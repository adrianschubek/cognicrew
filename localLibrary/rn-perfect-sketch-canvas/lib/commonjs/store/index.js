"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.drawingState = exports.derivedPaths = void 0;

var _perfectFreehand = _interopRequireDefault(require("perfect-freehand"));

var _constants = require("../components/SketchCanvas/constants");

var _utils = require("../utils");

var _valtio = require("valtio");

var _utils2 = require("valtio/utils");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const drawingState = (0, _valtio.proxy)({
  isDrawing: false,
  currentPoints: {
    points: null,
    strokeWidth: _constants.STROKE_WIDTH
  },
  completedPoints: []
});
exports.drawingState = drawingState;
const derivedPaths = (0, _utils2.derive)({
  current: get => get(drawingState).currentPoints.points !== null ? (0, _utils.getSvgPathFromStroke)((0, _perfectFreehand.default)(get(drawingState).currentPoints.points, {
    size: get(drawingState).currentPoints.width
  })) : null,
  completed: get => get(drawingState).completedPoints.map(point => {
    const {
      points,
      width,
      ...rest
    } = point;
    return {
      path: (0, _utils.getSvgPathFromStroke)((0, _perfectFreehand.default)(points, {
        size: width
      })),
      ...rest
    };
  })
});
exports.derivedPaths = derivedPaths;
//# sourceMappingURL=index.js.map