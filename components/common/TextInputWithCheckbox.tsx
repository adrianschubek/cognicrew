import { useState } from "react";
import { TextInput, Checkbox } from "react-native-paper";

export default function TextInputWithCheckbox({listItem}){
    const [checked, setChecked] = useState(false);
    const [answer2, setAnswer2] = useState(listItem.answer2);
    return(
        <TextInput
        right={
          <TextInput.Icon
            icon={() => (
              <Checkbox
                status={checked ? "checked" : "unchecked"}
                onPress={() => {
                  setChecked(!checked);
                }}
              />
            )}
          />
        }
        label="Answer 1:"
        multiline={true}
        value={/*hier muss dann listItem.answer hin*/ answer2}
        onChangeText={(answer2) => {
          setAnswer2(answer2);
          console.log(answer2);
          //update backend
        }}
      />
    )
}