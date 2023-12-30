import * as React from "react";
import { Fragment, useEffect, useRef, useState } from "react";
import { View, ScrollView, Keyboard } from "react-native";
import {
  HelperText,
  RadioButton,
  TextInput,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import { ManagementType, Mode } from "../../types/common";
import { useUpsertSet } from "../../utils/hooks";
import TextInputListItem from "./ListItems/TextInputListItem";
import { useProjectStore } from "../../stores/ProjectStore";
import { useRefetchIndexStore } from "../../stores/BackendCommunicationStore";

export default function MultifunctionalList(props: {
  dataSource: any[];
  mode?: Mode;
  creationOption?: boolean;
  creationOptionFocused?: (e: boolean) => any;
  type?: ManagementType;
  sendSetId?: any;
  noSetAvailable: boolean;
  [name: string]: any;
}) {
  const [creationQuery, setCreationQuery] = useState("");
  const [creationError, setCreationError] = useState<string>("");
  const [value, setValue] = useState("");
  const { isMutating, trigger: upsertSet } = useUpsertSet();
  const projectId = useProjectStore((state) => state.projectId);
  const incrementRefetchIndex = useRefetchIndexStore(
    (state) => state.incrementRefetchIndex,
  );
  const createSet = () => {
    if (creationQuery === "") {
      setCreationError("Please enter a name for the set.");
      return;
    }
    upsertSet({
      //@ts-expect-error
      name: creationQuery,
      type: props.type,
      project_id: projectId,
    }).then(() => {
      incrementRefetchIndex();
    });
    setCreationQuery("");
    setCreationError("");
  };
  const createSetRef = useRef(createSet);
  createSetRef.current = createSet;
  useEffect(() => {
    //create Set when unmounted
    return () => {
      createSetRef.current();
    };
  }, []);
  return (
    <Fragment>
      <View style={{ width: responsiveWidth(70) }}>
        <ScrollView
          style={{
            maxHeight:
              props.mode === "edit"
                ? responsiveHeight(50)
                : responsiveHeight(25),
          }}
          keyboardShouldPersistTaps="handled"
        >
          {/* Option ein neues Set zu erstellen */}
          {(props.creationOption || props.noSetAvailable) && (
            <TextInput
              testID="input-create-new-set"
              label="create new Set"
              value={creationQuery}
              mode="flat"
              disabled={isMutating}
              style={{ backgroundColor: "" }}
              //left={<TextInput.Icon icon="plus" />}
              right={
                <TextInput.Icon
                  testID="button-create-new-set"
                  forceTextInputFocus={false}
                  icon="check"
                  disabled={isMutating}
                  onPress={() => {
                    createSet();
                    Keyboard.dismiss();
                  }}
                />
              }
              onChangeText={(query) => setCreationQuery(query)}
              onSubmitEditing={() => {
                createSet();
              }}
              onBlur={
                props.creationOptionFocused
                  ? () => props.creationOptionFocused(false)
                  : null
              }
              onFocus={
                props.creationOptionFocused
                  ? () => props.creationOptionFocused(true)
                  : null
              }
            />
          )}
          {creationError && (
            <HelperText type="error">{creationError}</HelperText>
          )}
          {props.noSetAvailable && (
            <HelperText type="error">
              You have currently no sets. Feel free to create your first one!
            </HelperText>
          )}
          {props.mode == "edit" ? (
            props.dataSource.map((item) => (
              <TextInputListItem item={item} key={item.id} />
            ))
          ) : (
            <RadioButton.Group
              onValueChange={(value) => {
                setValue(value);
                props.sendSetId(value);
              }}
              value={value}
            >
              {props.dataSource.map((item) => (
                <RadioButton.Item
                  key={item.id}
                  label={item.name}
                  value={item.id}
                />
              ))}
            </RadioButton.Group>
          )}
        </ScrollView>
      </View>
    </Fragment>
  );
}
