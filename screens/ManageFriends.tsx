import * as React from "react";
import { StyleSheet, View, ScrollView } from "react-native";
import { useState } from "react";
import {
  Dialog,
  Portal,
  Button,
  Divider,
  Avatar,
  Text,
  TextInput,
  useTheme,
} from "react-native-paper";
import { Snackbar } from "react-native-paper";
import TextWithPlusButton from "../components/common/TextWithPlusButton";
import FriendItem from "../components/manageFriends/FriendItem";
import AddFriend from "../components/dialogues/AddFriend";
import { responsiveFontSize, responsiveHeight, responsiveWidth } from "react-native-responsive-dimensions";

export default function ManageFriends({ navigation }) {
  const theme = useTheme();
  const [searchQuery, setSearchQuery] = useState("");
  const [projectQuery, setProjectQuery] = useState("");
  const [friends, setFriends] = useState([
    "Cognimo",
    "Cognick",
    "Cognidrian",
    "Cognian",
    "CogniLex",
    "Yoojin",
  ]);
  // const projects = ["Biology", "Psychology", "Computer Science"];
  const [visible, setVisible] = useState(false);
  const [selectedFriend, setSelectedFriend] = useState(null);
  const [pendingFriends, setPendingFriends] = useState([]);
  const [snackbarText, setSnackbarText] = useState("");
  const [snackbarVisible, setSnackbarVisible] = useState(false);
  const icon = (props) => (
    <Avatar.Icon {...props} icon="account-group" size={responsiveFontSize(5)} />
  );

  const [showAddFriendPopup, setShowAddFriendPopup] = useState(false);

  const filteredFriends = searchQuery
    ? friends.filter((friend) =>
        friend.toLowerCase().includes(searchQuery.toLowerCase()),
      )
    : friends;

  const toggleAddFriendPopup = () => {
    setShowAddFriendPopup(!showAddFriendPopup);
  };

  /**
   * `confirmDelete` - Opens a dialog to confirm deletion of a friend.
   * @param {string} friend - The name of the friend to potentially delete.
   */
  const confirmDelete = (friend) => {
    setSelectedFriend(friend);
    setVisible(true);
  };

  /**
   * `deleteFriend` - Deletes a friend from the friends list and shows a snackbar confirmation.
   * @param {string} friend - The name of the friend to delete.
   */
  const deleteFriend = (friend) => {
    setFriends((currentFriends) => currentFriends.filter((f) => f !== friend));
    setSnackbarText(`${friend} has been deleted from your friends list`);
    setSnackbarVisible(true);
    setVisible(false);
  };

  /**
   * `handleSearch` - Updates the search query state based on user input.
   * @param {string} query - The current text in the search input field.
   * @param {string} list - The list type being searched ('friends' or 'projects').
   */
  const handleSearch = (query, list) => {
    if (list === "friends") {
      setSearchQuery(query);
    } else {
      setProjectQuery(query);
    }
  };

  /**
   * `addFriend` - Attempts to add a friend to the pending friends list and gives feedback via snackbar.
   * @param {string} friend - The name of the friend to add.
   */
  const addFriend = (friend) => {
    if (
      friend &&
      !friends.includes(friend) &&
      !pendingFriends.includes(friend)
    ) {
      setPendingFriends([...pendingFriends, friend]);
      setSnackbarText(`Friend request sent to ${friend}`);
      setSnackbarVisible(true);
      setSearchQuery("");
    }
  };

  /**
   * `acceptFriend` - Moves a friend from the pending list to the confirmed friends list.
   * @param {string} friend - The name of the friend to accept.
   */
  const acceptFriend = (friend) => {
    setFriends([...friends, friend]);
    setPendingFriends(pendingFriends.filter((f) => f !== friend));
    setSnackbarText(`${friend} has been added to your friends list`);
    setSnackbarVisible(true);
  };

  return (
    <ScrollView style={styles.container}>
      <View style={styles.innerContainer}>
        <View style={styles.titleContainer}>
          <Text style={styles.titleText}>Manage Friends</Text>
          <View style={styles.iconsContainer}>
            <TextWithPlusButton text="" function={toggleAddFriendPopup} />
            {icon({ style: styles.iconStyle })}
          </View>
        </View>

        {/* Friends list */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>All friends</Text>

          <TextInput
            onChangeText={(query) => handleSearch(query, "friends")}
            value={searchQuery}
            placeholder="Search friends"
          />
          <ScrollView style={styles.friendsListContainer}>
            {filteredFriends.map((friend, index) => (
              <FriendItem
                id={index}
                icon="close-circle"
                friend={friend}
                onIconPress={() => confirmDelete(friend)}
              />
            ))}
          </ScrollView>
          <Divider style={styles.divider} />
        </View>

        {/* Pending friends list */}
        {pendingFriends.length > 0 && (
          <View style={styles.section}>
            <Text style={styles.sectionTitle}>Pending friend requests</Text>
            {pendingFriends.map((friend, index) => (
              <FriendItem
                id={index}
                icon="check"
                friend={friend}
                onIconPress={() => acceptFriend(friend)}
              />
            ))}
            <Divider style={styles.divider} />
          </View>
        )}

        {/* Project search */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Projects</Text>
          <TextInput
            onChangeText={(query) => handleSearch(query, "projects")}
            value={projectQuery}
            placeholder="Search Projects"
          />
        </View>
      </View>

      {/* Delete confirmation dialog */}
      <Portal>
        <Dialog visible={visible} onDismiss={() => setVisible(false)}>
          <Dialog.Title>Delete Confirmation</Dialog.Title>
          <Dialog.Content>
            <Text>Are you sure you want to remove {selectedFriend}?</Text>
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={() => setVisible(false)}>Cancel</Button>
            <Button onPress={() => deleteFriend(selectedFriend)}>Delete</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>

      {/* Friend popup dialog */}
      <AddFriend
        showAddFriendPopup={showAddFriendPopup}
        addFriend={addFriend}
        close={() => toggleAddFriendPopup()}
      />

      {/* Snackbar - providing feedback to the user */}
      <Snackbar
        visible={snackbarVisible}
        onDismiss={() => setSnackbarVisible(false)}
        duration={3000}
      >
        {snackbarText}
      </Snackbar>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    //backgroundColor: '#f8f8f8',
  },
  innerContainer: {
    padding: 20,
  },
  titleText: {
    fontSize: responsiveFontSize(3.5),
    fontWeight: "bold",
    //color: '#333',
    paddingBottom: 10,
  },
  section: {
    marginBottom: 10,
  },
  sectionTitle: {
    fontSize: responsiveFontSize(2.75),
    fontWeight: "bold",
    //color: '#333',
    paddingBottom: 10,
  },
  deleteButtonText: {
    //color: 'red',
  },
  acceptButtonText: {
    //color: 'green',
  },
  dropdownItemText: {
    fontSize: responsiveFontSize(2.25),
    paddingVertical: 10,
  },
  divider: {
    height: 1,
    //backgroundColor: "#e0e0e0",
    marginVertical: 8,
  },
  titleContainer: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
    paddingBottom: 10,
  },
  iconStyle: {
    // can style the icon later if we want to
  },
  iconsContainer: {
    flexDirection: "row",
    alignItems: "center",
  },
  friendsListContainer: {
    maxHeight: responsiveHeight(37.5), 
  },
});
