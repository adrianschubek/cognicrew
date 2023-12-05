import React from "react";
import { TouchableOpacity, View, StyleSheet } from "react-native";
import { Text } from "react-native-paper";
import Animated from "react-native-reanimated";
import { useAnimatedStyle, withTiming } from "react-native-reanimated";
import { COLORS, STROKE_SIZE, WIDTH } from "./Constants";
import { StrokeView } from "./StrokeView";
import { useWhiteboardStore } from "../../stores/WhiteboardStore";
import Slider from "@react-native-community/slider";

export const StrokeSettings = ({
  onChangeColor,
  onChangeStroke,
  currentColor,
  strokeWidth,
}) => {
  const { openColor, openStroke, setOpenStroke, setOpenColor } =
    useWhiteboardStore();
  // Width of each container, a derived state from open/close state
  const COLOR_CONTAINER_WIDTH = openColor ? WIDTH - 150 : 20;
  const STROKE_CONTAINER_WIDTH = openStroke ? WIDTH - 150 : 20;
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
    onChangeColor(c);
    setOpenColor(false);
  };
  const handleStrokeSelector = (s: number) => {
    onChangeStroke(s);
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

  const { setShapeSize, shapeSize } = useWhiteboardStore();

  return (
    <View style={styles.columnStyle}>
        <Text style={styles.heading}>Select drawing color</Text>
        <Animated.View style={[styles.container, colorAnimatedStyles, {marginLeft: 5, marginTop: 10}]}>
          <>
            {!openColor && (
              <TouchableOpacity
                onPress={handleToggleColor}
                style={[
                  {
                    backgroundColor: currentColor,
                  },
                  styles.colorButton,
                ]}
              />
            )}
            {openColor &&
              COLORS.map((c) => {
                return (
                  <TouchableOpacity
                    key={c}
                    onPress={() => handleColorSelector(c)}
                    style={[{ backgroundColor: c }, styles.colorButton]}
                  />
                );
              })}
          </>
        </Animated.View>

      <Text style={[styles.heading, {marginTop: 30}]}>Select pen size</Text>
      <Animated.View style={[styles.container, strokeAnimatedStyles, {marginLeft: 10, marginTop: 20}]}>
        <>
          {!openStroke && (
            <TouchableOpacity
              onPress={handleToggleStrokeSize}
              style={[styles.colorButton]}
            >
              <StrokeView color={currentColor} size={strokeWidth} />
            </TouchableOpacity>
          )}
          {openStroke &&
            STROKE_SIZE.map((s) => {
              return (
                <TouchableOpacity
                  key={s}
                  onPress={() => handleStrokeSelector(s)}
                  style={[styles.colorButton]}
                >
                  <StrokeView color={currentColor} size={s} />
                </TouchableOpacity>
              );
            })}
        </>
      </Animated.View>

        <Text style={styles.heading}>Select form extent</Text>
        <Slider
          style={styles.slider}
          minimumValue={10}
          maximumValue={100}
          step={1}
          value={shapeSize}
          onValueChange={(value) => setShapeSize(value)}
        />
    </View>
  );
};

const styles = StyleSheet.create({
  slider: {
    width: 200,
    height: 40,
  },
  sliderLabel: {
    marginRight: 10,
  },
  columnStyle: {
    paddingTop: 10,
    flexDirection: "column",
  },
  heading: {
    fontSize: 20,
    fontWeight: "bold",
  },

  container: {
    flexDirection: "row",
    justifyContent: "space-around",
  },
  colorButton: {
    width: 35,
    height: 35,
    borderRadius: 30,
  },
});
