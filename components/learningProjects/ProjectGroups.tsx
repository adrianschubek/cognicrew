import React, { useEffect, useState } from "react";
import { ScrollView, StyleSheet, TouchableOpacity, View } from "react-native";
import { Card, useTheme } from "react-native-paper";
import { useQuery } from "@supabase-cache-helpers/postgrest-swr";
import { supabase } from "../../supabase";
import { useAlerts } from "react-native-paper-fastalerts";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { useNavigation } from "@react-navigation/native";
import { NAVIGATION } from "../../types/common";
import LearningProjectAvatarWithTitle from "../learningProject/LearningProjectAvatarWithTitle";

export default function ProjectGroups() {
  const theme = useTheme();
  const { error: errorAlert } = useAlerts();
  const navigation = useNavigation();

  const [projectGroups, setProjectGroups] = useState(
    {} as { [semester: string]: typeof data },
  );
  const { data, isLoading, error, mutate } = useQuery(
    supabase
      .from("learning_projects")
      .select(
        "id,name,description,is_published,created_at,tags,group,owner_id",
      ),
    {
      onSuccess(data, key, config) {
        // errorAlert(JSON.stringify(data));
      },
      onError(err, key, config) {
        errorAlert({
          message: err.message,
        });
      },
    },
  );
  // const [data, setData] = useState(null);

  useEffect(() => {
    const realtimeProjects = supabase
      .channel("projects_all")
      .on(
        "postgres_changes",
        { event: "*", schema: "public", table: "user_learning_projects" },
        (payload) => {
          mutate(); // escalation
        },
      )
      .on(
        "postgres_changes",
        { event: "*", schema: "public", table: "learning_projects" },
        (payload) => {
          // trigger refetch useQuery
          mutate();
        },
      )
      .subscribe();
  }, []);

  // latest to oldest algorithm: "Winter 2023/24" > "Summer 2023" => +1
  useEffect(() => {
    if (!data) return;

    const groups = data
      .sort((a: (typeof data)[number], b: (typeof data)[number]) => {
        // Sort by year
        if (a.group === "All") return -1;
        const first = parseInt(a.group.split(" ")[1]?.split("/")[0]);
        const second = parseInt(b.group.split(" ")[1]?.split("/")[0]);
        return first > second ? -1 : 1;
      })
      .sort((a: (typeof data)[number], b: (typeof data)[number]) => {
        // Sort by semester (Winter > Summer)

        const firstYear = parseInt(a.group.split(" ")[1]?.split("/")[0]);
        const secondYear = parseInt(b.group.split(" ")[1]?.split("/")[0]);
        // Only sort if same year.
        if (firstYear !== secondYear) return 0;

        // All is always first
        if (a.group === "All") return -1;
        const first = a.group.split(" ")[0];
        const second = b.group.split(" ")[0];
        return first === "Winter" && second === "Summer" ? -1 : 1;
      })
      .reduce((acc, project) => {
        if (!acc[project.group]) acc[project.group] = [];
        acc[project.group].push(project);
        return acc;
      }, {});

    setProjectGroups(groups);
  }, [data]);

  if (!data) return <LoadingOverlay visible={true} />;

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
          <Card.Title titleStyle={{ opacity: 0.7 }} title={semester} />
          {/* TODO: filter projects. hide  mit paper Menu */}
          {/* <Card.Title title="Hide"></Card.Title>  */}
          <Card.Content style={styles.projectGroupContent}>
            {projectGroups[semester]
              .sort((a, b) => a.name.localeCompare(b.name))
              .map((project) => (
                <View style={styles.projectElement} key={project.id}>
                  <TouchableOpacity
                    testID="select-project-button"
                    onPress={() => {
                      // @ts-expect-error idk why
                      navigation.navigate(NAVIGATION.LEARNING_PROJECT, {
                        project,
                      });
                    }}
                    onLongPress={() => {
                      // @ts-expect-error
                      navigation.navigate(NAVIGATION.CREATEEDIT_PROJECT, {
                        edit: project,
                      });
                    }}
                  >
                    <LearningProjectAvatarWithTitle
                      projectName={project.name /*+ "+#+#+#+#+#+#+#+#"*/}
                      numberOfLines={2}
                      titleMarginHorizontal={5}
                    />
                  </TouchableOpacity>
                </View>
              ))}
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
  projectElement: {
    width: "33%",
    paddingBottom: 10,
  },
});
