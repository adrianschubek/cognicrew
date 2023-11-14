import * as React from "react";
import { StyleSheet, View } from "react-native";
import { Text, List, Divider } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import AccordionListItems from "./AccordionListItems";
import { ManagementType } from "../../types/common";
import { useProjectStore } from "../../stores/ProjectStore";
import { useSets } from "../../utils/hooks";
import { useEffect, useState } from "react";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { useRefetchIndexStore } from "../../stores/BackendCommunicationStore";
import { use } from "chai";

export const accordionSectionItems = [
  { title: "Set A", id: 1, type: 0 },
  { title: "Set B", id: 2, type: 0 },
  { title: "Set C", id: 3, type: 0 },
  { title: "Set D", id: 4, type: 0 },
  { title: "Set E", id: 5, type: 0 },
  { title: "Set F", id: 6, type: 0 },
  { title: "Set G", id: 7, type: 0 },
  { title: "Set H", id: 8, type: 0 },
  { title: "Set I", id: 9, type: 0 },
  { title: "Set J", id: 11, type: 0 },
  { title: "Set K", id: 12, type: 0 },
  { title: "Set L", id: 13, type: 0 },
  { title: "Set M", id: 14, type: 1 },
  { title: "Set N", id: 15, type: 1 },
];
export default function AccordionSection(props: {
  type: ManagementType;
  width?: number;
  [name: string]: any;
}) {
  const refetchIndex = useRefetchIndexStore((state) => state.refetchIndex);
  const projectId = useProjectStore((state) => state.projectId);
  const { data, isLoading, error } = useSets(props.type, projectId, /*refetchIndex */);
  const [sets, setSets] = useState([]);
  useEffect(() => {
    if (!data) return;
    setSets(data);
  }, [data]);


  // Call this function to refetch the data

  if (error || !data) return <LoadingOverlay visible={isLoading} />;
  return (
    <List.Section style={{ width: props.width || responsiveWidth(100) }}>
      {sets
        .filter((learningSet) => learningSet.type === props.type)
        .map((learningSet) => (
          <React.Fragment key={learningSet.id}>
            <List.Accordion
              title={learningSet.name}
              left={(props) => <List.Icon {...props} icon="folder" />}
            >
              <AccordionListItems setId={learningSet.id} type={props.type} />
            </List.Accordion>
            <Divider />
          </React.Fragment>
        ))}
    </List.Section>
  );
}
const styles = StyleSheet.create({});
