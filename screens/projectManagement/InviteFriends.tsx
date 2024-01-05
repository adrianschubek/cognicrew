import * as React from "react";
import { View, ScrollView } from "react-native";
import { useEffect, useState } from "react";
import { Text, TextInput } from "react-native-paper";
import { friendIdsAndNames } from "../../utils/hooks";
import { supabase } from "../../supabase";
import { useProjectStore } from "../../stores/ProjectStore";
import FriendItem from "../../components/manageFriends/FriendItem";
import { useAlerts } from "react-native-paper-fastalerts";

export default function InviteFriends({ navigation }) {
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
      .channel("invite_friends")
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
    <ScrollView style={{ flex: 1 }}>
      <View style={{ padding: 20, gap: 10 }}>
        <Text variant="headlineSmall" style={{ marginBottom: 10 }}>
          Invite Friends
        </Text>

        {/* Friends list */}
        <View style={{ gap: 10 }}>
          <Text variant="titleMedium">Your Friends</Text>
          <TextInput
            onChangeText={handleSearch}
            value={searchQuery}
            placeholder="Search to invite"
          />
          <View>
            {filteredFriends.map((friend, index) => {
              //console.log(projectMembers.map((member) => member.user_id)),
              let isMember = projectMembers
                .map((member) => member.user_id)
                .includes(friend.id);
              //console.log(isMember);
              return (
                <FriendItem
                  key={index}
                  style={{ marginBottom: 10 }}
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
          </View>
        </View>
      </View>
    </ScrollView>
  );
}