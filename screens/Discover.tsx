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

  const save = async (projectId, newProjectName) => {
    console.log("Test")
    const { error } = await supabase.rpc("copy_learning_project", {p_source_id: projectId, p_new_owner_id: user.id, p_new_project_name: newProjectName})
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
