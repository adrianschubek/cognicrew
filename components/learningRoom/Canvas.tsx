import React from "react";
import { ColorValue, TouchableOpacity, View } from "react-native";
import Svg, { Path } from "react-native-svg";

import { useWhitebardStore } from "../../stores/WhiteboardStore";



export const Canvas = () => {
  const { color, stroke, setPaths, paths } = useWhitebardStore();

  const setNewPath = (x: number, y: number) => {
    console.log("call setNewPath")
    setPaths((prev) => { 
      const result = [...prev, { path: [`M${x} ${y}`], color, stroke }];
      return result;
    });
  };

  const updatePath = (x: number, y: number) => {
    setPaths((prev) => {
      const currentPath = paths[paths.length - 1];
      currentPath && currentPath.path.push(`L${x} ${y}`);
      return currentPath ? [...prev.slice(0, -1), currentPath] : prev;
    });
  };

  return (
    <>
      <View 
        onStartShouldSetResponder={() => true}
        onMoveShouldSetResponder={() => true}
        onResponderStart={(e) => {
          setNewPath(e?.nativeEvent?.locationX, e?.nativeEvent?.locationY);
        }}
        onResponderMove={(e) => {
          updatePath(e?.nativeEvent?.locationX, e?.nativeEvent?.locationY);
        }}
      >
        {/* <TouchableOpacity onPress={() => setPaths([])}></TouchableOpacity> */}
        <Svg>
          {paths.map(({ path, color: c, stroke: s }, i) => {
            return (
              <Path
                key={i}
                d={`${path.join(" ")}`}
                fill="none"
                strokeWidth={`${s}px`}
                stroke={c as ColorValue}
              />
            );
          })}
        </Svg>
      </View>
    </>
  );
};