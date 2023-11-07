import React, { useEffect, useState } from "react";
import { ScrollView, StyleSheet, View } from "react-native";
import { Button, Card, IconButton, Text, useTheme } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
  responsiveFontSize,
} from "react-native-responsive-dimensions";
import ProjectElements from "./ProjectElements";
import { useQuery } from "@supabase-cache-helpers/postgrest-swr";
import { supabase } from "../../supabase";
import { useAlerts } from "../../utils/hooks";
import LoadingOverlay from "../alerts/LoadingOverlay";

export default function ProjectGroups() {
  const theme = useTheme();
  const { error: errorAlert } = useAlerts();

  const [projectGroups, setProjectGroups] = useState({});
  const { data, isLoading, error } = useQuery(
    supabase
      .from("learning_projects")
      .select("id,name,description,is_published,created_at,tags,group"),
    {
      onSuccess(data, key, config) {
        // errorAlert(JSON.stringify(data));
      },
      onError(err, key, config) {
        errorAlert(err.message);
      },
    },
  );

  useEffect(() => {
    if (!data) return;

    const groups = data.reduce((acc, project) => {
      if (!acc[project.group]) acc[project.group] = [];
      acc[project.group].push(project);
      return acc;
    }, {});

    setProjectGroups(groups);
  }, [data]);

  if (isLoading || error) return <LoadingOverlay visible={true} />;

  return (
    <ScrollView
      style={{ paddingHorizontal: 10, paddingVertical: 10, marginBottom: 0 }}
    >
      {Object.keys(projectGroups).map((semester) => (
        <Card
          mode="contained"
          style={{
            marginVertical: 5,
            backgroundColor: theme.colors.secondaryContainer,
          }}
          key={semester}
        >
          <Card.Title title={semester} />
          <Card.Content style={styles.projectGroupContent}>
            <ProjectElements projects={projectGroups[semester]} />
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
