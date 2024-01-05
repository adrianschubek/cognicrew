import * as React from "react";
import { View, ScrollView } from "react-native";
import { useEffect, useState } from "react";
import { Text, TextInput } from "react-native-paper";
import { useFriendIdsAndNames, useProjectMembers } from "../../utils/hooks";
import { supabase } from "../../supabase";
import { useProjectStore } from "../../stores/ProjectStore";
import FriendItem from "../../components/manageFriends/FriendItem";
import { useAlerts } from "react-native-paper-fastalerts";
import LoadingOverlay from "../../components/alerts/LoadingOverlay";

export default function InviteFriends({ navigation }) {
  const [searchQuery, setSearchQuery] = useState("");
  const projectId = useProjectStore((state) => state.projectId);
  const { error: errorAlert, success } = useAlerts();
  const [friendIdsAndNamesData, setFriendIdsAndNamesData] = useState([]);
  const [projectMembers, setProjectMembers] = useState([]);
  const { data, error, isLoading, mutate } = useFriendIdsAndNames();
  const {
    data: projectMembersData,
    error: projectMembersError,
    isLoading: projectMembersIsLoading,
    mutate: mutateProjectMembers,
  } = useProjectMembers(projectId);
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

  useEffect(() => {
    const realtimeFriends = supabase
      .channel("invite_friends")
      .on(
        "postgres_changes",
        { event: "*", schema: "public", table: "friends" },
        (payload) => {
          mutate();
        },
      )
      .subscribe();
  }, []);
  useEffect(() => {
    if (!data) return;
    setFriendIdsAndNamesData(data);
  }, [data]);
  useEffect(() => {
    if (!projectMembersData) return;
    setProjectMembers(projectMembersData);
  }, [projectMembersData]);
  if (isLoading || projectMembersIsLoading)
    return <LoadingOverlay visible={isLoading || projectMembersIsLoading} />;
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
                      () => {
                        mutateProjectMembers();
                      },
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
