import * as React from "react";
import { StyleSheet, View } from "react-native";
import { Text, List, Divider } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import AccoridionListItems from "./AccordionListItems";

const accordionSectionItems = [
  { title: "Set A", id: 1 },
  { title: "Set B", id: 2 },
  { title: "Set C", id: 3 },
  { title: "Set D", id: 4 },
  { title: "Set E", id: 5 },
  { title: "Set F", id: 6 },
  { title: "Set G", id: 7 },
  { title: "Set H", id: 8 },
  { title: "Set I", id: 9 },
  { title: "Set J", id: 11 },
  { title: "Set K", id: 12 },
  { title: "Set L", id: 13 },
  { title: "Set M", id: 14 },
  { title: "Set N", id: 15 },
];
export default function AccoridionSection() {
  return (
    <List.Section style={styles.accordionStyle}>
      {accordionSectionItems.map((learningSet) => (
        <>
          <List.Accordion
            key={learningSet.id}
            title={learningSet.title}
            left={(props) => <List.Icon {...props} icon="folder" />}
          >
            <AccoridionListItems />
          </List.Accordion>
          <Divider/>
        </>
      ))}
    </List.Section>
  );
}

const styles = StyleSheet.create({
  accordionStyle: {
    width: responsiveWidth(100),
  },
});
