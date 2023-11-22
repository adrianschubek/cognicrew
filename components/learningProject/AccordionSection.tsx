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
import { Fragment, useEffect, useState } from "react";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { useRefetchIndexStore } from "../../stores/BackendCommunicationStore";
import { supabase } from "../../supabase";

export default function AccordionSection(props: {
  type: ManagementType;
  width?: number;
  orderSetsBy?: string;
  [name: string]: any;
}) {
  const projectId = useProjectStore((state) => state.projectId);
  const { data, isLoading, error, mutate } = useSets(props.type, projectId);
  const [sets, setSets] = useState([]);
  useEffect(() => {
    if (!data) return;
    setSets(data);
  }, [data]);
  useEffect(() => {
    const realtimeSets = supabase
      .channel("sets_all")
      .on(
        "postgres_changes",
        { event: "*", schema: "public", table: "sets" },
        (payload) => {
          console.log("Change received!", payload);
          mutate();
        },
      )
      .subscribe();
  }, []);

  const orderedSets = sets.sort((a, b) => {
    let isReverse = props.orderSetsBy.substring(0, 8) === "reverse_";
    let orderPrinciple = isReverse
      ? props.orderSetsBy.substring(8, props.orderSetsBy.length)
      : props.orderSetsBy;
    return a[orderPrinciple] < b[orderPrinciple]
      ? isReverse
        ? 1
        : -1
      : a[orderPrinciple] > b[orderPrinciple]
      ? isReverse
        ? -1
        : 1
      : 0;
  });

  if (error || !data) return <LoadingOverlay visible={isLoading} />;
  return (
    <List.Section style={{ width: props.width || responsiveWidth(100) }}>
      {orderedSets
        .filter((learningSet) => learningSet.type === props.type)
        .map((learningSet) => (
          <Fragment key={learningSet.id}>
            <List.Accordion
              title={learningSet.name}
              left={(props) => <List.Icon {...props} icon="folder" />}
            >
              <AccordionListItems setId={learningSet.id} type={props.type} />
            </List.Accordion>
            <Divider />
          </Fragment>
        ))}
    </List.Section>
  );
}
const styles = StyleSheet.create({});
