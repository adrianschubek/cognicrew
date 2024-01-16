import React, { useEffect, useState } from "react";
import { SafeAreaView, View, FlatList } from "react-native";
import { Divider, HelperText, Searchbar } from "react-native-paper";
import ProjectCard from "../components/learningProjects/ProjectCard";
import { usePublicProjects } from "../utils/hooks";
import { supabase } from "../supabase";

//TODO realtime updating

export default function SearchProjects() {
  const { data, error, isLoading, mutate } = usePublicProjects();
  const [projects, setProjects] = useState(null);
  const [searchQuery, setSearchQuery] = useState<string[]>([""]);
  const [searchQueryDisplay, setSearchQueryDisplay] = useState<string>("");
  useEffect(() => {
    if (!data) return;
    setProjects(data);
  }, [data]);

  useEffect(() => {
    const realtimeProjects = supabase
      .channel("projects_public")
      .on(
        "postgres_changes",
        {
          event: "*",
          schema: "public",
          table: "learning_projects",
          filter: "is_published=eq.true",
        },
        (payload) => {
          mutate();
        },
      )
      .subscribe();
  }, []);

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
  if (!projects) return null;
  return (
    <SafeAreaView style={{ flex: 1, marginTop: 15 }}>
      {renderHeader()}
      <FlatList
        data={projects.filter((project) =>
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
          return <ProjectCard item={item} />;
        }}
      />
    </SafeAreaView>
  );
}
