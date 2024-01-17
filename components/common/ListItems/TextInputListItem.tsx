import { HelperText, TextInput } from "react-native-paper";
import { useDeleteSet, useUpsertSet } from "../../../utils/hooks";
import { Fragment, useEffect, useRef, useState } from "react";
import React from "react";
import { useProjectStore } from "../../../stores/ProjectStore";

export default function TextInputListItem(props: {
  item;
  sendSetDeleted: (itemId: number) => void;
}) {
  const { item, sendSetDeleted } = props;
  const { isMutating, trigger: deleteSet } = useDeleteSet();
  const { isMutating: isMutating2, trigger: upsertSet } = useUpsertSet();
  const [title, setTitle] = useState(item.name);
  const projectId = useProjectStore((state) => state.projectId);
  const save = () => {
    if (title === "") {
      return;
    }
    upsertSet({
      //@ts-expect-error
      id: item.id,
      name: title,
      type: item.type,
      project_id: projectId,
    });
  };
  const saveRef = useRef(save);
  const shouldSaveRef = useRef(true);
  useEffect(() => {
    saveRef.current = save;
  }, [save]);

  useEffect(() => {
    //save Set when unmounted
    return () => {
      if (shouldSaveRef.current) saveRef.current();
    };
  }, [shouldSaveRef]);
  return (
    <Fragment>
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
              shouldSaveRef.current = false;
              deleteSet({ id: item.id });
              sendSetDeleted(item.id);
            }}
          />
        }
        onChangeText={(text) => {
          setTitle(text);
        }}
        onEndEditing={save}
        onSubmitEditing={() => {
          save();
        }}
      />
      {title === "" && (
        <HelperText type="error" visible={title === ""}>
          Set title cannot be empty!
        </HelperText>
      )}
    </Fragment>
  );
}
