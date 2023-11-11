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
  listItemAnswer?: [string, boolean];
  [name: string]: any;
}) {
  const [checked, setChecked] = useState(false);
  const [answer, setAnswer] =  useState<[string, boolean]>(props.listItemAnswer??["", false]);

  useEffect(() => {
    if (!props.listItemAnswer) return;
    setAnswer(props.listItemAnswer);
    setChecked(props.listItemAnswer[1]);
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
              status={checked ? "checked" : "unchecked"}
              onPress={() => {
                setChecked((c) => {
                  props.sendAnswer([answer[0], !c]);
                  return !c;
                });
                //the answer is true if checked === true
              }}
            />
          )}
        />
      }
      label={/*"Answer " + props.number*/ answer[0]}
      multiline={true}
      value={answer[0]}
      onChangeText={(text) => {
        setAnswer([text, checked]);
        props.sendAnswer([text, checked]);
        console.log("anwer[0]" + answer[0]);
        console.log("props.listItemAnswer: " + props.listItemAnswer);
      }}
    />
  );
}
