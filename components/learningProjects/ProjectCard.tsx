import { useState } from "react";
import { View } from "react-native";
import { Button, Card, Icon, Text, useTheme } from "react-native-paper";
import { useAlerts } from "react-native-paper-fastalerts";
import LearningProjectAvatarWithTitle from "../learningProject/LearningProjectAvatarWithTitle";

export default function ProjectCard(props: {
  item: any;
  save: (item, vars) => void;
}) {
  const theme = useTheme();
  const { confirm } = useAlerts();
  const { item, save } = props;
  const stats = [
    { title: "Description", data: item.description },
    { title: "Owner", data: item.username },
    { title: "Created in", data: item.created_at.substring(0, 4) },
    {
      title: "Rating",
      data: item.avg_rating.toFixed(2) + " ",
      icon: <Icon source="star" size={20} color="#ffb300" />,
    },
  ];
  return (
    <Card style={{ margin: 3, marginBottom: 10 }}>
      <Card.Content
        style={{ flexDirection: "row", flex: 1, alignItems: "center" }}
      >
        <LearningProjectAvatarWithTitle projectName={item.name} />
        <View
          style={{ flexDirection: "column", marginLeft: 30, flex: 1, gap: 5 }}
        >
          {stats.map((stat, index) => {
            return (
              <View style={{ flexDirection: "row", flex: 1 }} key={index}>
                <Text variant="bodyMedium">{stat.title}: </Text>
                <Text
                  variant="bodyMedium"
                  style={{ fontWeight: "bold", flexShrink: 1 }}
                >
                  {stat.data}
                </Text>
                {stat.icon && stat.icon}
              </View>
            );
          })}
          <Text variant="bodyMedium" style={{ fontStyle: "italic" }}>
            Tags: {item.tags}
          </Text>
        </View>
      </Card.Content>
      <Card.Actions style={{ justifyContent: "flex-end" }}>
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
                  errorText: "Cannot clone this project without a new name",
                },
              ],
            });
          }}
        >
          Clone
        </Button>
      </Card.Actions>
    </Card>
  );
}
