import { useFocusEffect } from "@react-navigation/native";
import { useState, useEffect, useMemo } from "react";
import { ProgressBar } from "react-native-paper";
import LoadingOverlay from "../alerts/LoadingOverlay";
import {
  useAnimatedProps,
  useAnimatedStyle,
  useDerivedValue,
  useSharedValue,
  withTiming,
} from "react-native-reanimated";

export default function Timer(props: { roundEndsAt: number }) {
  const initialRemainingTime = useMemo(
    () => +(props.roundEndsAt - Date.now()) / 1000,
    [props.roundEndsAt],
  );
  const [remainingTime, setRemainingTime] = useState(initialRemainingTime);
  //const progress = useSharedValue(1);

  useFocusEffect(() => {
    const sec = setInterval(
      () => setRemainingTime(+(props.roundEndsAt - Date.now()) / 1000),
      1000,
    );
    if (remainingTime <= 0) {
      console.log("hallo");
    }
    remainingTime <= 0 && clearInterval(sec);
    return () => clearInterval(sec);
  });
  useEffect(() => {
    setRemainingTime(+(props.roundEndsAt - Date.now()) / 1000);
    //progress.value = withTiming(0, { duration: 3000});
  }, [props.roundEndsAt]);

  return (
    <ProgressBar
      //animatedValue={progress.value}
      progress={remainingTime / initialRemainingTime}
      color={"#6200ee"}
    />
  );
}
