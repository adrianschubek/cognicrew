import * as React from "react";
import { useState } from "react";
import { StyleSheet, View, ScrollView, Keyboard } from "react-native";
import {
  Button,
  Card,
  Icon,
  RadioButton,
  Searchbar,
  Text,
  TextInput,
  TouchableRipple,
  useTheme,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import { SearchBar } from "react-native-screens";
import { ManagementType, Mode } from "../../types/common";
import { supabase } from "../../supabase";
import { useQuery } from "@supabase-cache-helpers/postgrest-swr";
import { useAlerts } from "../../utils/hooks";

export default function MultifunctionalList(props: {
  dataSource;
  close;
  mode?: Mode;
  creationOption?: boolean;
  type?: ManagementType;
  [name: string]: any;
}) {
  const theme = useTheme();
  const { error: errorAlert } = useAlerts();
  const [creationQuery, setCreationQuery] = useState("");
  const [value, setValue] = useState("");
  const Item = { title: "Set A", id: 1, type: props.type };
  return (
    <React.Fragment>
      <View style={styles.container}>
        <ScrollView
          style={{
            maxHeight:
              props.mode === "edit"
                ? responsiveHeight(50)
                : responsiveHeight(25),
            marginBottom: responsiveHeight(1),
          }}
          keyboardShouldPersistTaps="handled"
        >
          {/* Option ein neues Set zu erstellen */}
          {props.creationOption === true && (
            <TextInput
              label="create new Set"
              value={creationQuery}
              mode="flat"
              style={{ backgroundColor: "" }}
              //left={<TextInput.Icon icon="plus" />}
              right={
                <TextInput.Icon
                  forceTextInputFocus={false}
                  icon="check"
                  onPress={() => {
                    Keyboard.dismiss();
                    // gleiche Funktion wie bei onSubmitEditing
                  }}
                />
              }
              onChangeText={(query) => setCreationQuery(query)}
              onSubmitEditing={() => {
                /*set mit namen creationquery und mit props.type muss erstellt werden  */
              }}
            />
          )}
          {props.mode == "edit" ? (
            props.dataSource.map((item) => (
              <TextInput
                key={item.id}
                value={item.name}
                mode="flat"
                style={{ backgroundColor: "" }}
                right={
                  <TextInput.Icon
                    forceTextInputFocus={false}
                    icon="close"
                    onPress={() => {
                      // delete set
                    }}
                  />
                }
                onChangeText={
                  () => {} /*just update set directly on change? "Will dataSource and with that text within TextInput also be updated? It should be, right?*/
                }
                onSubmitEditing={() => {
                  Keyboard.dismiss();
                  /*update set  */
                }}
              />
            ))
          ) : (
            <RadioButton.Group
              onValueChange={(value) => {
                setValue(value);
              }}
              value={value}
            >
              {props.dataSource.map((item) => (
                <RadioButton.Item key={item.id} label={item.title} value={item.id} />
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
