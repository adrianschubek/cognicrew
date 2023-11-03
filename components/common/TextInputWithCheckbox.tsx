import { useState } from "react";
import { TextInput, Checkbox } from "react-native-paper";
import { responsiveHeight } from "react-native-responsive-dimensions";

export default function TextInputWithCheckbox({
  listItemAnswer,
  number,
}: {
  listItemAnswer: string;
  [name: string]: any;
}) {
  const [checked, setChecked] = useState(false);
  const [answer, setAnswer] = useState(listItemAnswer);
  return (
    <TextInput
      style={{ marginBottom: responsiveHeight(1) }}
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
      label={"Answer " + number}
      multiline={true}
      value={/*hier muss dann listItem.answer hin*/ listItemAnswer}
      onChangeText={(listItemAnswer) => {
        setAnswer(listItemAnswer);
        console.log(listItemAnswer);
        //update backend
      }}
    />
  );
}
