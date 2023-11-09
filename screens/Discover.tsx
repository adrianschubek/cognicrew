// import { useEffect } from "react";
// import { Text } from "react-native-paper";
// import Animated, {
//   Easing,
//   useAnimatedStyle,
//   useSharedValue,
//   withRepeat, withTiming
// } from "react-native-reanimated";

import { Text } from "react-native-paper";

// const duration = 2000;
// const easing = Easing.inOut(Easing.ease);

// export default function Discover() {
//   const sv = useSharedValue(0);

//   useEffect(() => {
//     sv.value = withRepeat(
//       withTiming(10, {
//         duration,
//         easing,
//       }),
//       -1,
//     );
//   }, []);

//   const animatedStyle = useAnimatedStyle(() => ({
//     transform: [
//       { rotateZ: sv.value + "deg" },
//       { scaleX: sv.value / 10 },
//       { scaleY: sv.value / 10 },
//     ],
//   }));

//   return (
//     <Animated.View
//       style={{
//         ...animatedStyle,
//         display: "flex",
//         alignContent: "center",
//         alignSelf: "center",
//         alignItems: "center",
//         height: "100%",
//         width: "100%",
//         justifyContent: "center",
//       }}
//     >
//       <Text style={{ fontSize: 32, textAlign: "center", marginTop: "65%" }}>
//         chupapi muñaño
//       </Text>
//     </Animated.View>
//   );
// }

export default function Discover() {
  return <Text>chupapi muñaño</Text>;
}