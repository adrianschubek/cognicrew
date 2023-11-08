import React, { useCallback, useEffect, useState } from "react";
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

  const sortBySemester = useCallback(
    (season1: (typeof data)[number], season2: (typeof data)[number]) => {
      const [seasion1, year1] = season1.group.split(" ");
      const [seasion2, year2] = season2.group.split(" ");

      // make sure "All" stays at the top
      if (seasion1 === "All") return -1;
      if (seasion2 === "All") return 1;


      if (seasion1 === seasion2) return year1 - year2;
    },
    [],
  );

  useEffect(() => {
    if (!data) return;

    const groups = data.sort(sortBySemester).reduce((acc, project) => {
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
          <Card.Title title="Hide"></Card.Title>
          <Card.Content style={styles.projectGroupContent}>
            {projectGroups[semester].map((project) => (
              <View style={styles.projectElement} key={project.id}>
                <TouchableOpacity
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
                  <>
                    <Avatar.Text
                      style={styles.avatar}
                      size={responsiveFontSize(10)}
                      label={project.name.substring(0, 2)}
                      theme={{ colors: { primary: getRandomColor() } }}
                    />
                    <Text style={styles.textStyle}>
                      {project.name.length > 32
                        ? project.name.substring(0, 32) + "..."
                        : project.name.substring(0, 32)}
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
    textAlign: "center",
    marginTop: 5,
  },
  avatar: {
    alignSelf: "center",
  },
});
