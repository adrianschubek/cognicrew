import { Fragment, useState } from "react";
import { TouchableOpacity, View } from "react-native";
import {
  Button,
  Card,
  Divider,
  Icon,
  Text,
  useTheme,
} from "react-native-paper";
import { useAlerts } from "react-native-paper-fastalerts";
import LearningProjectAvatarWithTitle from "../learningProject/LearningProjectAvatarWithTitle";

export default function ProjectCard(props: {
  item: any;
  save: (item, vars) => void;
}) {
  const theme = useTheme();
  const { confirm } = useAlerts();
  const { item, save } = props;
  const [expanded, setExpanded] = useState<boolean>(false);
  const hiddenInfo = [{ title: "Description", data: item.description }];
  const extraInfo = [
    {
      title: "Owner",
      data: item.username /*+ "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"*/,
    },
    { title: "Created in", data: item.created_at.substring(0, 4) },
  ];
  const ratingStats = {
    title: "Rating",
    data: item.avg_rating.toFixed(2),
    icon: <Icon source="star" size={30} color="#ffb300" />,
  };
  return (
    <TouchableOpacity
      onPress={() => {
        setExpanded(!expanded);
      }}
    >
      <Card style={{ margin: 3, marginBottom: 10 }}>
        <Card.Content style={{ flexDirection: "column", gap: 10 }}>
          <View
            style={{
              flexDirection: "row",
              flex: 1,
              alignItems: "center",
              justifyContent: "space-between",
            }}
          >
            <LearningProjectAvatarWithTitle
              projectName={
                item.name /*+ "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"*/
              }
              style={{ flexDirection: "row", alignItems: "center", flex: 1 }}
              textStyle={{
                marginTop: 0,
                marginLeft: 10,
                maxWidth: "65%",
                //backgroundColor: "red",
              }}
              textVariant="bodyLarge"
              textAlign="left"
              extraInfoTexts={extraInfo.map(
                (item) => item.title + ": " + item.data,
              )}
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
              {hiddenInfo.map((item, index) => {
                return (
                  <Text key={index} variant="bodyMedium">
                    {item.data}
                  </Text>
                );
              })}
              <View
                style={{
                  flexDirection: "row",
                  justifyContent: "space-between",
                  alignItems: "center",
                }}
              >
                <Text variant="bodyMedium" style={{ fontStyle: "italic" }}>
                  Tags: {item.tags}
                </Text>
                <Button
                  buttonColor={theme.colors.primary}
                  textColor={theme.colors.onPrimary}
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
              </View>
            </View>
          )}
        </Card.Content>
      </Card>
    </TouchableOpacity>
  );
}
