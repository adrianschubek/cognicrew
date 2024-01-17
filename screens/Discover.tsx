import React, { useEffect, useState } from "react";
import { FlatList, SafeAreaView, View } from "react-native";
import { Divider, Text, useTheme } from "react-native-paper";
import { Button } from "react-native-paper";
import ProjectCard from "../components/learningProject/ProjectCard";
import { useAuth } from "../providers/AuthProvider";

import { useRecommendations } from "../utils/hooks";

export default function Discover() {
  const theme = useTheme();
  const { user } = useAuth();

  const [recommendations, setRecommendations] = useState(null);
  const { data, error, isLoading, mutate } = useRecommendations(user.id);

  useEffect(() => {
    if (!data || isLoading) return;
    setRecommendations(data);
  }, [data]);

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
      <Button
        mode="contained-tonal"
        icon="autorenew"
        onPress={() => {
          mutate();
        }}
      >
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
          return <ProjectCard item={item} />;
        }}
        ListHeaderComponent={renderHeader}
        ListFooterComponent={renderFooter}
      />
    </SafeAreaView>
  );
}
