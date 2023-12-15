import { useQuery } from "@supabase-cache-helpers/postgrest-swr";
import React, { useEffect, useState } from "react";
import {
  SafeAreaView,
  StatusBar,
  View,
  StyleSheet,
  FlatList,
  ScrollView,
  TouchableOpacity,
  Alert,
} from "react-native";
import { Dialog, PaperProvider, Portal, Text } from "react-native-paper";
import { Searchbar, Button } from "react-native-paper";
import { supabase } from "../supabase";
import { mutate } from "swr";

export default function Discover() {
  const [selectedSemester, setSelectedSemester] = useState("All"); //Default semester
  const [searchQuery, setSearchQuery] = useState("");

  const { data , mutate } = useQuery(supabase.rpc("public_projects"), {
    onSuccess(data, key, config) {
      console.log("Data fetched successfully:", data.data);
    },
    onError(err, key, config) {
      errorAlert({
        message: err.message,
      });
    },
  });

  const onChangeSearch = (query) => setSearchQuery(query);
  const [visible, setVisible] = useState(false);
  const hideDialog = () => setVisible(false);

  type ItemProps = { title: string };
  const Item = ({ title }: ItemProps) => (
    <View style={styles.item}>
      <Text style={styles.title}>{title}</Text>
    </View>
  );


  const CourseDialog = () => {
    const [visible, setVisible] = useState(false);

    const showDialog = () => setVisible(true);

    const hideDialog = () => setVisible(false);

    return (
      <PaperProvider>
        <View>
          <Button onPress={showDialog}>Show Dialog</Button>
          <Portal>
            <Dialog visible={visible} onDismiss={hideDialog}>
              <Dialog.Title>Alert</Dialog.Title>
              <Dialog.Content>
                <Text variant="bodyMedium">This is simple dialog</Text>
              </Dialog.Content>
              <Dialog.Actions>
                <Button onPress={hideDialog}>Done</Button>
              </Dialog.Actions>
            </Dialog>
          </Portal>
        </View>
      </PaperProvider>
    );
  };
if (!data) return null

  return (
    <SafeAreaView style={styles.container}>
      <Searchbar
        style={styles.searchbar}
        placeholder="Search"
        onChangeText={onChangeSearch}
        value={searchQuery}
      />
      <View>
        <ScrollView
          horizontal={true}
          showsHorizontalScrollIndicator={false}
          pagingEnabled={true}
        >
          <Button
            style={styles.WI23}
            mode="outlined"
            onPress={() => {
              setSelectedSemester("Winter 2023/24");
              mutate();
              console.log("WI23-Button-Pressed");
            }}
          >
            WI 23/24
          </Button>
          <Text> </Text>
          <Button
            style={styles.WI23}
            mode="outlined"
            onPress={() => {
              setSelectedSemester("Summer 2023");
              mutate();
              console.log("*TODO*");
            }}
          >
            SO 23
          </Button>
          <Text> </Text>
          <Button
            style={styles.WI23}
            mode="outlined"
            onPress={() => {
              setSelectedSemester("Winter 2022/23");
              mutate();
            }}
          >
            WI 22/23
          </Button>
          <Text> </Text>
          <Button
            style={styles.WI23}
            mode="outlined"
            onPress={() => {
              setSelectedSemester("All");
              mutate();
            }}
          >
            All
          </Button>
        </ScrollView>
      </View>
      <FlatList
        /*TODO : ADDING DIALOG */
        style={styles.flatList}
        data={data.filter(project=>project.group===selectedSemester)}
        renderItem={({ item, index }) => (
          <TouchableOpacity
            key={index.toString()}
            onPress={() => {
              Alert.alert(
                "Project Catalog",
                "\n" +
                  "Course Name: " +
                  item.name +
                  "\n\n" +
                  "Description: " +
                  item.description +
                  "\n\n" +
                  "Semester: " +
                  item.group,
                [
                  {
                    text: "Clone to My Project",
                    onPress: () => console.log("Cancel Pressed"), //TODO
                    style: "cancel",
                  },
                  {
                    text: "OK",
                    onPress: () => console.log("OK Pressed"),
                  },
                ],
              );
              console.log("Dialog not working");
            }}
          >
            <Item title={item.name} />
          </TouchableOpacity>
        )}
        //keyExtractor={(item) => item.id}
      />
    </SafeAreaView>
  );
}
function errorAlert(arg0: { message: string }) {
  throw new Error("Function not implemented.");
}

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
});
