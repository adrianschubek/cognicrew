import * as React from "react";
import { StyleSheet, View, ScrollView } from "react-native";
import { useEffect, useState } from "react";
import { Divider, Text, TextInput, useTheme } from "react-native-paper";
import {
  responsiveFontSize,
  responsiveHeight,
} from "react-native-responsive-dimensions";
import { friendIdsAndNames } from "../../utils/hooks";
import { supabase } from "../../supabase";
import { useProjectStore } from "../../stores/ProjectStore";
import FriendItem from "../../components/manageFriends/FriendItem";
import { useAlerts } from "react-native-paper-fastalerts";

export default function InviteFriends({ navigation }) {
  const theme = useTheme();
  const [searchQuery, setSearchQuery] = useState("");
  const projectId = useProjectStore((state) => state.projectId);
  const { error: errorAlert, success } = useAlerts();
  const [friendIdsAndNamesData, setFriendIdsAndNamesData] = useState([]);
  const [projectMembers, setProjectMembers] = useState([]);
  const [refetchIndex, setRefetchIndex] = useState(0);
  async function getProjectMembers() {
    let { data, error } = await supabase.rpc("project_members", {
      p_project_id: projectId,
    });
    if (error) console.log(error);
    return { data, error };
  }
  const filteredFriends = friendIdsAndNamesData.filter((friend) =>
    friend.username.toLowerCase().includes(searchQuery.toLowerCase()),
  );

  const handleSearch = (query) => {
    setSearchQuery(query);
  };

  const remove = async (userId: string) => {
    let { data, error } = await supabase.rpc("remove_user_from_project", {
      p_other_user_id: userId,
      p_project_id: projectId,
    });

    if (error) errorAlert({ message: error.message });
    else success({ message: "User removed from project." });
  };

  const invite = async (userId: string) => {
    let { data, error } = await supabase.rpc("invite_user_to_project", {
      p_other_user_id: userId,
      p_project_id: projectId,
    });

    if (error) errorAlert({ message: error.message });
    else success({ message: "User invited to project." });
  };

  const fetchFriends = async () => {
    const { data } = await friendIdsAndNames();
    setFriendIdsAndNamesData(data);
  };

  const fetchProjectMembers = async () => {
    const { data } = await getProjectMembers();
    setProjectMembers(data);
  };
  useEffect(() => {
    const realtimeFriends = supabase
      .channel("friends_all")
      .on(
        "postgres_changes",
        { event: "*", schema: "public", table: "friends" },
        (payload) => {
          fetchFriends();
        },
      )
      .subscribe();
  }, []);
  useEffect(() => {
    fetchFriends();
    fetchProjectMembers();
  }, []);
  useEffect(() => {
    fetchProjectMembers();
  }, [refetchIndex]);
  return (
    <ScrollView style={styles.container}>
      <View style={styles.innerContainer}>
        <View style={styles.titleContainer}>
          <Text style={styles.titleText}>Invite Friends</Text>
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
            {filteredFriends.map((friend, index) => {
              //console.log(projectMembers.map((member) => member.user_id)),
              let isMember = projectMembers
                .map((member) => member.user_id)
                .includes(friend.id);
              //console.log(isMember);
              return (
                <FriendItem
                  key={index}
                  friendId={friend.id}
                  friendName={friend.username}
                  //onCheck={() => handleCheckboxChange(friend)}
                  icon={isMember ? "close" : "email-plus-outline"}
                  onIconPress={() =>
                    (isMember ? remove(friend.id) : invite(friend.id)).then(
                      () => setRefetchIndex(refetchIndex + 1),
                    )
                  }
                />
              );
            })}
          </ScrollView>
          <Divider style={styles.divider} />
        </View>
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
    // flexDirection: "row",
    alignItems: "center",
  },
  invitedFriendItem: {
    opacity: 0.5,
  },
});
