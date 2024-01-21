import * as React from "react";
import { useEffect, useState } from "react";
import { TextInput } from "react-native-paper";

export default function EditFlashcard(props: {
  listItem: any;
  sendAnswer: (answer: string) => any;
  onStartEditing?: () => any;
  onFinishEditing?: () => any;
}) {
  const { listItem, sendAnswer, onStartEditing, onFinishEditing } = props;
  const [answer, setAnswer] = useState(listItem.answer);
  useEffect(() => {
    sendAnswer(answer);
  }, []);
  return (
    <TextInput
      label="Answer"
      testID="input-edit-flashcard-answer"
      multiline={true}
      value={answer}
      onFocus={onStartEditing}
      onBlur={onFinishEditing}
      onChangeText={(answer) => {
        setAnswer(answer);
        sendAnswer(answer);
      }}
    />
  );
}
