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
import { ManagementType } from "../../types/common";

export default function RadioButtonList(props: {
  dataSource;
  close;
  creationOption?: boolean;
  type?: ManagementType;
  [name: string]: any;
}) {
  const theme = useTheme();
  const [creationQuery, setCreationQuery] = useState("");
  const [value, setValue] = useState("");
  return (
    <React.Fragment>
      <View style={styles.container}>
        <ScrollView
          style={{
            maxHeight: responsiveHeight(25),
            marginBottom: responsiveHeight(1),
          }}
          keyboardShouldPersistTaps="handled"
        >
         {/*Als mögliche Option im Code lassen? Option bei der Set Auswahl ein neues Set zu erstellen */}
          {props.creationOption === true && (
            <TextInput
              label="create new Set"
              value={creationQuery}
              mode="flat"
              style={{ backgroundColor: "" }}
              //left={<TextInput.Icon icon="plus" />}
              right={<TextInput.Icon icon="check" onPress={() => {
                // gleiche Funktion wie bei onSubmitEditing
              }} />}
              onChangeText={(query) => setCreationQuery(query)}
              onSubmitEditing={() => {
                /*set mit namen creationquery und mit props.type muss erstellt werden  */
              }}
            />
          )}
          <RadioButton.Group
            onValueChange={(value) => {
              setValue(value);
            }}
            value={value}
          >
            {props.dataSource.map((item) => (
              <RadioButton.Item label={item.title} value={item.title} />
            ))}
          </RadioButton.Group>
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
