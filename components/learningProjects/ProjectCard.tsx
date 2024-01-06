import { useState } from "react";
import { TouchableOpacity, View } from "react-native";
import { Button, Card, Icon, Text, useTheme } from "react-native-paper";
import { useAlerts } from "react-native-paper-fastalerts";
import LearningProjectAvatarWithTitle from "../learningProject/LearningProjectAvatarWithTitle";
import { supabase } from "../../supabase";
import { useNavigation } from "@react-navigation/native";
import { NAVIGATION } from "../../types/common";
import { useRoomStore } from "../../stores/RoomStore";

export default function ProjectCard(props: {
  item: any;
  save: (item, vars) => void;
}) {
  const theme = useTheme();
  const navigation = useNavigation();
  const { confirm } = useAlerts();
  const setRoom = useRoomStore((state) => state.setRoom);
  const { item, save } = props;
  const [expanded, setExpanded] = useState<boolean>(false);
  const hiddenInfo = [{ title: "Description", data: item.project_description }];
  const extraInfo = [
    {
      title: "Owner",
      data: item.project_owner_name /*+ "xxxxxxxx"*/,
    },
    { title: "Created in", data: item.project_created_at.substring(0, 4) },
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
                return item.title + ": " + item.data;
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
                  flexDirection: "row",
                  // justifyContent: "space-between",
                  // alignItems: "center",
                }}
              >
                <Text
                  variant="bodyMedium"
                  style={{ fontStyle: "italic", marginRight: "auto" }}
                >
                  Tags: {item.project_tags}
                  {/*maybe return tags as string[], so this look nicer */}
                </Text>
                <Button
                  mode="outlined"
                  style={{ marginRight: 10 }}
                  onPress={() => {
                    confirm({
                      title: "Clone project",
                      icon: "content-copy",
                      okText: "Clone",
                      okAction: (vars) => {
                        save(item, vars[0]);
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
                            p_project_id: parseInt(item.project_id),
                            p_name: params[0] ?? null,
                            p_code: parseInt(params[1]) ?? null,
                            p_share_code: parseInt(params[2]) ?? null,
                            p_private: !!params[3],
                            p_size: parseInt(params[4]) ?? null,
                          },
                        );
                        navigation.navigate(NAVIGATION.LOBBY as never);
                        if (error) return error.message;
                        setRoom(data as any);
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
                          label: "Size (1-100)",
                          type: "number",
                          helperText:
                            "The maximum amount of players in this room.",
                          icon: "account-group",
                          defaultValue: "10",
                          validator: (value) =>
                            /^[1-9][0-9]?$|^100$/.test(value),
                          errorText: "Size must be between 1 and 100",
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
