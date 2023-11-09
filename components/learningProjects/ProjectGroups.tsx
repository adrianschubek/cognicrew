import React, { useEffect, useState } from "react";
import { ScrollView, StyleSheet, TouchableOpacity, View } from "react-native";
import { Avatar, Card, useTheme, Text } from "react-native-paper";
import { useQuery } from "@supabase-cache-helpers/postgrest-swr";
import { supabase } from "../../supabase";
import { useAlerts } from "../../utils/hooks";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { responsiveFontSize } from "react-native-responsive-dimensions";
import { getRandomColor } from "../../utils/common";
import { useNavigation } from "@react-navigation/native";
import { NAVIGATION } from "../../types/common";

export default function ProjectGroups() {
  const theme = useTheme();
  const { error: errorAlert } = useAlerts();
  const navigation = useNavigation();

  const [projectGroups, setProjectGroups] = useState(
    {} as { [semester: string]: typeof data },
  );
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
            {projectGroups[semester].map((project) => (
              <View style={styles.projectElement} key={project.id}>
                <TouchableOpacity
                  onPress={() => {
                    // @ts-expect-error idk why
                    navigation.navigate(NAVIGATION.LEARNING_PROJECT);
                  }}
                  onLongPress={() => {
                    // @ts-expect-error
                    navigation.navigate(NAVIGATION.CREATEEDIT_PROJECT, {
                      edit: project,
                    });
                  }}
                >
                  <>
                    <Avatar.Text
                      style={styles.avatar}
                      size={responsiveFontSize(10)}
                      label={project.name.substring(0, 2)}
                      theme={{ colors: { primary: getRandomColor() } }}
                    />
                    <Text style={styles.textStyle}>
                      {project.name.length > 25
                        ? project.name.substring(0, 25) + "..."
                        : project.name.substring(0, 25)}
                    </Text>
                  </>
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
  textStyle: {
    fontWeight: "bold",
    textAlign: "center",
  },
  avatar: {
    alignSelf: "center",
  },
});
