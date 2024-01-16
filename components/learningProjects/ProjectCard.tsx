import { useState } from "react";
import { TouchableOpacity, View } from "react-native";
import { Button, Card, Icon, Text, useTheme } from "react-native-paper";
import { useAlerts } from "react-native-paper-fastalerts";
import LearningProjectAvatarWithTitle from "../learningProject/LearningProjectAvatarWithTitle";
import { supabase } from "../../supabase";
import { useNavigation } from "@react-navigation/native";
import { NAVIGATION } from "../../types/common";
import { useRoomStore } from "../../stores/RoomStore";
import dayjs from "dayjs";
import { useProjectStore } from "../../stores/ProjectStore";
import { useAuth } from "../../providers/AuthProvider";

export default function ProjectCard(props: { item: any }) {
  const theme = useTheme();
  const { user } = useAuth();
  const navigation = useNavigation();
  const { confirm } = useAlerts();
  const setRoom = useRoomStore((state) => state.setRoom);
  const setProjectId = useProjectStore((state) => state.setProjectId);
  const { item } = props;
  const [expanded, setExpanded] = useState<boolean>(false);
  const fetchFiles = async (filePath: string, limit?: number) => {
    try {
      const { data, error } = await supabase.storage
        .from("files")
        .list(filePath, {
          limit: limit || 100,
          offset: 0,
        });

      if (error) {
        console.error("Error fetching files:", error.message);
        return null; // Return null or handle the error as needed
      }

      return data; // Return the list of files
    } catch (error) {
      console.error("Error in fetchFiles:", error.message);
      return null; // Return null or handle the error as needed
    }
  };

  const save = async (projectId, newProjectName) => {
    console.log("Test");
    const { data: upsertedProjectId, error } = await supabase.rpc(
      "copy_learning_project",
      {
        p_source_id: projectId,
        p_new_owner_id: user.id,
        p_new_project_name: newProjectName,
      },
    );

    console.log(upsertedProjectId);
    const fileTypes = ["pdf", "photos", "docx", "excel", "miscellaneous"];

    try {
      for (const fileType of fileTypes) {
        const files = await fetchFiles(`${projectId}/${fileType}`);

        // Use the copy method to clone files to the destination folder
        files.map(async (file) => {
          await supabase.storage
            .from("files")
            .copy(
              `${projectId}/${fileType}/${file.name}`,
              `${upsertedProjectId}/${fileType}/${file.name}`,
            );
        });
      }
    } catch (error) {
      console.error("Error copying files: ", error.message);
      throw error;
    }
  };

  const hiddenInfo = [
    { title: "Description", data: item.project_description },
  ];
  const extraInfo = [
    {
      title: "✨",
      data: item.project_owner_name /*+ "xxxxxxxx"*/,
    },
    {
      title: "📆",
      data: item.project_group,
    },
  ];
  const ratingStats = {
    title: "Rating",
    data: item.project_avg_rating.toFixed(1),
    icon: <Icon source="star" size={30} color="#ffb300" />,
  };

  return (
    <TouchableOpacity
      onPress={() => {
        setExpanded(!expanded);
      }}
    >
      <Card
        elevation={0}
        style={{
          margin: 3,
          marginBottom: 10,
          backgroundColor: theme.colors.secondaryContainer,
          borderRadius: 20,
        }}
      >
        <Card.Content
          style={{
            flexDirection: "column",
            gap: 10,
          }}
        >
          <View
            style={{
              flexDirection: "row",
              flex: 1,
              alignItems: "center",
              justifyContent: "space-between",
            }}
          >
            <LearningProjectAvatarWithTitle
              projectName={item.project_name /*+ "+#+#+#+#+#+#+#+#"*/}
              avatarSize={65}
              style={{ flexDirection: "row", alignItems: "center", flex: 1 }}
              textStyle={{
                marginTop: 0,
                marginLeft: 10,
              }}
              textVariant="bodyLarge"
              textAlign="left"
              textMaxWidth="65%"
              numberOfLines={1}
              extraInfoTexts={extraInfo.map((item) => {
                return item.title + " " + item.data;
              })}
            />
            <View
              style={{
                flexDirection: "row",
                alignItems: "center",
              }}
            >
              <Text
                variant="titleMedium"
                style={{ fontWeight: "bold", marginRight: 5 }}
              >
                {ratingStats.data}
              </Text>
              {ratingStats.icon}
            </View>
          </View>
          {expanded && (
            <View style={{ flexDirection: "column" }}>
              {hiddenInfo[0].data &&
                hiddenInfo.map((item, index) => {
                  return (
                    <View key={index} style={{ flexDirection: "row", gap: 10 }}>
                      {/*<Text variant="bodyMedium">{item.title}: </Text>*/}
                      <Text key={index} variant="bodyMedium">
                        {item.data}
                      </Text>
                    </View>
                  );
                })}
              <View
                style={{
                  marginTop: 10,
                  flexDirection: "row",
                  // justifyContent: "space-between",
                  alignItems: "center",
                }}
              >
                <View
                  style={{
                    flexDirection: "row",
                    justifyContent: "flex-start",
                    width: "50%",
                    flexWrap: "wrap",
                    marginRight: "auto",
                  }}
                >
                  <Text
                    variant="bodyMedium"
                    style={{
                      fontStyle: "italic",
                    }}
                  >
                    Created: {dayjs(item.project_created_at).format("DD.MM.YYYY HH:mm")}
                  </Text>
                  <Text
                    variant="bodyMedium"
                    style={{
                      fontStyle: "italic",
                    }}
                  >
                    Tags: {item.project_tags}
                  </Text>
                </View>
                <Button
                  mode="outlined"
                  style={{ marginRight: 10 }}
                  onPress={() => {
                    confirm({
                      title: "Clone project",
                      icon: "content-copy",
                      okText: "Clone",
                      okAction: (vars) => {
                        save(item.project_id, vars[0]);
                      },
                      fields: [
                        {
                          label: "New project name",
                          type: "text",
                          required: true,
                          errorText:
                            "Cannot clone this project without a new name",
                        },
                      ],
                    });
                  }}
                >
                  Clone
                </Button>
                <Button
                  mode="contained"
                  onPress={() =>
                    confirm({
                      icon: "play",
                      title: "Create Room",
                      okText: "Create",
                      okAction: async (params) => {
                        const { data, error } = await supabase.rpc(
                          "create_room",
                          {
                            p_project_id: item.project_id,
                            p_name: params[0] ?? null,
                            p_code: parseInt(params[1]) ?? null,
                            p_share_code: parseInt(params[2]) ?? null,
                            p_private: !!params[3],
                            p_size: parseInt(params[4]) ?? null,
                          },
                        );
                        if (error) return error.message;
                        setProjectId(item.project_id);
                        setRoom(data as any);
                        navigation.navigate(NAVIGATION.LOBBY as never);
                      },
                      fields: [
                        {
                          label: "Name",
                          icon: "tag-text",
                          defaultValue: item.project_name,
                        },
                        {
                          label: "Password",
                          type: "number",
                          icon: "key",
                          helperText: "A password required to join. Optional.",
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
                          label: "Size (1-1000)",
                          type: "number",
                          helperText:
                            "The maximum amount of players in this room.",
                          icon: "account-group",
                          defaultValue: "10",
                          validator: (value) => +value >= 1 && +value <= 1000,
                          errorText: "Size must be between 1 and 1000",
                        },
                      ],
                    })
                  }
                >
                  Play
                </Button>
              </View>
            </View>
          )}
        </Card.Content>
      </Card>
    </TouchableOpacity>
  );
}
