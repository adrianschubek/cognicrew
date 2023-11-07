import React, { useState } from "react";
import { ScrollView, StyleSheet, View } from "react-native";
import { Button, Card, IconButton, Text, useTheme } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import ProjectElement from "./ProjectElements";
import { useQuery } from "@supabase-cache-helpers/postgrest-swr";
import { supabase } from "../../supabase";
import { useAlerts } from "../../utils/hooks";
import LoadingOverlay from "../alerts/LoadingOverlay";
const dummyProjects = [
  { name: "Psycholgy" },
  { name: "Biology" },
  { name: "Sex Education" },
  { name: "Kynology" },
  { name: "Spanish" },
];
const dummyProjectGroups = [
  { name: "WiSe21/22", id: 1 },
  { name: "SoSe22", id: 2 },
  { name: "WiSe22/23", id: 3 },
];
export default function ProjectGroups() {
  const theme = useTheme();
  const { error: errorAlert } = useAlerts();
  const {
    data: projects,
    isLoading,
    error,
  } = useQuery(supabase.from("learning_projects").select("id,name,group"), {
    onSuccess(data, key, config) {
      errorAlert(JSON.stringify(data));
    },
    onError(err, key, config) {
      errorAlert(err.message);
    },
  });

  if (isLoading || error) return <LoadingOverlay visible={true} />;

  return (
    <ScrollView style={{ paddingHorizontal: 10, paddingVertical: 10, marginBottom: 0 }}>
      {dummyProjectGroups.map((projectGroup) => (
        <Card
          mode="contained"
          style={{
            marginVertical: 5,
            backgroundColor: theme.colors.secondaryContainer,
          }}
          key={projectGroup.id}
        >
          <Card.Title title={projectGroup.name} />
          <Card.Content style={styles.projectGroupContent}>
            <ProjectElement />
          </Card.Content>
        </Card>
      ))}
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  projectGroupContent: {
    flexDirection: "row",
    flexWrap: "wrap",
    justifyContent: "flex-start",
  },
});
