import { use } from "chai";
import { useEffect, useState } from "react";
import { TextInput, Checkbox } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";

export default function TextInputWithCheckbox(props: {
  width?: any;
  sendAnswer?: ([string, boolean]) => any;
  listItemAnswer?: [string, boolean, number];
  performOnTextChange?: () => any;
  [name: string]: any;
}) {
  const [answer, setAnswer] = useState<[string, boolean, number]>([
    "",
    false,
    0,
  ]);

  useEffect(() => {
    if (!props.listItemAnswer) return;
    if (answer[0] !== "" && answer[1] != false && answer[2] != 0) return;
    setAnswer(props.listItemAnswer);
  }, [props.listItemAnswer]);

  return (
    <TextInput
      style={{
        marginBottom: responsiveHeight(1),
        width: props.width || "auto",
      }}
      right={
        <TextInput.Icon
          icon={() => (
            <Checkbox
              status={answer[1] ? "checked" : "unchecked"}
              onPress={() => {
                setAnswer([answer[0], !answer[1], answer[2]]);
                //the answer is true if checked === true
              }}
            />
          )}
        />
      }
      label={"Answer " + props.number}
      multiline={true}
      value={answer[0]}
      onChangeText={(text) => {
        setAnswer([text, answer[1], answer[2]]);
        props.sendAnswer([text, answer[1]]);
      }}
      onEndEditing={() => {
        props.performOnTextChange()
          ? props.performOnTextChange()
          : () => {}; /*if performOnTextChange is not defined, do nothing;*/
      }}
    />
  );
}
