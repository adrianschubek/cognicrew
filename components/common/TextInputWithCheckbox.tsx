import { useEffect, useState } from "react";
import { TextInput, Checkbox } from "react-native-paper";

//takes some time to load for exercises, maybe there is a more efficient way to do this?
export default function TextInputWithCheckbox(props: {
  width?: any;
  number: number;
  sendAnswer?: ([text, checked]: [string, boolean]) => void;
  listItemAnswer?: [string, boolean, number];
  flex?: number;
  onStartEditing?: () => any;
  onFinishEditing?: () => any;
  [name: string]: any;
}) {
  const [answerText, setAnswerText] = useState<string>("");
  const [answerIsCorrect, setAnswerIsCorrect] = useState<boolean>(false);

  useEffect(() => {
    if (!props.listItemAnswer) return;
    setAnswerText(props.listItemAnswer[0]);
    setAnswerIsCorrect(props.listItemAnswer[1]);
  }, [props.listItemAnswer]);

  return (
    <TextInput
      style={{
        marginBottom: 8,
        flex: props.flex || 0,
        width: props.width || "auto",
      }}
      onFocus={props.onStartEditing}
      onBlur={props.onFinishEditing}
      right={
        <TextInput.Icon
          icon={() => (
            <Checkbox
              status={answerIsCorrect ? "checked" : "unchecked"}
              onPress={() => {
                setAnswerIsCorrect(!answerIsCorrect);
                props.sendAnswer([answerText, !answerIsCorrect]);
              }}
            />
          )}
        />
      }
      label={"Answer " + props.number}
      //multiline={true}
      blurOnSubmit={true}
      value={answerText}
      onChangeText={(text) => {
        setAnswerText(text);
        props.sendAnswer([text, answerIsCorrect]);
      }}
    />
  );
}
