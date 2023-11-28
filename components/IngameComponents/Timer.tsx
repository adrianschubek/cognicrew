import { useFocusEffect } from "@react-navigation/native";
import { useState, useEffect, useMemo } from "react";
import { ProgressBar } from "react-native-paper";
import LoadingOverlay from "../alerts/LoadingOverlay";

export default function Timer(props: {
  roundEndsAt: number;
  onTimeUp: () => void;
}) {
  const initialRemainingTime = useMemo(
    () => +(props.roundEndsAt - Date.now()) / 1000,
    [props.roundEndsAt],
  );
  const [remainingTime, setRemainingTime] = useState(initialRemainingTime);
  useFocusEffect(() => {
    const sec = setInterval(
      () => setRemainingTime(+(props.roundEndsAt - Date.now()) / 1000),
      1000,
    );
    remainingTime <= 0 && clearInterval(sec);
    return () => {
      clearInterval(sec);
      props.onTimeUp();
    };
  });

  useEffect(() => {
    setRemainingTime(+(props.roundEndsAt - Date.now()) / 1000);
  }, [props.roundEndsAt]);
  return (
    <ProgressBar
      progress={remainingTime / initialRemainingTime}
      color={"#6200ee"}
    />
  );
}
