import * as React from "react";
import { List, Divider } from "react-native-paper";
import {
  responsiveWidth,
} from "react-native-responsive-dimensions";
import AccordionListItems from "./AccordionListItems";
import { ManagementType, orderByPrinciple } from "../../types/common";
import { useProjectStore } from "../../stores/ProjectStore";
import { useSets } from "../../utils/hooks";
import { Fragment, useEffect, useState } from "react";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { supabase } from "../../supabase";
import { sortByOrder } from "../../utils/common";

export default function AccordionSection(props: {
  type: ManagementType;
  width?: number;
  orderSetsBy: orderByPrinciple;
  orderSetItemsBy: orderByPrinciple;
  sendNoSetAvailableToParent?: (boolean) => any;
  [name: string]: any;
}) {
  const projectId = useProjectStore((state) => state.projectId);
  const { data, isLoading, error, mutate } = useSets(props.type, projectId);
  const [sets, setSets] = useState([]);
  useEffect(() => {
    if (!data) return;
    setSets(data);
    props.sendNoSetAvailableToParent(data.length === 0);
  }, [data]);
  useEffect(() => {
    const realtimeSets = supabase
      .channel("sets_all")
      .on(
        "postgres_changes",
        { event: "*", schema: "public", table: "sets" },
        (payload) => {
          mutate();
        },
      )
      .subscribe();
  }, []);
  const orderedSets = sortByOrder(sets, props.orderSetsBy);

  if (error || !data) return <LoadingOverlay visible={isLoading} />;
  return (
    <List.Section style={{ width: props.width || responsiveWidth(100) }}>
      {orderedSets
        .filter((learningSet) => learningSet.type === props.type)
        .map((learningSet) => (
          <Fragment key={learningSet.id}>
            <List.Accordion
              testID="flashcard-sets-list-folder-button"
              title={learningSet.name}
              left={(props) => <List.Icon {...props} icon="folder" />}
            >
              <AccordionListItems
                setId={learningSet.id}
                type={props.type}
                orderSetItemsBy={props.orderSetItemsBy}
              />
            </List.Accordion>
            <Divider />
          </Fragment>
        ))}
    </List.Section>
  );
}
