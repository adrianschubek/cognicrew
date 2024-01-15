import React, { useRef, useState } from "react";
import { SafeAreaView, View } from "react-native";
import Svg, { Path, Text as SvgText } from "react-native-svg";
import { useWhiteboardStore } from "../../stores/WhiteboardStore";
import { SketchCanvas, SketchCanvasRef } from "rn-perfect-sketch-canvas";
import { Button } from "react-native-paper";

export default function Canvas(props: {
  onClick: (x, y) => void;
  isTextToolSelected;
  actions;
  addAction;
  updatePath;
  color;
}) {
  const { onClick, isTextToolSelected, actions, addAction, updatePath, color } =
    props;
  const [isDrawing, setIsDrawing] = useState<boolean>(false);
  const { stroke, selectedShape, shapeSize } = useWhiteboardStore();

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
      const x = e.nativeEvent.locationX;
      const y = e.nativeEvent.locationY;
      const lastAction = actions[actions.length - 1];
      lastAction.path = [...lastAction.path, `L${x} ${y}`];
      updatePath(lastAction);
    }
  };

  const handleResponderEnd = () => {
    setIsDrawing(false);
  };
  const canvasRef = useRef<SketchCanvasRef>(null);
  return (
    <SafeAreaView style={{ flex: 1 }}>
      <SketchCanvas
        ref={canvasRef}
        strokeColor={"black"}
        strokeWidth={8}
        containerStyle={{ flex: 1 }}
      />
      <Button onPress={canvasRef.current?.reset}>Reset</Button>
    </SafeAreaView>
  );
}
