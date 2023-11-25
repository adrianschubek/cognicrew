import * as React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import { FAB, IconButton, Tooltip, useTheme } from "react-native-paper";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import LearningProjectCategory from "../components/learningProject/LearningProjectCategory";
import { ManagementType, NAVIGATION } from "../types/common";
import { useEffect, useState } from "react";
import { useProjectStore } from "../stores/ProjectStore";
import { useAlerts, useSoundSystem1 } from "../utils/hooks";
import { supabase } from "../supabase";
import { useAuth } from "../providers/AuthProvider";
import { useRoomStore } from "../stores/RoomStore";

export default function LearningProject({ navigation, route }) {
  useSoundSystem1();

  const { user } = useAuth();
  const { project } = route.params;
  const { confirm, info, error: errorAlert } = useAlerts();
  const theme = useTheme();

  const setRoom = useRoomStore((state) => state.setRoom);

  const reset = useProjectStore((state) => state.reset);
  useEffect(() => navigation.addListener("beforeRemove", reset), [navigation]);
  const setProjectId = useProjectStore((state) => state.setProjectId);
  useEffect(() => setProjectId(project?.id), [project]);

  
 const projectId = useProjectStore((state) => state.projectId);


  useEffect(() => {
    navigation.setOptions({
      title: project.name,
      headerRight: () => (
        <>
           <Tooltip title="Rate project">
            <IconButton
              icon="star"
              onPress={() => {
                navigation.navigate(NAVIGATION.RATE_PROJECT, {
                  edit: project,
                });
              }}
            ></IconButton>
          </Tooltip>
          <Tooltip title="Project settings">
            <IconButton
              icon="cog"
              onPress={() => {
                navigation.navigate(NAVIGATION.CREATEEDIT_PROJECT, {
                  edit: project,
                });
              }}
            ></IconButton>
          </Tooltip>
          {user.id === project.owner_id && (
            <Tooltip title="Invite users">
              <IconButton
                icon="account-plus"
                onPress={() => {
                  navigation.navigate(NAVIGATION.INVITE_FRIENDS, {
                    edit: null, // TODO
                  });
                }}
              ></IconButton>
            </Tooltip>
          )}
        </>
      ),
    });
  }, []);

  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <LearningProjectCategory
        path={require("../assets/cards_symbol.png")}
        name={"Cognicards"}
        function={() => {
          navigation.navigate(NAVIGATION.FLASHCARD_EXERCISE_MANAGEMENT, {
            type: ManagementType.FLASHCARD,
          });
        }}
      />
      <LearningProjectCategory
        path={require("../assets/completed_task_symbol.png")}
        name={"Cognicises"}
        function={() => {
          navigation.navigate(NAVIGATION.FLASHCARD_EXERCISE_MANAGEMENT, {
            type: ManagementType.EXERCISE,
          });
        }}
      />
      <LearningProjectCategory
        path={require("../assets/camera_symbol.png")}
        name={"Cognilinks"}
        function={() => {
          navigation.navigate(NAVIGATION.LINK_MANAGEMENT);
        }}
      />
      <LearningProjectCategory
        path={require("../assets/files_symbol.png")}
        name={"Cognifiles"}
        function={() => {
          navigation.navigate(NAVIGATION.FILES_MANAGEMENT);
        }}
      />
      <FAB
        icon={"play"}
        onPress={() => {
          confirm({
            icon: "play",
            title: "Create Room",
            okText: "Create",
            okAction: async (params) => {
              const { data, error } = await supabase.rpc("create_room", {
                p_project_id: parseInt(project.id),
                p_name: params[0] ?? null,
                p_code: parseInt(params[1]) ?? null,
                p_share_code: parseInt(params[2]) ?? null,
                p_private: !!params[3],
                p_size: parseInt(params[4]) ?? null,
              });
              navigation.navigate(NAVIGATION.LOBBY);
              if (error) return error.message;
              setRoom(data);
            },
            fields: [
              {
                label: "Name",
                icon: "tag-text",
                defaultValue: project.name,
              },
              {
                label: "Password",
                type: "number",
                icon: "key",
                helperText:
                  "A password required to join. Optional.",
                validator: (value) => /^[0-9]{0,6}$/.test(value),
                errorText: "Room code must be between 0 and 6 digits",
              },
              {
                label: "Join Code",
                type: "number",
                icon: "share-circle",
                helperText:
                  "A code to enter this room directly. This also bypasses the password. Optional.",
                validator: (value) => /^[0-9]{0,6}$/.test(value),
                errorText: "Room code must be between 0 and 6 digits",
              },
              {
                label: "Friends only",
                icon: "account-heart",
                type: "checkbox",
                helperText: "Only friends can join this room.",
              },
              {
                label: "Size (1-100)",
                type: "number",
                helperText: "The maximum amount of players in this room.",
                icon: "account-group",
                defaultValue: "2",
                validator: (value) => /^[1-9][0-9]?$|^100$/.test(value),
                errorText: "Size must be between 1 and 100",
              },
            ],
          });
        }}
        color={theme.colors.onPrimary}
        style={{
          position: "absolute",
          margin: 16,
          right: 0,
          bottom: 0,
          backgroundColor: theme.colors.primary,
        }}
        label={"Create Room"}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    width: responsiveWidth(100),
    height: responsiveHeight(100),
    flex: 1,
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "flex-start",
  },
});
