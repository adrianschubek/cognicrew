import React from "react";
import { View } from "react-native";
import Svg, { Path, Polygon, Rect, Circle } from "react-native-svg";
import { useWhiteboardStore } from "../../stores/WhiteboardStore";

export const Canvas = () => {
  const { color, stroke, setPaths, paths, selectedShape } =
    useWhiteboardStore();

  // Function to start a new path for freehand drawing
  const setNewPath = (x: number, y: number) => {
    if (selectedShape === "none") {
      console.log("call setNewPath");
      setPaths((prev) => {
        const result = [...prev, { path: [`M${x} ${y}`], color, stroke }];
        return result;
      });
    }
  };

  // Function to update the current path for freehand drawing
  const updatePath = (x: number, y: number) => {
    if (selectedShape === "none") {
      setPaths((prev) => {
        const currentPath = paths[paths.length - 1];
        currentPath && currentPath.path.push(`L${x} ${y}`);
        return currentPath ? [...prev.slice(0, -1), currentPath] : prev;
      });
    }
  };

  // Function to draw a selected shape
  const drawShape = (x: number, y: number) => {
    if (selectedShape !== "none") {
      const shapePath = getShapePath(x, y, selectedShape);
      setPaths((prev) => [...prev, { path: [shapePath], color, stroke }]);
    }
  };

  // Function to generate SVG path for the selected shape
  const getShapePath = (x, y, shape) => {
    const size = 50;
    const halfSize = size / 2;

    switch (shape) {
      case "triangle":
        return `M${x - halfSize} ${y + halfSize} L${x} ${y - halfSize} L${
          x + halfSize
        } ${y + halfSize} Z`;
      case "square":
        return `M${x - halfSize} ${y - halfSize} h${size} v${size} h${-size} Z`;
      case "circle":
        return `M${x - halfSize},${y - halfSize}`;
      default:
        return "";
    }
  };

  return (
    <View
      onStartShouldSetResponder={() => true}
      onMoveShouldSetResponder={() => true}
      onResponderStart={(e) => {
        const x = e.nativeEvent.locationX;
        const y = e.nativeEvent.locationY;
        if (selectedShape === "none") {
          setNewPath(x, y);
        } else {
          drawShape(x, y);
        }
      }}
      onResponderMove={(e) => {
        updatePath(e.nativeEvent.locationX, e.nativeEvent.locationY);
      }}
    >
      <Svg>
        {paths.map(({ path, color: c, stroke: s }, i) => {
          if (path[0].startsWith("M") && path[0].includes(",")) {
            // Identifying circle
            const [mx, my] = path[0].substring(1).split(",").map(Number);
            return (
              <Circle
                key={i}
                cx={mx + 25}
                cy={my + 25}
                r="25"
                stroke={c}
                strokeWidth={s}
                fill="none"
              />
            );
          } else {
            return (
              <Path
                key={i}
                d={path.join(" ")}
                fill="none"
                strokeWidth={`${s}px`}
                stroke={c}
              />
            );
          }
        })}
      </Svg>
    </View>
  );
};
