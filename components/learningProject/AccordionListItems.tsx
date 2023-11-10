import { max } from "cypress/types/lodash";
import * as React from "react";
import { StyleSheet, View } from "react-native";
import {
  Text,
  List,
  Divider,
  useTheme,
  Card,
  TextInput,
} from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import EditFlashcard from "./EditFlashcard";
import EditExercise from "./EditExercise";
import { ManagementType } from "../../types/common";

export default function AccordionListItems({accordionListItems, type}:{type: ManagementType, [name: string]: any} ) {
  const theme = useTheme();
  return accordionListItems.map((listItem) => (
    <View key={listItem.id}>
      <List.Accordion
        title={listItem.question}
        titleNumberOfLines={4}
        style={{
          width: responsiveWidth(100),
          backgroundColor: theme.colors.secondaryContainer,
        }}
      >
        {
          type === ManagementType.FLASHCARD && <EditFlashcard listItem={listItem}/> //if type === flashcard then render <EditFlashcard/> component 
        }
        {
          type === ManagementType.EXERCISE && <EditExercise listItem={listItem}/> //if type === exercise then render <EditExercise/> component 
        }
      </List.Accordion>
      <Divider />
      </View>
  ));
}

const styles = StyleSheet.create({
  cardStyle: {
    width: responsiveWidth(100) - responsiveHeight(2),
    marginTop: responsiveHeight(1),
    marginBottom: responsiveHeight(1),
    alignSelf: "center",
  },
  cardContentStyle: {},
  textInputStyle: {},
});
