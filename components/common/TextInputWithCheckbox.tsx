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
  const {
    width,
    number,
    sendAnswer,
    listItemAnswer,
    flex,
    onStartEditing,
    onFinishEditing,
  } = props;
  useEffect(() => {
    if (!listItemAnswer) return;
    setAnswerText(listItemAnswer[0]);
    setAnswerIsCorrect(listItemAnswer[1]);
  }, [listItemAnswer]);

  return (
    <TextInput
      style={{
        marginBottom: 8,
        flex: flex || 0,
        width: width || "auto",
      }}
      onFocus={onStartEditing}
      onBlur={onFinishEditing}
      right={
        <TextInput.Icon
          icon={() => (
            <Checkbox
              status={answerIsCorrect ? "checked" : "unchecked"}
              onPress={() => {
                setAnswerIsCorrect(!answerIsCorrect);
                sendAnswer([answerText, !answerIsCorrect]);
              }}
            />
          )}
        />
      }
      label={"Answer " + number}
      //multiline={true}
      blurOnSubmit={true}
      value={answerText}
      onChangeText={(text) => {
        setAnswerText(text);
        sendAnswer([text, answerIsCorrect]);
      }}
    />
  );
}
