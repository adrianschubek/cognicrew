import * as React from "react";
import { StyleSheet, View, ScrollView } from "react-native";
import { useEffect, useState } from "react";
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
import {
  responsiveFontSize,
  responsiveHeight,
} from "react-native-responsive-dimensions";
import {
  useDeleteFriend,
  useFriends,
  useInsertFriend,
  useUserNames,
  useUsername,
} from "../utils/hooks";
import LoadingOverlay from "../components/alerts/LoadingOverlay";
import { useAuth } from "../providers/AuthProvider";
import { supabase } from "../supabase";

export default function ManageFriends({ navigation }) {
  const theme = useTheme();
  const [searchQuery, setSearchQuery] = useState("");
  const [projectQuery, setProjectQuery] = useState("");
  // const projects = ["Biology", "Psychology", "Computer Science"];
  const [visible, setVisible] = useState(false);
  const [selectedFriend, setSelectedFriend] = useState(null);
  //const [pendingFriends, setPendingFriends] = useState([]);
  const [snackbarText, setSnackbarText] = useState("");
  const [snackbarVisible, setSnackbarVisible] = useState(false);
  const [friendPairs, setFriendPairs] = useState([]);
  const user = useAuth().user;
  const { data, error, isLoading } = useFriends();
  const { trigger: deleteFriendRequest } = useDeleteFriend();
  const { trigger: addFriend } = useInsertFriend();
  async function deleteFriend(friend) {
    let { data, error } = await supabase.rpc("delete_friend", {
      p_other_userid: friend,
    });
    if (error) console.log(error);
    return data;
  }
  const icon = (props) => (
    <Avatar.Icon {...props} icon="account-group" size={responsiveFontSize(5)} />
  );

  const [showAddFriendPopup, setShowAddFriendPopup] = useState(false);
  const allPossibleFriendIds = friendPairs.map((friendPair) =>
    friendPair.user_to_id === user.id
      ? friendPair.user_from_id
      : friendPair.user_to_id,
  ) as string[];
  const userNames = useUserNames(allPossibleFriendIds).data as string[];
  const [userNamesLoaded, setUserNamesLoaded] = useState([] as string[]);
  // FriendPairs of friends
  const filteredFriendPairs = friendPairs.filter((friendPair) =>
    // filter out friends that have not received a friend request
    friendPair.user_from_id !== user.id
      ? false
      : friendPairs.some(
          (friendPair2) =>
            friendPair2.user_from_id === friendPair.user_to_id &&
            friendPair2.user_to_id === friendPair.user_from_id,
        ),
  );

  const filteredFriends = filteredFriendPairs.map(
    (friendPair) => friendPair.user_to_id,
  ) as string[];

   const searchFilterFriends = searchQuery
    ? userNamesLoaded && userNamesLoaded
        .map((userName) =>
          userName.substring(1, userName.length - 1).split(","),
        )
        .filter((userName) => {
          return (
            filteredFriends.includes(userName[0]) &&
            userName[1].toLowerCase().includes(searchQuery.toLowerCase()) 
          );
        }).map((userName) => userName[0])
    : filteredFriends;

  const pendingFriendRequestReceived = friendPairs.filter((friendPair) =>
    //if (User A, User B) => (User B, User A) combination is found return false, else return true if friendPair.user_to_id === user.id
    friendPairs.some(
      (friendPair2) =>
        friendPair2.user_from_id === friendPair.user_to_id &&
        friendPair2.user_to_id === friendPair.user_from_id,
    )
      ? false
      : friendPair.user_to_id === user.id,
  );
  const pendingFriendRequestSent = friendPairs.filter((friendPair) =>
    //if (User A, User B) => (User B, User A) combination is found return false, else return true if friendPair.user_to_id === user.id
    friendPairs.some(
      (friendPair2) =>
        friendPair2.user_from_id === friendPair.user_to_id &&
        friendPair2.user_to_id === friendPair.user_from_id,
    )
      ? false
      : friendPair.user_from_id === user.id,
  );
  const toggleAddFriendPopup = () => {
    setShowAddFriendPopup(!showAddFriendPopup);
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
  useEffect(() => {
    if (!userNames) return;
    setUserNamesLoaded(userNames);
  }, [userNames]);
  useEffect(() => {
    if (!data) return;
    setFriendPairs(data);
  }, [data]);
  if (error) return <LoadingOverlay visible={isLoading} />;
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
            {searchFilterFriends.map((friend, index) => (
              <FriendItem
                key={index}
                icon="close-circle"
                friend={friend}
                onIconPress={() => {
                  deleteFriend(friend);
                }}
              />
            ))}
          </ScrollView>
          <Divider style={styles.divider} />
        </View>

        {/* Pending friends list */}
        {pendingFriendRequestReceived.length > 0 && (
          <View style={styles.section}>
            <Text style={styles.sectionTitle}>
              Pending received friend requests
            </Text>
            {pendingFriendRequestReceived.map((friend, index) => (
              <FriendItem
                key={index}
                icon="check"
                secondIcon="close-circle"
                friend={
                  friend.user_from_id === user.id
                    ? friend.user_to_id
                    : friend.user_from_id
                }
                onIconPress={() =>
                  addFriend({
                    //@ts-expect-error
                    user_from_id: friend.user_to_id,
                    user_to_id: friend.user_from_id,
                  })
                }
                onSecondIconPress={() => {
                  //console.log(friend);
                  deleteFriendRequest(friend);
                }}
              />
            ))}
            <Divider style={styles.divider} />
          </View>
        )}
        {pendingFriendRequestSent.length > 0 && (
          <View style={styles.section}>
            <Text style={styles.sectionTitle}>
              Pending sent friend requests
            </Text>
            {pendingFriendRequestSent.map((friend, index) => (
              <FriendItem
                key={index}
                icon="close-circle"
                friend={
                  friend.user_from_id === user.id
                    ? friend.user_to_id
                    : friend.user_from_id
                }
                onIconPress={() => {
                  deleteFriendRequest(friend);
                }}
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
        close={() => {
          toggleAddFriendPopup();
        }}
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
