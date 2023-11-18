import { useQuery } from "@supabase-cache-helpers/postgrest-swr";
import React, { useState } from "react";
import {
  SafeAreaView,
  StatusBar,
  View,
  StyleSheet,
  FlatList,
} from "react-native";
import { Text } from "react-native-paper";
import { supabase } from "../supabase";
import { styles } from "../components/learningRoom/DrawingStyle";

export default function Discover() {
  const { data } = useQuery(
    supabase
      .rpc("public_projects"),
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
    


  type ItemProps = { title: string };
  const Item = ({ title }: ItemProps) => (
    <View style={styles.item}>
      <Text style={styles.title}>{title}</Text>
    </View>
  );
  const styles = StyleSheet.create({
    container: {
      flex: 1,
      marginTop: StatusBar.currentHeight || 0,
    },
    item: {
      backgroundColor: "#C6D1DD",
      padding: 20,
      marginVertical: 8,
      marginHorizontal: 16,
    },
    title: {
      fontSize: 32,
    },
  });

  return (
    <SafeAreaView style={styles.container}>
      <FlatList
        data={data}
        renderItem={({ item }) => <Item title={item.name} />}
        keyExtractor={(item) => item.id}
      />
    </SafeAreaView>
  );
}
function errorAlert(arg0: { message: string }) {
  throw new Error("Function not implemented.");
}
