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
import { Snackbar, Checkbox } from "react-native-paper";
import {
  responsiveFontSize,
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import TextWithPlusButton from "../common/TextWithPlusButton";
import InviteFriendDialog from "./InviteFriendDialog";
import FriendItem2 from "../manageFriends/FriendItem2";
import { useFriends, useFriendsList } from "../../utils/hooks";
import LoadingOverlay from "../alerts/LoadingOverlay";
import { supabase } from "../../supabase";
import { useProjectStore } from "../../stores/ProjectStore";

export default function InviteFriends({ navigation }) {
  const theme = useTheme();
  const [searchQuery, setSearchQuery] = useState("");
  const [friends, setFriends] = useState([]);

  const projectId = useProjectStore((state) => state.projectId);

  const { data, error, isLoading } = useFriendsList();
  useEffect(() => {
    if (!data) return;
    setFriends(data);
  }, [data]);

  const [showInviteDialog, setShowInviteDialog] = useState(false);
  const [selectedFriend, setSelectedFriend] = useState(null);
  const [snackbarText, setSnackbarText] = useState("");
  const [snackbarVisible, setSnackbarVisible] = useState(false);
  const [invitedFriends, setInvitedFriends] = useState({});
  const [checkedState, setCheckedState] = useState({});

  const handleCheckboxChange = (friend) => {
    setCheckedState((prevState) => ({
      ...prevState,
      [friend]: !prevState[friend],
    }));
  };

  const icon = (props) => (
    <Avatar.Icon
      {...props}
      icon="email-plus-outline"
      size={responsiveFontSize(5)}
    />
  );

  const filteredFriends = !friends
    ? []
    : searchQuery
    ? friends.filter((friend) =>
        friend.toLowerCase().includes(searchQuery.toLowerCase()),
      )
    : friends;

  const handleSearch = (query) => {
    setSearchQuery(query);
  };

  const inviteFriend = (friend) => {
    setSelectedFriend(friend);
    setShowInviteDialog(true);
    setInvitedFriends((prevState) => ({ ...prevState, [friend]: true }));
    setCheckedState((prevState) => ({ ...prevState, [friend]: false }));
  };

  const sendInvite = () => {
    setSnackbarText(`An invite has been sent to ${selectedFriend}`);
    setSnackbarVisible(true);
    setShowInviteDialog(false);
    setInvitedFriends((prevState) => ({
      ...prevState,
      [selectedFriend]: true,
    }));
  };

  const handleMultipleInvites = () => {
    let anyChecked = false;
    Object.keys(checkedState).forEach((friend) => {
      if (checkedState[friend]) {
        anyChecked = true;
        inviteFriend(friend);
      }
    });

    if (anyChecked) {
      setSnackbarText("Invites have been sent to selected friends.");
    } else {
      setSnackbarText("No friends were selected.");
    }
    setSnackbarVisible(true);
  };

  const invite = async (userId: string) => {
    let { data, error } = await supabase.rpc("invite_user_to_project", {
      p_other_user_id: userId,
      p_project_id: projectId,
    });

    if (error) console.error(error);
    else console.log(data);
  };

  if (isLoading || error) return <LoadingOverlay visible />;
  console.log("friends", friends);

  return (
    <ScrollView style={styles.container}>
      <View style={styles.innerContainer}>
        <View style={styles.titleContainer}>
          <Text style={styles.titleText}>Invite Friends</Text>
          <View style={styles.iconsContainer}>
            <TextWithPlusButton text="" function={handleMultipleInvites} />
            {icon({ style: styles.iconStyle })}
          </View>
        </View>

        {/* Friends list */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Your Friends</Text>

          <TextInput
            onChangeText={handleSearch}
            value={searchQuery}
            placeholder="Search to invite"
          />
          <ScrollView style={styles.friendsListContainer}>
            {filteredFriends.map((friend, index) => (
              <View
                key={index}
                style={[
                  styles.friendItem2,
                  invitedFriends[friend] ? styles.invitedFriendItem : null,
                ]}
              >
                <FriendItem2
                  key={index}
                  friend={friend.user_from_id}
                  checked={checkedState[friend]}
                  onCheck={() => handleCheckboxChange(friend)}
                  icon="email-plus-outline"
                  onIconPress={() =>
                    // !invitedFriends[friend] && inviteFriend(friend)
                    invite(friend.user_from_id)
                  }
                />
              </View>
            ))}
          </ScrollView>

          <Divider style={styles.divider} />
        </View>
      </View>

      {/* Invite dialog */}
      <Portal>
        <InviteFriendDialog
          showInviteDialog={showInviteDialog}
          friend={selectedFriend}
          sendInvite={sendInvite}
          close={() => setShowInviteDialog(false)}
        />
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
  },
  innerContainer: {
    padding: 20,
  },
  titleText: {
    fontSize: responsiveFontSize(3.5),
    fontWeight: "bold",
    paddingBottom: 10,
  },
  section: {
    marginBottom: 10,
  },
  sectionTitle: {
    fontSize: responsiveFontSize(2.75),
    fontWeight: "bold",
    paddingBottom: 10,
  },
  deleteButtonText: {},
  acceptButtonText: {},
  dropdownItemText: {
    fontSize: responsiveFontSize(2.25),
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
  friendItem2: {
    flexDirection: "row",
    alignItems: "center",
  },
  invitedFriendItem: {
    opacity: 0.5,
  },
});
