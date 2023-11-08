import React, { useState } from "react";
import { Animated, TouchableOpacity } from "react-native";
import { useAnimatedStyle, withTiming } from "react-native-reanimated";
import { COLORS, STROKE_SIZE, WIDTH } from "./Constants";

import { styles } from "./DrawingStyle";
import { StrokeView } from "./StrokeView"

export  const StrokeSettings = ({
    onChangeColor,
    onChangeStroke,
    currentColor,
    strokeWidth,
  }) => {
    // State of each container: open or closed
    const [openColor, setOpenColor] = useState(false);
    const [openStroke, setOpenStroke] = useState(false);
    // Width of each container, a derived state from open/close state
    const COLOR_CONTAINER_WIDTH = openColor ? WIDTH - 90 : 60;
    const STROKE_CONTAINER_WIDTH = openStroke ? WIDTH - 90 : 60;
    // Animated styles to give life to the action of opening and closing each container
    const colorAnimatedStyles = useAnimatedStyle(() => {
      return {
        left: 10,
        width: withTiming(COLOR_CONTAINER_WIDTH),
      };
    });
    const strokeAnimatedStyles = useAnimatedStyle(() => {
      return {
        right: 10,
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
      setOpenColor(old => !old);
      setOpenStroke(false);
    };
    const handleToggleStrokeSize = () => {
      setOpenStroke(old => !old);
      setOpenColor(false);
    };
  
    return (
      <>
        <Animated.View style={[styles.container, colorAnimatedStyles]}>
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
              COLORS.map(c => {
                return (
                  <TouchableOpacity
                    onPress={() => handleColorSelector(c)}
                    style={[{backgroundColor: c}, styles.colorButton]}
                  />
                );
              })}
          </>
        </Animated.View>
        <Animated.View style={[styles.container, strokeAnimatedStyles]}>
          <>
            {!openStroke && (
              <TouchableOpacity
                onPress={handleToggleStrokeSize}
                style={[styles.colorButton]}>
                <StrokeView color={currentColor} size={strokeWidth} />
              </TouchableOpacity>
            )}
            {openStroke &&
              STROKE_SIZE.map(s => {
                return (
                  <TouchableOpacity
                    key={s}
                    onPress={() => handleStrokeSelector(s)}
                    style={[styles.colorButton]}>
                    <StrokeView color={currentColor} size={s} />
                  </TouchableOpacity>
                );
              })}
          </>
        </Animated.View>
      </>
    );
  };