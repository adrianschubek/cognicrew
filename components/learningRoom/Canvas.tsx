import React, { useState } from "react";
import { View } from "react-native";
import Svg, { Path, Text as SvgText } from "react-native-svg";
import { useWhiteboardStore } from "../../stores/WhiteboardStore";
import { Action } from "../../types/common";

export default function Canvas(props: {
  onClick: (x, y) => void;
  isTextToolSelected;
  actions;
  undoActions;
  addAction;
  updatePath;
}) {
  const {
    onClick,
    isTextToolSelected,
    actions,
    undoActions,
    addAction,
    updatePath,
  } = props;
  const [isDrawing, setIsDrawing] = useState<boolean>(false);
  const { color, stroke, selectedShape, shapeSize } = useWhiteboardStore();

  // Function to draw a selected shape
  const drawShape = (x, y) => {
    if (selectedShape !== "none") {
      const shapePath = getShapePath(x, y, selectedShape, shapeSize);
      addAction({
        type: "path",
        path: [shapePath],
        color,
        stroke,
        size: shapeSize,
      });
    }
  };

  // Function to generate SVG path for the selected shape
  const getShapePath = (x, y, shape, size) => {
    const halfSize = size / 2;
    switch (shape) {
      case "triangle":
        return `M${x - halfSize} ${y + halfSize} L${x} ${y - halfSize} L${
          x + halfSize
        } ${y + halfSize} Z`;
      case "square":
        return `M${x - halfSize} ${y - halfSize} h${size} v${size} h${-size} Z`;
      case "circle":
        return `M${x},${y} m-${halfSize},0 a${halfSize},${halfSize} 0 1,0 ${size},0 a${halfSize},${halfSize} 0 1,0 -${size},0`;
      default:
        return "";
    }
  };

  const handleResponderStart = (e) => {
    const x = e.nativeEvent.locationX;
    const y = e.nativeEvent.locationY;
    onClick(x, y);
    if (!isTextToolSelected) {
      if (selectedShape === "none") {
        addAction({
          type: "path",
          path: [`M${x} ${y}`],
          color,
          stroke,
          size: shapeSize,
        });
        setIsDrawing(true);
      } else {
        drawShape(x, y);
      }
    }
  };

  const handleResponderMove = (e) => {
    if (!isTextToolSelected && isDrawing) {
      updatePath(e.nativeEvent.locationX, e.nativeEvent.locationY);
    }
  };

  const handleResponderEnd = () => {
    setIsDrawing(false);
  };

  return (
    <View
      onStartShouldSetResponder={() => true}
      onMoveShouldSetResponder={() => true}
      onResponderStart={handleResponderStart}
      onResponderMove={handleResponderMove}
      onResponderEnd={handleResponderEnd}
    >
      <Svg>
        {actions.map((action, i) => {
          if (action.type === "path") {
            return (
              <Path
                key={i}
                d={action.path.join(" ")}
                fill="none"
                strokeWidth={`${action.stroke}px`}
                stroke={action.color}
              />
            );
          } else if (action.type === "text") {
            return (
              <SvgText
                key={i}
                x={action.x}
                y={action.y}
                fill={action.color}
                fontSize="20"
                fontWeight="bold"
              >
                {action.text}
              </SvgText>
            );
          }
        })}
      </Svg>
    </View>
  );
}
