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
import { Card, Chip, Dialog, PaperProvider, Portal, Text, useTheme } from "react-native-paper";
import { Searchbar, Button } from "react-native-paper";
import { supabase } from "../supabase";
import { mutate } from "swr";

export default function Discover() {
  const theme = useTheme();
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

  // Add state to manage visibility for each card
  const [cardVisibility, setCardVisibility] = useState(Array(data?.length).fill(false));

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
      <View>
        <ScrollView
          horizontal={true}
          showsHorizontalScrollIndicator={false}
          pagingEnabled={true}
        >
          <Button
            style={styles.semesterFilter}
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
            style={styles.semesterFilter}
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
            style={styles.semesterFilter}
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
            style={styles.semesterFilter}
            mode="outlined"
            onPress={() => {
              
            }}
          >
            All
          </Button>
        </ScrollView>
      </View>
      <Searchbar
        style={styles.searchbar}
        placeholder="Search"
        onChangeText={onChangeSearch}
        value={searchQuery}
      />
      
      <FlatList
        /*TODO : ADDING DIALOG */
        style={styles.flatList}
        data={data.filter(
          (project) =>
            project.group === selectedSemester &&
            (project.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
              project.description.toLowerCase().includes(searchQuery.toLowerCase()))
        )}
        renderItem={({ item, index }) => (
          <Card style={styles.card} 
                key={index.toString()}
                onPress={() => {
                  // Toggle visibility for the pressed card
                  const updatedVisibility = [...cardVisibility];
                  updatedVisibility[index] = !updatedVisibility[index];
                  setCardVisibility(updatedVisibility);
                }}
                >
            <Card.Title title={item.name} titleVariant="titleLarge"/>
            <Card.Content>
              {cardVisibility[index] && (
                <>
                  <Text variant="bodyMedium">{item.description}</Text>
                  <Text variant="bodyMedium">{item.group}</Text>
                  <View style={styles.horizontalCardButtons}>
                  <Button buttonColor={theme.colors.primary} textColor="white">
                      Clone
                    </Button>
                  </View>
                </>
              )}
            </Card.Content>
          </Card>
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
    marginTop: 15,
  },
  item: {
    padding: 10,
    marginVertical: 4,
    marginHorizontal: 10,
  },
  title: {
    fontSize: 30,
  },
  card: {
    margin: 3
  },
  horizontalCardButtons: {
    flexDirection: "row",
    justifyContent: "flex-end",
  },
  flatList: {},
  searchbar: {
    marginBottom: 5,
  },
  semesterFilter: {
    marginBottom: 5,
  },
});
