import { useFocusEffect } from "@react-navigation/native";
import { useEffect, useState } from "react";

export default function TimingFunction(props: {
  amountOfSeconds: number;
  intervall: number;
  onTimeUp?: () => void;
  sendUpdate?: (remainingTime: number) => void;
}) {
  const { amountOfSeconds, intervall, onTimeUp, sendUpdate } = props;
  const [remainingTime, setRemainingTime] = useState(amountOfSeconds);

  useFocusEffect(() => {
    const sec = setInterval(
      () => setRemainingTime((prevTime) => prevTime - intervall / 1000),
      intervall,
    );

    remainingTime <= 0 && clearInterval(sec);
    return () => {
      clearInterval(sec);
      onTimeUp && onTimeUp();
    };
  });

  useEffect(() => {
    sendUpdate && sendUpdate(remainingTime);
  }, [remainingTime]);

  return null;
}
