import { useState } from "react";
import { TextInput, Checkbox } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";

export default function TextInputWithCheckbox(props: {
  width?: any;
  sendAnswer?: any;
  listItemAnswer?: any;
  [name: string]: any;
}) {
  const [checked, setChecked] = useState(false); 
  const [answer, setAnswer] = props.listItemAnswer
    ? useState(props.listItemAnswer)
    : useState("");
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
                setChecked(!checked);
                //the answer is true if checked === true
              }}
            />
          )}
        />
      }
      label={"Answer " + props.number}
      multiline={true}
      value={answer}
      onChangeText={(text) => {
        setAnswer(text);
      }}
    />
  );
}
