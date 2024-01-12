import * as React from "react";
import { useEffect, useState } from "react";
import { TextInput } from "react-native-paper";

export default function EditFlashcard(props: {
  listItem: any;
  sendAnswer: (answer: string) => any;
  onStartEditing?: () => any;
  onFinishEditing?: () => any;
}) {
  const [answer, setAnswer] = useState(props.listItem.answer);
  useEffect(() => {
    props.sendAnswer(answer);
  }, []);
  return (
    <TextInput
      label="Answer"
      testID="input-edit-flashcard-answer"
      multiline={true}
      value={answer}
      onFocus={props.onStartEditing}
      onBlur={props.onFinishEditing}
      onChangeText={(answer) => {
        setAnswer(answer);
        props.sendAnswer(answer);
      }}
    />
  );
}
