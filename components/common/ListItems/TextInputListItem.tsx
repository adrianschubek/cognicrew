import { Portal, TextInput } from "react-native-paper";
import { useDeleteSet, useUpsertSet } from "../../../utils/hooks";
import { useState } from "react";
import LoadingOverlay from "../../alerts/LoadingOverlay";
import React from "react";
import { Keyboard } from "react-native";

export default function TextInputListItem({ item }) {
  const { isMutating, trigger: deleteSet } = useDeleteSet();
  const { isMutating: isMutating2, trigger: upsertSet } = useUpsertSet();
  const [title, setTitle] = useState(item.name);
  const save = () => {
    upsertSet({
      // @ts-ignore
      id: item.id,
      name: title,
      type: item.type,
      project_id: 1,
    });
  };
  return (
    <React.Fragment>
      <LoadingOverlay visible={isMutating || isMutating2} />
      <TextInput
        value={title}
        mode="flat"
        style={{ backgroundColor: "" }}
        right={
          <TextInput.Icon
            forceTextInputFocus={false}
            icon="close"
            onPress={() => {
              deleteSet({ id: item.id });
            }}
          />
        }
        onChangeText={(text) => {
          setTitle(text);
        }}
        onEndEditing={save}
        onSubmitEditing={() => {
          save();
          Keyboard.dismiss();
          console.log(item.name);
        }}
      />
    </React.Fragment>
  );
}
