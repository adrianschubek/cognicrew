import * as React from "react";
import {
  StyleSheet,
  View,
  TouchableOpacity,
  ScrollView,
  Image,
} from "react-native";
import { useState } from "react";
import {
  Dialog,
  Portal,
  Button,
  Divider,
  Avatar,
  IconButton,
  Text,
  TextInput,
  useTheme,
} from "react-native-paper";
import { Snackbar } from "react-native-paper";
import TextWithPlusButton from "../components/common/TextWithPlusButton";

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
    <Avatar.Icon {...props} icon="account-group" size={40} />
  );

  const [showAddFriendPopup, setShowAddFriendPopup] = useState(false);
  const [newFriendName, setNewFriendName] = useState("");

  const filteredFriends = searchQuery
    ? friends.filter((friend) =>
        friend.toLowerCase().includes(searchQuery.toLowerCase()),
      )
    : friends;

  const toggleAddFriendPopup = () => {
    setShowAddFriendPopup(!showAddFriendPopup);
  };

  const handleNewFriendNameChange = (name) => {
    setNewFriendName(name);
  };

  const handleAddNewFriend = () => {
    addFriend(newFriendName);
    setShowAddFriendPopup(false);
    setNewFriendName("");
  };

  /**
   * `getFriendIconUrl` - Returns a URL for a friend's icon.
   * NOTE: This should be replaced with actual logic to retrieve the friend's profile image.
   * @param {string} friendName - The name of the friend whose icon URL is requested.
   * @returns {string} The URL of the friend's profile icon.
   */
  // use once database is ready: const getFriendIconUrl = (friendName) => `path_to_user's profile icons/${friendName}.png`;
  const getFriendIconUrl = (friendName) =>
    `https://support.discord.com/hc/user_images/yVOeDzOpxgO8ODSf9bDQ-g.png`;

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
              <View
                key={index}
                style={[
                  styles.item,
                  { backgroundColor: theme.colors.background },
                ]}
              >
                <Image
                  source={{ uri: getFriendIconUrl(friend) }}
                  style={styles.profileIcon}
                />
                <Text style={styles.itemText}>{friend}</Text>
                <IconButton
                  icon="close-circle"
                  size={28}
                  onPress={() => confirmDelete(friend)}
                />
              </View>
            ))}
          </ScrollView>
          <Divider style={styles.divider} />
        </View>

        {/* Pending friends list */}
        {pendingFriends.length > 0 && (
          <View style={styles.section}>
            <Text style={styles.sectionTitle}>Pending friend requests</Text>
            {pendingFriends.map((friend, index) => (
              <View key={index} style={styles.item}>
                <Image
                  source={{ uri: getFriendIconUrl(friend) }}
                  style={styles.profileIcon}
                />
                <Text style={styles.itemText}>{friend} (Pending)</Text>
                <TouchableOpacity onPress={() => acceptFriend(friend)}>
                  <Text style={styles.acceptButtonText}>Accept</Text>
                </TouchableOpacity>
              </View>
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
      <Portal>
        <Dialog visible={showAddFriendPopup} onDismiss={toggleAddFriendPopup}>
          <Dialog.Title>
            Get in touch with your colleagues - Add New Friend
          </Dialog.Title>
          <Dialog.Content>
            <TextInput
              onChangeText={handleNewFriendNameChange}
              value={newFriendName}
              placeholder="Enter user's nickname"
            />
            <Button
              mode="contained"
              onPress={() => handleAddNewFriend()}
              style={styles.button}
            >
              Add Friend
            </Button>
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={toggleAddFriendPopup}>Cancel</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>

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
    fontSize: 28,
    fontWeight: "bold",
    //color: '#333',
    paddingBottom: 10,
  },
  section: {
    marginBottom: 10,
  },
  sectionTitle: {
    fontSize: 22,
    fontWeight: "bold",
    //color: '#333',
    paddingBottom: 10,
  },
  item: {
    flexDirection: "row",
    alignItems: "center",
    marginBottom: 6,
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 5,
    //shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.22,
    shadowRadius: 2.22,
    elevation: 3,
  },
  profileIcon: {
    width: 40,
    height: 40,
    borderRadius: 20,
    marginRight: 8,
  },
  itemText: {
    flex: 1,
    fontSize: 17,
  },
  deleteButtonText: {
    //color: 'red',
  },
  acceptButtonText: {
    //color: 'green',
  },
  dropdownItemText: {
    fontSize: 18,
    paddingVertical: 10,
  },
  button: {
    marginTop: 10,
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
  plusIcon: {
    marginRight: 8,
  },
  friendsListContainer: {
    maxHeight: 300,
  },
});
