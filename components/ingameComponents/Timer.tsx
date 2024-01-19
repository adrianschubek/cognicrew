import { useState, useEffect, useMemo } from "react";
import { ProgressBar } from "react-native-paper";
import TimingFunction from "../common/TimingFunction";

export default function Timer(props: {
  roundEndsAt: number;
  onTimeUp: () => void;
}) {
  const { roundEndsAt, onTimeUp } = props;
  const amountOfSeconds = useMemo(
    () => (roundEndsAt - Date.now()) / 1000,
    [roundEndsAt],
  );
  const [remainingTime, setRemainingTime] = useState<number>(amountOfSeconds);
  useEffect(() => {
    setRemainingTime((roundEndsAt - Date.now()) / 1000);
  }, [roundEndsAt]);
  return (
    <>
      <TimingFunction
        key={amountOfSeconds} //remounts component when amountOfSeconds changes
        amountOfSeconds={amountOfSeconds}
        intervall={1000}
        onTimeUp={onTimeUp}
        sendUpdate={(remainingTime) => {
          setRemainingTime(remainingTime);
          console.log(remainingTime);
        }}
      />
      <ProgressBar
        progress={remainingTime / amountOfSeconds}
        color={"#6200ee"}
      />
    </>
  );
}
