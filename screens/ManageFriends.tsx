import * as React from "react";
import { StyleSheet, View, ScrollView } from "react-native";
import { useEffect, useState } from "react";
import {
  Divider,
  Avatar,
  Text,
  TextInput,
  useTheme,
  IconButton,
} from "react-native-paper";
import FriendItem from "../components/manageFriends/FriendItem";
import {
  responsiveFontSize,
  responsiveHeight,
} from "react-native-responsive-dimensions";
import {
  friendIdsAndNames,
  useDeleteFriendRequest,
  useFriends,
  useInsertFriend,
} from "../utils/hooks";
import { useAlerts } from "react-native-paper-fastalerts";
import LoadingOverlay from "../components/alerts/LoadingOverlay";
import { useAuth } from "../providers/AuthProvider";
import { supabase } from "../supabase";

export default function ManageFriends({ navigation }) {
  const theme = useTheme();
  const user = useAuth().user;
  const { confirm, info } = useAlerts();
  const [searchQuery, setSearchQuery] = useState("");
  const [projectQuery, setProjectQuery] = useState("");
  const [friendRequestsSent, setFriendRequestsSent] = useState([]);
  const [friendRequestsReceived, setFriendRequestsReceived] = useState([]);
  //const [friendPairs, setFriendPairs] = useState([]);
  //const { friendPairs } = useSubscriptionFriends();
  const [friendIdsAndNamesData, setFriendIdsAndNamesData] = useState([]);
  const { data, error, isLoading, mutate } = useFriends();
  const { trigger: deleteFriendRequest } = useDeleteFriendRequest();
  const { trigger: addFriend } = useInsertFriend();

  async function deleteFriend(friend) {
    let { data, error } = await supabase.rpc("delete_friend", {
      p_other_userid: friend,
    });
    if (error) console.log(error);
    return data;
  }
  async function searchUser(username) {
    let { data, error } = await supabase.rpc("search_user", {
      search_query: username,
    });
    if (error) console.log(error);
    //console.log(data)
    return data;
  }
  const icon = (props) => (
    <Avatar.Icon {...props} icon="account-group" size={40} />
  );
  const searchFilterFriends =
    friendIdsAndNamesData &&
    friendIdsAndNamesData.filter((e) => {
      return e.username.toLowerCase().includes(searchQuery.toLowerCase());
    });

  function filterForPendingFriends(
    friendPairs,
    direction: "sent" | "received",
  ) {
    return friendPairs.filter((friendPair) =>
      //if (User A, User B) => (User B, User A) combination is found return false
      friendPairs.some(
        (friendPair2) =>
          friendPair2.user_from_id === friendPair.user_to_id &&
          friendPair2.user_to_id === friendPair.user_from_id,
      )
        ? false
        : direction === "received"
        ? friendPair.user_to_id === user.id
        : friendPair.user_from_id === user.id,
    );
  }
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
    const realtimeFriends = supabase
      .channel("friends_all")
      .on(
        "postgres_changes",
        { event: "*", schema: "public", table: "friends" },
        (payload) => {
          console.log("refetching friends");
          mutate();
        },
      )
      .subscribe();
  }, []);

  useEffect(() => {
    if (!data) return;
    //setFriendPairs(data);
    setFriendRequestsSent(filterForPendingFriends(data, "sent")),
      setFriendRequestsReceived(filterForPendingFriends(data, "received"));
    const fetchData = async () => {
      const { data: data2 } = await friendIdsAndNames();
      setFriendIdsAndNamesData(data2);
    };
    fetchData();
  }, [data]);

  if (error || isLoading) return <LoadingOverlay visible={isLoading} />;
  return (
    <ScrollView style={styles.container} nestedScrollEnabled={true}>
      <View style={styles.innerContainer}>
        <View style={styles.titleContainer}>
          <Text style={styles.titleText}>Manage Friends</Text>

          <View style={styles.iconsContainer}>
            <IconButton
              testID="plus-add-friend-button"
              size={28}
              icon="plus"
              iconColor={theme.colors.primary}
              onPress={() =>
                confirm({
                  icon: "account-multiple-plus",
                  title: "Get in touch with your colleagues",
                  message: "Enter your friend's nickname:",
                  messageStyle: { textAlign: "left" },
                  okText: "Add Friend",
                  okAction: async (vars) => {
                    let input = vars[0].trim();
                    let friend = await searchUser(input);
                    if ((friend && friend["username"]) === input)
                      addFriend({
                        //@ts-expect-error
                        user_from_id: user.id,
                        user_to_id: friend["id"],
                      });
                    else return "There is no friend with this nickname";
                  },
                  fields: [
                    {
                      label: "Your friend's nickname",
                      type: "text",
                      icon: "account-plus",
                      helperText: "Pay attention to capitalization",
                      required: true,
                      //validator: (value) => searchUser(value[0]).test(value),
                      errorText: "There is no friend with this nickname",
                    },
                  ],
                })
              }
            />
            {icon({})}
          </View>
        </View>

        {/* Friends list */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>All friends</Text>

          <TextInput
            onChangeText={(query) => handleSearch(query, "friends")}
            value={searchQuery}
            placeholder="Search friends"
            style={{ marginBottom: 10 }}
          />
          <ScrollView
            style={styles.friendsListContainer}
            nestedScrollEnabled={true}
          >
            {searchFilterFriends.map((friend, index) => (
              <FriendItem
                key={index}
                icon="close-circle"
                friendId={friend.id}
                friendName={friend.username}
                onIconPress={() => {
                  info({
                    //icon: "account-off",
                    title: "",
                    message: "Are you sure you want to delete this friend?",
                    okText: "Delete Friend",
                    okAction: () => {
                      deleteFriend(friend.id);
                    },
                  });
                }}
              />
            ))}
          </ScrollView>
          <Divider style={styles.divider} />
        </View>

        {/* Pending friends list */}
        {friendRequestsReceived.length > 0 && (
          <View style={styles.section}>
            <Text style={styles.sectionTitle}>
              Pending received friend requests
            </Text>
            {friendRequestsReceived.map((friend, index) => (
              <FriendItem
                key={index}
                icon="check"
                secondIcon="close-circle"
                friendId={friend.user_from_id}
                onIconPress={() =>
                  addFriend({
                    //@ts-expect-error
                    user_from_id: friend.user_to_id,
                    user_to_id: friend.user_from_id,
                  })
                }
                onSecondIconPress={() => {
                  info({
                    //icon: "account-off",
                    title: "",
                    message: "Are you sure you want to delete this friend?",
                    okText: "Delete Friend",
                    okAction: () => {
                      deleteFriendRequest(friend);
                    },
                  });
                }}
              />
            ))}
            <Divider style={styles.divider} />
          </View>
        )}
        {friendRequestsSent.length > 0 && (
          <View style={styles.section}>
            <Text style={styles.sectionTitle}>
              Pending sent friend requests
            </Text>
            {friendRequestsSent.map((friend, index) => (
              <FriendItem
                key={index}
                icon="close-circle"
                friendId={friend.user_to_id}
                onIconPress={() => {
                  info({
                    //icon: "information-outline",
                    title: "",
                    message: "Are you sure you want to delete this friend?",
                    okText: "Delete Friend",
                    okAction: () => {
                      deleteFriendRequest(friend);
                    },
                  });
                }}
              />
            ))}
            <Divider style={styles.divider} />
          </View>
        )}
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  innerContainer: {
    padding: 20,
  },
  titleText: {
    fontSize: 28,
    fontWeight: "bold",
    paddingBottom: 10,
  },
  section: {
    //marginBottom: 10,
  },
  sectionTitle: {
    fontSize: 22,
    fontWeight: "bold",
    paddingBottom: 10,
  },
  dropdownItemText: {
    fontSize: 16,
    paddingVertical: 10,
  },
  divider: {
    height: 1,
    marginVertical: 8,
  },
  titleContainer: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
    paddingBottom: 10,
  },
  iconsContainer: {
    flexDirection: "row",
    alignItems: "center",
  },
  friendsListContainer: {
    maxHeight: responsiveHeight(38),
  },
});
