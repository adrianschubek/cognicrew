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

    if (remainingTime <= 0) {
      clearInterval(sec);
      onTimeUp && onTimeUp();
    }
    return () => {
      clearInterval(sec);
    };
  });

  useEffect(() => {
    sendUpdate && sendUpdate(remainingTime);
  }, [remainingTime]);

  return null;
}
