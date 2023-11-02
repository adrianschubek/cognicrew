import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import { Searchbar, Button, Text } from "react-native-paper";
import { useState } from "react";
import { TextInput, TouchableOpacity } from "react-native";

export default function ManageFriends({ navigation }) {
  const [searchQuery, setSearchQuery] = useState("");
  const [projectQuery, setProjectQuery] = useState("");
  const friends = ["Timo", "Alex", "Markus Rühl"];
  const projects = ["Biology", "Psychology", "Computer Science"];
  const [filteredFriends, setFilteredFriends] = useState([]);
  const [filteredProjects, setFilteredProjects] = useState([]);


  /*const handleSearch = (query) => {
    setSearchQuery(query);
    const results = friends.filter((friend) =>
      friend.toLowerCase().includes(query.toLowerCase())
    );
    setFilteredFriends(results);
  }; */


  // updated handleSearch (more generic function; can be used both for friends AND projects)

  /**
  * This function filters a given list based on the search query.
  * It's generic to work with different kinds of lists (friends, projects, etc.)
  *
  * @param {string} query - The search query to match against the list.
  * @param {string} list - The list to be filtered; either 'friends' or 'projects'.
  * @param {function} setList - The state setter function for the filtered list.
  */

  const handleSearch = (query, list, setList) => {
    if (list === 'friends') {
      setSearchQuery(query);
    } else {
      setProjectQuery(query);
    }

    const results = (list === 'friends' ? friends : projects).filter((item) =>
      item.toLowerCase().includes(query.toLowerCase())
    );

    setList(results);
  };

  return (
    <View style={styles.container}>
      {/* For Friends // Friend selection */}
      <Text style={styles.titleText}>Choose a friend from the list</Text>
      <TextInput
        style={styles.searchInput}
        onChangeText={(query) => handleSearch(query, 'friends', setFilteredFriends)}
        value={searchQuery}
        placeholder="Search"
      />

      {/* Dropdown for filtered friends */}
      <View style={styles.dropdown}>
        {filteredFriends.map((friend, index) => (
          <TouchableOpacity
            key={index}
            style={styles.dropdownItem}
            onPress={() => console.log(friend)}
          >
            <Text style={styles.dropdownText}>{friend}</Text>
          </TouchableOpacity>
        ))}
      </View>

      <Button buttonColor="red"
        contentStyle={{ backgroundColor: 'red', height: 60 }}
        labelStyle={{ color: 'white', fontSize: 20 }}
        style={{ marginBottom: 20, marginTop: 20 }}
        onPress={() => console.log('Friend removed')}
        >
        Remove from friends list
      </Button>

      {/* For Projects // Project selection*/}
      <Text style={[styles.titleText, { marginTop: 20 }]}> Add to project </Text>
      <TextInput
        style={styles.searchInput}
        onChangeText={(query) => handleSearch(query, 'projects', setFilteredProjects)}
        value={projectQuery}
        placeholder="Search"
      />
      <View style={styles.dropdown}>
        {filteredProjects.map((project, index) => (
          <TouchableOpacity
            key={index}
            style={styles.dropdownItem}
            onPress={() => console.log(project)}
          >
            <Text style={styles.dropdownText}>{project}</Text>
          </TouchableOpacity>
        ))}
      </View>
    </View>
  );
}


const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
  titleText: {
    fontSize: 30,
    fontWeight: "bold",
    marginBottom: 15,
  },
  searchInput: {
    height: 50,
    borderColor: 'blue',
    borderWidth: 1,
    paddingLeft: 10,
    width: "80%",
    marginBottom: 10,
    fontSize: 18,
  },
  dropdown: {
    width: "80%",
    maxHeight: 150,
    borderWidth: 1,
    borderColor: 'blue',
    backgroundColor: 'lightblue',
  },
  dropdownItem: {
    padding: 10,
    borderBottomWidth: 1,
    borderBottomColor: "#ccc",
  },
  dropdownText: {
    fontSize: 20,
  },
});