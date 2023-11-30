import { useEffect, useState } from "react";
import { useTheme } from "react-native-paper";
import TextInputWithCheckbox from "../common/TextInputWithCheckbox";
import {
  useAnswersExercises,
  useDeleteExercise,
  useUpsertAnswersExercise,
  useUpsertExercise,
} from "../../utils/hooks";
import LoadingOverlay from "../alerts/LoadingOverlay";

export default function EditExercise(props: {
  listItem: any;
  sendAnswers: (answers: [string, boolean, number][]) => any;
}) {
  const theme = useTheme();
  const array = Array.from({ length: 4 }, (_, index) => index + 1) as number[];
  const [isInitialized, setIsInitialized] = useState<boolean>(false);
  const [answers, setAnswers] = useState<[string, boolean, number][]>([
    ["", false, 0],
    ["", false, 0],
    ["", false, 0],
    ["", false, 0],
  ]);
  const { data, error, isLoading } = useAnswersExercises(props.listItem.id);
  useEffect(() => {
    if (!isInitialized) return;
    props.sendAnswers(answers);
  }, [answers]);

  useEffect(() => {
    if (!data || isInitialized) return;
    setAnswers([
      [data[0].answer, data[0].is_correct, data[0].id],
      [data[1].answer, data[1].is_correct, data[1].id],
      [data[2].answer, data[2].is_correct, data[2].id],
      [data[3].answer, data[3].is_correct, data[3].id],
    ]);
    setIsInitialized(true);
  }, [data]);
  function getAnswer(number: number) {
    return ([text, checked]: [string, boolean]) => {
      let newAnswers = [...answers];
      newAnswers[number - 1] = [text, checked, answers[number - 1][2]];
      setAnswers(newAnswers);
    };
  }

  if (error) return <LoadingOverlay visible={isLoading} />;
  return array.map((e) => {
    return (
      <TextInputWithCheckbox
        key={e}
        listItemAnswer={answers[e - 1]}
        sendAnswer={getAnswer(e)}
        number={e}
      />
    );
  });
}
