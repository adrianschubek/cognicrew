import {
  useQuery,
  useUpsertMutation,
} from "@supabase-cache-helpers/postgrest-swr";
import React, { useState } from "react";
import { SafeAreaView, View, FlatList } from "react-native";
import { Divider, HelperText, Searchbar } from "react-native-paper";
import { supabase } from "../supabase";
import { ManagementType } from "../types/common";
import { useAlerts } from "react-native-paper-fastalerts";
import ProjectCard from "../components/learningProjects/ProjectCard";
import { useAuth } from "../providers/AuthProvider";

//TODO realtime updating

//Show projects
export default function SearchProjects() {
  const [searchQuery, setSearchQuery] = useState<string[]>([""]);
  const [searchQueryDisplay, setSearchQueryDisplay] = useState<string>("");

  const { success, error: errorAlert } = useAlerts();

  const { data } = useQuery(supabase.rpc("get_public_projects"), {
    onSuccess(data) {
      //console.log("Data fetched successfully:", data.data);
    },
    onError(err) {
      errorAlert({
        message: err.message,
      });
    },
  });

  //Cloning

  const { user } = useAuth();

  const save = async (projectId, newProjectName) => {
    const { error } = await supabase.rpc("copy_learning_project", {p_source_id: projectId, p_new_owner_id: user.id, p_new_project_name: newProjectName})
  };

  if (!data) return null;
  const renderHeader = () => {
    const onChangeSearch = (query) => {
      const tokens = query.split(",");
      setSearchQueryDisplay(query);
      setSearchQuery(tokens);
    };
    return (
      <>
        <View>
          <Searchbar
            style={{
              marginHorizontal: 10,
              marginTop: 10,
              marginBottom: 5,
              elevation: 0,
              borderRadius: 10,
            }}
            placeholder="Search"
            onChangeText={(text) => {
              onChangeSearch(text);
            }}
            value={searchQueryDisplay}
          />
          <HelperText type="info" style={{ marginHorizontal: 10 }}>
            Search for title and tags separated by commas in all learning
            projects
          </HelperText>
        </View>
        <Divider style={{ marginBottom: 10, marginTop: 10 }} />
      </>
    );
  };

  return (
    <SafeAreaView style={{ flex: 1, marginTop: 15 }}>
      {renderHeader()}
      <FlatList
        /* windowSize={9}
        maxToRenderPerBatch={5}
        removeClippedSubviews={true} //can cause issues with component state as this unmounts components*/
        //these are the props that can be used to improve performance
        data={data.filter((project) =>
          searchQuery.some(
            (query) =>
              project.project_name
                .toLowerCase()
                .includes(query.toLowerCase()) ||
              project.project_tags
                .split(",")
                .map((tag) => tag.trim())
                .some((tag) =>
                  tag.toLowerCase().includes(query.toLowerCase()),
                ) ||
              project.project_description
                .toLowerCase()
                .includes(query.toLowerCase()),
          ),
        )}
        renderItem={({ item }) => {
          return <ProjectCard item={item} save={save} />;
        }}
      />
    </SafeAreaView>
  );
}
