import * as React from "react";
import { StyleSheet, View, ScrollView } from "react-native";
import { Text, List, Divider, Card } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";

export const accordionSectionItems = [
  { title: "Psychology", id: 1 },
  { title: "Robotics", id: 2 },
  { title: "Mathematics", id: 3 },
  { title: "Sports", id: 4 },
  { title: "French", id: 5 },
];

export default function AccordionSection(props) {
  const [expanded, setExpanded] = React.useState(true);
  const [getLearningProject, setLearningProject] = React.useState(
    "Search project for room creation",
  );

  return (
    <List.Section>
      <ScrollView>
        <List.Accordion
          title={getLearningProject}
          style={styles.accordion}
          titleStyle={styles.accordionTitle}
          left={(props) => <List.Icon {...props} icon="folder" />}
        >
          {accordionSectionItems.map((learningProject) => (
            <React.Fragment key={learningProject.id}>
              <List.Item
                title={learningProject.title}
                onPress={() => {
                  setLearningProject(learningProject.title);
                }}
                titleStyle={styles.listTitle}
              />
            </React.Fragment>
          ))}
        </List.Accordion>
      </ScrollView>
    </List.Section>
  );
}
const styles = StyleSheet.create({
  accordionTitle: {
    fontSize: responsiveFontSize(2),
  },
  listTitle: {},
  accordion: {},
});
