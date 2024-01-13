import * as React from "react";
import { useCallback, useRef } from "react";
import { View, ScrollView } from "react-native";
import { useEffect, useState } from "react";
import {
  Divider,
  Avatar,
  Text,
  useTheme,
  IconButton,
  Searchbar,
  Button,
  Badge,
} from "react-native-paper";
import FriendItem from "../components/manageFriends/FriendItem";
import { useFriendRelations, useInsertFriend } from "../utils/hooks";
import { useAlerts } from "react-native-paper-fastalerts";
import LoadingOverlay from "../components/alerts/LoadingOverlay";
import { useAuth } from "../providers/AuthProvider";
import { supabase } from "../supabase";
import {
  BottomSheetModal,
  BottomSheetModalProvider,
} from "@gorhom/bottom-sheet";
import FriendRequestModal from "../components/manageFriends/FriendRequestModal";

export default function ManageFriends({ navigation }) {
  const theme = useTheme();
  const user = useAuth().user;
  const { confirm, info } = useAlerts();
  const [searchQuery, setSearchQuery] = useState("");
  const [friendRequestsSent, setFriendRequestsSent] = useState([]);
  const [friendRequestsReceived, setFriendRequestsReceived] = useState([]);
  const [friendIdsAndNamesData, setFriendIdsAndNamesData] = useState([]);
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

  const [isRequestsModalVisible, setIsRequestsModalVisible] = useState(false);

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
  const bottomSheetModalRef = useRef<BottomSheetModal>(null);
  // callbacks
  const handlePresentModalPress = useCallback(() => {
    if (isRequestsModalVisible) {
      bottomSheetModalRef.current?.dismiss();
    } else {
      bottomSheetModalRef.current?.present();
    }
    setIsRequestsModalVisible(!isRequestsModalVisible);
  }, [isRequestsModalVisible]);

  if (error || isLoading) return <LoadingOverlay visible={isLoading} />;
  return (
    <BottomSheetModalProvider>
      <ScrollView style={{ padding: 20, gap: 10 }}>
        <FriendRequestModal
          bottomSheetModalRef={bottomSheetModalRef}
          friendRequestsReceived={friendRequestsReceived}
          friendRequestsSent={friendRequestsSent}
          userId={user.id}
          onDismiss={() => {
            setIsRequestsModalVisible(false);
            console.log("Dismissed!");
          }}
        />
        <View
          style={{
            flexDirection: "row",
            alignItems: "center",
            justifyContent: "space-between",
          }}
        >
          <Text variant="titleLarge" style={{ flex: 1 }}>
            Friends
          </Text>
          <Button
            mode="outlined"
            onPress={handlePresentModalPress}
            style={{ flex: 1 }}
          >
            Requests
          </Button>
          <View
            style={{
              flexDirection: "row",
              alignItems: "center",
              flex: 1,
            }}
          >
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
        <View style={{ paddingBottom: 20 }}>
          <View
            style={{
              flexDirection: "row",
              justifyContent: "space-between",
              alignItems: "flex-end",
              paddingBottom: 8,
            }}
          >
            {/* {friendRequestsReceived.length > 0 && (
              <Badge>{friendRequestsReceived.length}</Badge>
            )}
            {friendRequestsSent.length > 0 && (
              <Badge
                style={{
                  backgroundColor: theme.colors.primary,
                  color: theme.colors.onPrimary,
                }}
              >
                {friendRequestsSent.length}
              </Badge>
            )} */}
          </View>
          <Searchbar
            style={{
              marginBottom: 8,
              elevation: 0,
              borderRadius: 10,
            }}
            placeholder="Search"
            onChangeText={(query) => {
              setSearchQuery(query);
            }}
            value={searchQuery}
          />
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
        </View>
      </ScrollView>
    </BottomSheetModalProvider>
  );
}
