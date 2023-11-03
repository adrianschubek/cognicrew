import * as React from "react";
import { StyleSheet, View, ScrollView } from "react-native";
import { Text, List, Divider } from "react-native-paper";
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
  const [getLearningProject, setLearningProject] = React.useState("Choose");

  return (
    <List.Section >
        <ScrollView>
                <List.Accordion
                    title={getLearningProject}
                    style={{}}
                    titleStyle={{fontSize: responsiveFontSize(1)}}
                    left={props => <List.Icon {...props} icon="folder" />}>
                    {accordionSectionItems.map((learningProject) => (
                    <React.Fragment key={learningProject.id}>
                    <List.Item title={learningProject.title}
                        onPress={ () => {
                            setLearningProject(learningProject.title);
                        }} />
                    </React.Fragment>
                    ))}
                </List.Accordion>
      </ScrollView>
    </List.Section>
  );
}

const styles = StyleSheet.create({
});
