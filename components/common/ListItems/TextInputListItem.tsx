import { TextInput } from "react-native-paper";
import { useDeleteSet, useUpsertSet } from "../../../utils/hooks";
import { useEffect, useRef, useState } from "react";
import LoadingOverlay from "../../alerts/LoadingOverlay";
import React from "react";
import { Keyboard } from "react-native";
import { useProjectStore } from "../../../stores/ProjectStore";

export default function TextInputListItem({ item }) {
  const { isMutating, trigger: deleteSet } = useDeleteSet();
  const { isMutating: isMutating2, trigger: upsertSet } = useUpsertSet();
  const [title, setTitle] = useState(item.name);
  const projectId = useProjectStore((state) => state.projectId);
  const save = () => {
    upsertSet({
      //@ts-expect-error
      id: item.id,
      name: title,
      type: item.type,
      project_id: projectId,
    });
  };
  const createSetRef = useRef(save);
  createSetRef.current = save;
  useEffect(() => {
    //save Set when unmounted
    return () => {
      createSetRef.current();
    };
  }, []);
  return (
    <React.Fragment>
      <TextInput
        testID="flashcard-sets-list-adjust-button"
        value={title}
        mode="flat"
        disabled={isMutating || isMutating2}
        style={{ backgroundColor: "" }}
        right={
          <TextInput.Icon
            testID="button-delete-set"
            forceTextInputFocus={false}
            icon="close"
            disabled={isMutating || isMutating2}
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
          //console.log(item.name);
        }}
      />
    </React.Fragment>
  );
}
