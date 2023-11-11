import { useState } from "react";
import { TextInput, Checkbox } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";

export default function TextInputWithCheckbox(props: {
  width?: any;
  sendAnswer?: any;
  listItemAnswer?: [string, boolean];
  [name: string]: any;
}) {
  //props.listItemAnswer[1] doesn't work correctly because it is a string converted to a boolean. I tried to have the answers be a array of [string, boolean] but supabase seemingly just supports string[]
  //another alternative would be to have 5 columns in the database, one for each answer 1-4 as a string and one as boolean[4] with the information regarding which answer is correct
  const [checked, setChecked] = props.listItemAnswer ? useState(props.listItemAnswer[1]) : useState(false); 
  const [answer, setAnswer] = props.listItemAnswer
    ? useState(props.listItemAnswer)
    : useState<[string, boolean]>(["", false]);
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
      value={answer[0]}
      onChangeText={(text) => {
        setAnswer([text, checked]);
        props.sendAnswer([text, checked]);
      }}
    />
  );
}
