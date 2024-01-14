import { useUpsertMutation } from "@supabase-cache-helpers/postgrest-swr";
import React, { useEffect, useState } from "react";
import { FlatList, SafeAreaView, View } from "react-native";
import { Divider, Text, useTheme } from "react-native-paper";
import { Button } from "react-native-paper";
import { supabase } from "../supabase";
import { ManagementType } from "../types/common";
import { useAlerts } from "react-native-paper-fastalerts";
import ProjectCard from "../components/learningProjects/ProjectCard";
import { useAuth } from "../providers/AuthProvider";

import { useRecommendations } from "../utils/hooks";

export default function Discover() {
  const theme = useTheme();
  const { user } = useAuth();

  //Recommendation system

  const [recommendations, setRecommendations] = useState(null);

  const { data, error, isLoading, mutate } = useRecommendations(user.id);

  useEffect(() => {
    if (!data || isLoading) return;
    setRecommendations(data);
  }, [data]);

  useEffect(() => {
    mutate();
  }, []);

  //Cloning

  const fetchFiles = async (filePath: string, limit?: number) => {
    try {
      const { data, error } = await supabase.storage
        .from("files")
        .list(filePath, {
          limit: limit || 100,
          offset: 0,
        });

      if (error) {
        console.error("Error fetching files:", error.message);
        return null; // Return null or handle the error as needed
      }

      return data; // Return the list of files
    } catch (error) {
      console.error("Error in fetchFiles:", error.message);
      return null; // Return null or handle the error as needed
    }
  };

  const { success, error: errorAlert } = useAlerts();

  const save = async (projectId, newProjectName) => {
    console.log("Test");
    const { data: upsertedProjectId, error } = await supabase.rpc("copy_learning_project", {
      p_source_id: projectId,
      p_new_owner_id: user.id,
      p_new_project_name: newProjectName,
    });

    console.log(upsertedProjectId);

    const fileTypes = ["pdf", "photos", "docx", "excel", "miscellaneous"];

    try {
      for (const fileType of fileTypes) {
        const files = await fetchFiles(`${projectId}/${fileType}`);

        // Use the copy method to clone files to the destination folder
        files.map(async (file) => {
          await supabase.storage
            .from("files")
            .copy(
              `${projectId}/${fileType}/${file.name}`,
              `${upsertedProjectId}/${fileType}/${file.name}`,
            );
        });
      }
    } catch (error) {
      console.error("Error copying files: ", error.message);
      throw error;
    }
};

  //Render footer and header of the projects FlatList

  function reScramble() {
    mutate();
  }

  const renderHeader = () => {
    return (
      <View>
        <Text
          variant="headlineSmall"
          style={{
            marginLeft: 10,
            margin: 10,
            color: theme.colors.primary,
          }}
        >
          Recommendations
        </Text>
      </View>
    );
  };

  const renderFooter = () => (
    <View style={{ flexDirection: "row", marginBottom: 10 }}>
      <Divider />
      <Button mode="contained-tonal" icon="autorenew" onPress={reScramble}>
        <Text variant="titleMedium">Re-scramble</Text>
      </Button>
    </View>
  );

  if (!data) return null;

  return (
    <SafeAreaView>
      <FlatList
        data={recommendations}
        renderItem={({ item }) => {
          return <ProjectCard item={item} save={save} />;
        }}
        ListHeaderComponent={renderHeader}
        ListFooterComponent={renderFooter}
      />
    </SafeAreaView>
  );
}
