import { useEffect, useState } from "react";
import { TextInput, Checkbox } from "react-native-paper";

//takes some time to load for exercises, maybe there is a more efficient way to do this?
export default function TextInputWithCheckbox(props: {
  width?: any;
  sendAnswer?: ([string, boolean]) => any;
  listItemAnswer?: [string, boolean, number];
  [name: string]: any;
}) {
  const [answer, setAnswer] = useState<[string, boolean]>(["", false]);
  useEffect(() => {
    if (!props.listItemAnswer) return;
    if (answer[0] !== "" && answer[1] !== false) return;
    setAnswer([props.listItemAnswer[0], props.listItemAnswer[1]]);
  }, [props.listItemAnswer]);

  return (
    <TextInput
      style={{
        marginBottom: 8,
        width: props.width || "auto",
      }}
      right={
        <TextInput.Icon
          icon={() => (
            <Checkbox
              status={answer[1] ? "checked" : "unchecked"}
              onPress={() => {
                setAnswer([answer[0], !answer[1]]);
                props.sendAnswer([answer[0], !answer[1]]);
              }}
            />
          )}
        />
      }
      label={"Answer " + props.number}
      //multiline={true}
      blurOnSubmit={true}
      value={answer[0]}
      onChangeText={(text) => {
        setAnswer([text, answer[1]]);
        props.sendAnswer([text, answer[1]]);
      }}
    />
  );
}
