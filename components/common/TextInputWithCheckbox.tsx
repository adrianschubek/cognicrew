import { useState } from "react";
import { TextInput, Checkbox } from "react-native-paper";
import { responsiveHeight, responsiveWidth } from "react-native-responsive-dimensions";

export default function TextInputWithCheckbox(props:{
  width? : any
  listItemAnswer: string;
  [name: string]: any;
}) {
  const [checked, setChecked] = useState(false);
  const [answer, setAnswer] = useState(props.listItemAnswer);
  return (
    <TextInput
      style={{ marginBottom: responsiveHeight(1), width:props.width || "auto" }}
      right={
        <TextInput.Icon
          icon={() => (
            <Checkbox
              status={checked ? "checked" : "unchecked"}
              onPress={() => {
                setChecked(!checked);
                //  listItem.isCorrect === checked
              }}
            />
          )}
        />
      }
      label={"Answer " + props.number}
      multiline={true}
      value={/*hier muss dann listItem.answer hin*/ answer}
      onChangeText={(answer) => {
        setAnswer(answer);
        //update backend
      }}
    />
  );
}
