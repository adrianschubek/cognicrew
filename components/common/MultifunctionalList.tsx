import * as React from "react";
import { useState } from "react";
import { StyleSheet, View, ScrollView, Keyboard } from "react-native";
import { RadioButton, TextInput, useTheme } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { ManagementType, Mode } from "../../types/common";
import { useUpsertSet } from "../../utils/hooks";
import TextInputListItem from "./ListItems/TextInputListItem";
import { useProjectStore } from "../../stores/ProjectStore";
import { useRefetchIndexStore } from "../../stores/BackendCommunicationStore";

export default function MultifunctionalList(props: {
  dataSource;
  close;
  mode?: Mode;
  creationOption?: boolean;
  type?: ManagementType;
  sendSetId?: any;
  [name: string]: any;
}) {
  const theme = useTheme();
  const [creationQuery, setCreationQuery] = useState("");
  const [value, setValue] = useState("");
  const { isMutating, trigger: upsertSet } = useUpsertSet();
  const projectId = useProjectStore((state) => state.projectId);
  const incrementRefetchIndex = useRefetchIndexStore(
    (state) => state.incrementRefetchIndex,
  );
  const createSet = () => {
    upsertSet({
      //@ts-expect-error
      name: creationQuery,
      type: props.type,
      project_id: projectId,
    }).then(() => {
      incrementRefetchIndex();
    });
    setCreationQuery("");
  };
  return (
    <React.Fragment>
      <View style={styles.container}>
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
          {props.creationOption === true && (
            <TextInput
              label="create new Set"
              value={creationQuery}
              mode="flat"
              disabled={isMutating}
              style={{ backgroundColor: "" }}
              //left={<TextInput.Icon icon="plus" />}
              right={
                <TextInput.Icon
                  forceTextInputFocus={false}
                  icon="check"
                  disabled={isMutating}
                  onPress={() => {
                    createSet();
                    Keyboard.dismiss();
                    //console.log(props.dataSource);
                  }}
                />
              }
              onChangeText={(query) => setCreationQuery(query)}
              onSubmitEditing={() => {
                createSet();
              }}
            />
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
    </React.Fragment>
  );
}

const styles = StyleSheet.create({
  container: {
    width: responsiveWidth(70),
  },
});
