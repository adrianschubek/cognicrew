import { useQuery } from "@supabase-cache-helpers/postgrest-swr";
import React, { useState } from "react";
import {
  SafeAreaView,
  StatusBar,
  View,
  StyleSheet,
  FlatList,
  ScrollView,
} from "react-native";
import { Surface, Text } from "react-native-paper";
import { Searchbar, Button } from "react-native-paper";
import { TextInput } from "react-native-paper";
import { supabase } from "../supabase";
import { styles } from "../components/learningRoom/DrawingStyle";

export default function Discover() {
  const { data } = useQuery(supabase.rpc("public_projects"), {
    onSuccess(data, key, config) {
      // errorAlert(JSON.stringify(data));
    },
    onError(err, key, config) {
      errorAlert({
        message: err.message,
      });
    },
  });

  const [text, setText] = React.useState("");
  const [searchQuery, setSearchQuery] = React.useState("");
  const onChangeSearch = (query) => setSearchQuery(query);

  type ItemProps = { title: string };
  const Item = ({ title }: ItemProps) => (
    <View style={styles.item}>
      <Text style={styles.title}>{title}</Text>
    </View>
  );
  const styles = StyleSheet.create({
    container: {
      flex: 1,
      marginTop: StatusBar.currentHeight || 5,
    },
    item: {
      backgroundColor: "#C6D1DD",
      padding: 10,
      marginVertical: 4,
      marginHorizontal: 10,
    },
    title: {
      fontSize: 32,
    },
    flatList: {},
    searchbar: {
      marginBottom: 5,
    },
    WI23: {
      height: 40,
      backgroundColor: "white",
    },
    buttonsScrollview: {
      height: 0,
      backgroundColor: "sky blue",
    },
    wrapScrollview:{
      height:40,
    }

  });

  return (
    <SafeAreaView style={styles.container}>
      {/* <TextInput
      label="Search"
      value={text}
      mode="outlined"
      onChangeText={text => setText(text)}
    /> */}
      <Searchbar
        style={styles.searchbar}
        placeholder="Search"
        onChangeText={onChangeSearch}
        value={searchQuery}
      />
      <View style = {styles.wrapScrollview}>
        <ScrollView
          horizontal={true}
          style={styles.buttonsScrollview}
          showsHorizontalScrollIndicator={false}
          pagingEnabled={true}
        >
          <Button style={styles.WI23} mode="outlined"
            onPress={() => console.log("*TODO*")}
          >
            WI 23/24
          </Button>
          <Text> </Text>
          <Button style={styles.WI23} mode="outlined"
            onPress={() => console.log("*TODO*")}
          >
            SO 23
          </Button>
          <Text> </Text>
          <Button style={styles.WI23} mode="outlined"
            onPress={() => console.log("*TODO*")}
          >
            WI 22/23
          </Button>
          <Text> </Text>
          <Button style={styles.WI23} mode="outlined"
            onPress={() => console.log("*TODO*")}
          >
            other
          </Button>
        </ScrollView>
      </View>
      <FlatList
        style={styles.flatList}
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
