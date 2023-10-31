import * as React from "react";
import { StyleSheet, View } from "react-native";
import { Text, List } from "react-native-paper";
const accordionListItems = [
  { title: "What does Sigmund Freud base his main theory on?", id: 1 },
  { title: "Why can't find love and why doesn't my family love me?", id: 2 },
  { title: "Why do we live?", id: 3 },
  { title: "How can i convince my gf to buy me a Porsche?", id: 4 },
];

export default function AccoridionListItems() {
  return accordionListItems.map((listItem) => (
    <List.Item title={listItem.title} key={listItem.id} />
  ));
}
