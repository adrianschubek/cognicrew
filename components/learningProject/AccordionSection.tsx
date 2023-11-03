import * as React from "react";
import { StyleSheet, View } from "react-native";
import { Text, List, Divider } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import AccordionListItems from "./AccordionListItems";
import { ManagementType } from "../../types";

export const accordionSectionItems = [
  { title: "Set A", id: 1, type: "flashcard" },
  { title: "Set B", id: 2, type: "flashcard" },
  { title: "Set C", id: 3, type: "flashcard" },
  { title: "Set D", id: 4, type: "flashcard" },
  { title: "Set E", id: 5, type: "flashcard" },
  { title: "Set F", id: 6, type: "flashcard" },
  { title: "Set G", id: 7, type: "flashcard" },
  { title: "Set H", id: 8, type: "flashcard" },
  { title: "Set I", id: 9, type: "flashcard" },
  { title: "Set J", id: 11, type: "flashcard" },
  { title: "Set K", id: 12, type: "flashcard" },
  { title: "Set L", id: 13, type: "flashcard" },
  { title: "Set M", id: 14, type: "exercise" },
  { title: "Set N", id: 15, type: "exercise" },
];
const flashcards = [
  {
    question:
      "What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? What does Sigmund Freud base his main theory on? ",
    answer: "on case studies of his own patients and those of his colleagues",
    id: 1,
  },
  {
    question: "Why can't I find love and why doesn't my family love me?",
    answer: "because I am clearly unloveable",
    id: 2,
  },
  {
    question: "Why do we live?",
    answer: "we live ultimately to survive and pass on our genes",
    id: 3,
  },
  {
    question: "How can i convince my gf to buy me a Porsche?",
    answer:
      "use of questionable, agressive and emotionaly manipulative tactics",
    id: 4,
  },
];
const exercises = [
  {
    question: "What does Sigmund Freud base his main theory on?",
    answer1: "on case studies of his own patients and those of his colleagues",
    answer2: "wrong answer",
    answer3: "wrong answer",
    answer4: "wrong answer",
    id: 1,
  },
  {
    question: "Why can't I find love and why doesn't my family love me?",
    answer1: "because I am clearly unloveable",
    answer2: "wrong answer",
    answer3: "wrong answer",
    answer4: "wrong answer",
    id: 2,
  },
  {
    question: "Why do we live?",
    answer1: "we live ultimately to survive and pass on our genes",
    answer2: "wrong answer",
    answer3: "wrong answer",
    answer4: "wrong answer",
    id: 3,
  },
  {
    question: "How can i convince my gf to buy me a Porsche?",
    answer1:
      "use of questionable, agressive and emotionaly manipulative tactics",
    answer2: "wrong answer",
    answer3: "wrong answer",
    answer4: "wrong answer",
    id: 4,
  },
];
export default function AccordionSection(props: {
  type: ManagementType
  width?: number;
  [name: string]: any;
}) {
  return (
    <List.Section style={{ width: props.width || responsiveWidth(100) }}>
      {accordionSectionItems
        .filter((learningSet) => learningSet.type === props.type)
        .map((learningSet) => (
          <React.Fragment key={learningSet.id}>
            <List.Accordion
              title={learningSet.title}
              left={(props) => <List.Icon {...props} icon="folder" />}
            >
              <AccordionListItems
                accordionListItems={learningSet.type === "flashcard" ? flashcards : exercises}
                type={props.type}
              />
            </List.Accordion>
            <Divider />
          </React.Fragment>
        ))}
    </List.Section>
  );
}
const styles = StyleSheet.create({});
