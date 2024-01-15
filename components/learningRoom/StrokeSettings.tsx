import React, { useState } from "react";
import { TouchableOpacity, View, StyleSheet } from "react-native";
import { Text } from "react-native-paper";
import Animated from "react-native-reanimated";
import { useAnimatedStyle, withTiming } from "react-native-reanimated";
import { COLORS, STROKE_SIZE, WIDTH } from "./Constants";
import { StrokeView } from "./StrokeView";
import { useWhiteboardStore } from "../../stores/WhiteboardStore";
import Slider from "@react-native-community/slider";

export const StrokeSettings = (props: { color; sendColor }) => {
  const { sendColor } = props;
  const [color, setColor] = useState<string>(props.color);
  const { stroke, shapeSize, setStroke, setShapeSize } = useWhiteboardStore();

  const [openColor, setOpenColor] = useState(false);
  const [openStroke, setOpenStroke] = useState(false);
  // Width of each container, a derived state from open/close state
  const COLOR_CONTAINER_WIDTH = openColor ? WIDTH - 150 : 35;
  const STROKE_CONTAINER_WIDTH = openStroke ? WIDTH - 150 : 35;
  // Animated styles to give life to the action of opening and closing each container

  const colorAnimatedStyles = useAnimatedStyle(() => {
    return {
      //left: 10,
      width: withTiming(COLOR_CONTAINER_WIDTH),
    };
  });
  const strokeAnimatedStyles = useAnimatedStyle(() => {
    return {
      //right: 10,
      width: withTiming(STROKE_CONTAINER_WIDTH),
    };
  });
  // handling the selection of each container
  const handleColorSelector = (c: string) => {
    setColor(c);
    sendColor(c);
    setOpenColor(false);
  };
  const handleStrokeSelector = (s: number) => {
    setStroke(s);
    setOpenStroke(false);
  };
  // handling open and close, where if you open A, B should be closed
  const handleToggleColor = () => {
    setOpenColor(!openColor);
    setOpenStroke(false);
  };
  const handleToggleStrokeSize = () => {
    setOpenStroke(!openStroke);
    setOpenColor(false);
  };

  function renderSelection(
    open: boolean,
    selectionItems: number[] | string[],
    handleToggle: () => void,
    handleSelection: (selection) => void,
    settingsType: string,
  ) {
    return (
      <Animated.View
        style={[
          {
            flexDirection: "row",
            justifyContent: "space-around",
            paddingVertical: 10,
          },
          settingsType === "stroke" && { marginLeft: 10 },
          settingsType === "stroke"
            ? strokeAnimatedStyles
            : colorAnimatedStyles,
        ]}
      >
        {!open &&
          (settingsType === "stroke" ? (
            <TouchableOpacity
              onPress={handleToggle}
              style={[styles.colorButton, { justifyContent: "center" }]}
            >
              <StrokeView color={color} size={stroke} />
            </TouchableOpacity>
          ) : (
            <TouchableOpacity
              onPress={handleToggle}
              style={[
                {
                  backgroundColor: color,
                },
                styles.colorButton,
              ]}
            />
          ))}
        {open &&
          selectionItems.map((s) => {
            return settingsType === "stroke" ? (
              <TouchableOpacity
                key={s}
                onPress={() => handleSelection(s)}
                style={[styles.colorButton, { justifyContent: "center" }]}
              >
                <StrokeView color={color} size={s} />
              </TouchableOpacity>
            ) : (
              <TouchableOpacity
                key={s}
                onPress={() => handleSelection(s)}
                style={[{ backgroundColor: s }, styles.colorButton]}
              />
            );
          })}
      </Animated.View>
    );
  }
  const settings = [
    {
      title: "Select drawing color",
      customNode: renderSelection(
        openColor,
        COLORS,
        handleToggleColor,
        handleColorSelector,
        "color",
      ),
    },
    {
      title: "Select line size",
      customNode: renderSelection(
        openStroke,
        STROKE_SIZE,
        handleToggleStrokeSize,
        handleStrokeSelector,
        "stroke",
      ),
    },
    {
      title: "Select form extent",
      customNode: (
        <Slider
          style={{ width: 200, height: 40 }}
          minimumValue={10}
          maximumValue={100}
          step={1}
          value={shapeSize}
          onValueChange={(value) => setShapeSize(value)}
        />
      ),
    },
  ];
  return (
    <View>
      {settings.map((s, index) => {
        return (
          <View key={index}>
            <Text variant="titleMedium">{s.title}</Text>
            {s.customNode}
          </View>
        );
      })}
    </View>
  );
};

const styles = StyleSheet.create({
  colorButton: {
    width: 35,
    height: 35,
    borderRadius: 30,
  },
});
