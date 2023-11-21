import * as React from "react";
import { useState } from "react";
import { StyleSheet, ScrollView } from "react-native";
import { List } from "react-native-paper";
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
  const [expanded, setExpanded] = useState(true);
  const [getLearningProject, setLearningProject] = useState(
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
