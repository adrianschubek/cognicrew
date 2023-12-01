import * as React from "react";
import { useState } from "react";
import { TextInput } from "react-native-paper";

export default function EditFlashcard(props: {
  listItem: any;
  sendAnswer: (answer: string) => any;
}) {
  const [answer, setAnswer] = useState(props.listItem.answer);

  return (
    <TextInput
      label="Answer:"
      multiline={true}
      value={answer}
      onChangeText={(answer) => {
        setAnswer(answer);
        props.sendAnswer(answer);
      }}
    />
  );
}
