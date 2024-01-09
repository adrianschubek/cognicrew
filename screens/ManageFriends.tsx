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
  Searchbar,
} from "react-native-paper";
import FriendItem from "../components/manageFriends/FriendItem";
import { responsiveHeight } from "react-native-responsive-dimensions";
import {
  useDeleteFriendRequest,
  useFriendRelations,
  useInsertFriend,
} from "../utils/hooks";
import { useAlerts } from "react-native-paper-fastalerts";
import LoadingOverlay from "../components/alerts/LoadingOverlay";
import { useAuth } from "../providers/AuthProvider";
import { supabase } from "../supabase";
import dayjs from "dayjs";

export default function ManageFriends({ navigation }) {
  const theme = useTheme();
  const user = useAuth().user;
  const { confirm, info } = useAlerts();
  const [searchQuery, setSearchQuery] = useState("");
  const [projectQuery, setProjectQuery] = useState("");
  const [friendRequestsSent, setFriendRequestsSent] = useState([]);
  const [friendRequestsReceived, setFriendRequestsReceived] = useState([]);
  const [friendIdsAndNamesData, setFriendIdsAndNamesData] = useState([]);
  const { trigger: deleteFriendRequest } = useDeleteFriendRequest();
  const { trigger: addFriend } = useInsertFriend();
  const { data, error, isLoading, mutate } = useFriendRelations();
  const sectionTitleVariant = "titleMedium";
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
    setFriendRequestsSent(data[0]?.sent_array ?? []);
    setFriendRequestsReceived(data[0]?.received_array ?? []);
    setFriendIdsAndNamesData(data[0]?.friend_array ?? []);
  }, [data]);

  if (error || isLoading) return <LoadingOverlay visible={isLoading} />;
  return (
    <ScrollView style={{ flex: 1 }} nestedScrollEnabled={true}>
      <View style={{ padding: 20, gap: 10 }}>
        <View style={styles.titleContainer}>
          <Text variant="headlineSmall">Manage Friends</Text>

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
        <View>
          <Text
            variant={sectionTitleVariant}
            style={[styles.sectionTitle, { paddingBottom: 8 }]}
          >
            All friends
          </Text>
          <Searchbar
            style={{
              marginBottom: 8,
              elevation: 0,
              borderRadius: 10,
            }}
            placeholder="Search"
            onChangeText={(query) => handleSearch(query, "friends")}
            value={searchQuery}
          />
          <ScrollView
            style={{ maxHeight: responsiveHeight(36) }}
            nestedScrollEnabled={true}
          >
            {/*ScrollView does it so the elevation effect looks bad horizontally */}
            {searchFilterFriends.map((friend, index) => (
              <FriendItem
                key={index}
                style={{ marginBottom: 8 }}
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
            <Text variant={sectionTitleVariant} style={styles.sectionTitle}>
              Pending received friend requests
            </Text>
            {friendRequestsReceived.map((friend, index) => (
              <FriendItem
                key={index}
                icon="check"
                secondIcon="close-circle"
                friendId={friend.id}
                friendName={friend.username}
                onIconPress={() =>
                  addFriend({
                    //@ts-expect-error
                    user_from_id: user.id,
                    user_to_id: friend.id,
                  })
                }
                onSecondIconPress={() => {
                  info({
                    //icon: "account-off",
                    title: "",
                    message: "Are you sure you want to delete this friend?",
                    okText: "Delete Friend",
                    okAction: () => {
                      deleteFriendRequest({
                        user_from_id: friend.id,
                        user_to_id: user.id,
                      });
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
            <Text variant={sectionTitleVariant} style={styles.sectionTitle}>
              Pending sent friend requests
            </Text>
            {friendRequestsSent.map((friend, index) => (
              <FriendItem
                key={index}
                icon="close-circle"
                friendId={friend.id}
                friendName={friend.username}
                onIconPress={() => {
                  info({
                    //icon: "information-outline",
                    title: "",
                    message: "Are you sure you want to delete this friend?",
                    okText: "Delete Friend",
                    okAction: () => {
                      deleteFriendRequest({
                        user_from_id: user.id,
                        user_to_id: friend.id,
                      });
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
  section: {
    gap: 8,
  },
  sectionTitle: {
    paddingBottom: 2,
  },
  divider: {
    height: 1,
    marginVertical: 8,
  },
  titleContainer: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
  },
  iconsContainer: {
    flexDirection: "row",
    alignItems: "center",
  },
});
