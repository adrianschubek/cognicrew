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

export default function AccordionSection(props: {
  type: ManagementType;
  width?: number;
  [name: string]: any;
}) {
  const projectId = useProjectStore((state) => state.projectId);
  const { data, isLoading, error } = useSets(props.type, projectId);
  useEffect(() => {
    //doesn't update if new sets are added to the project, useEffect counterproductive? How to fix? through a listener?
    if (!data) return;
    setSets(data);
  }, [data]);
  const [sets, setSets] = useState([]);

  if (error) return <LoadingOverlay visible={isLoading} />;
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
