import { useState } from "react";
import { View } from "react-native";
import { Button, Card, Icon, Text, useTheme } from "react-native-paper";
import { useAlerts } from "react-native-paper-fastalerts";

export default function ProjectCard(props: {
  item: any;
  save: (item, vars) => void;
}) {
  const theme = useTheme();
  const { confirm } = useAlerts();
  const { item, save } = props;
  const [cardVisibility, setCardVisibility] = useState<boolean>(false);

  const toggleCardVisibility = () => {
    setCardVisibility(!cardVisibility);
  };
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
    <Card
      style={{ margin: 3, marginBottom: 10 }}
      onPress={() => toggleCardVisibility()}
    >
      <Card.Title title={item.name} titleVariant="titleLarge" />

      <Card.Content style={{ gap: 5 }}>
        {cardVisibility && (
          <>
            {stats.map((stat, index) => {
              return (
                <View style={{ flexDirection: "row" }} key={index}>
                  <Text variant="bodyMedium">{stat.title}: </Text>
                  <Text variant="bodyMedium" style={{ fontWeight: "bold" }}>
                    {stat.data}
                  </Text>
                  {stat.icon && stat.icon}
                </View>
              );
            })}
            <Text variant="bodyMedium" style={{ fontStyle: "italic" }}>
              Tags: {item.tags}
            </Text>

            <View
              style={{
                flexDirection: "row",
                justifyContent: "flex-end",
              }}
            >
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
          </>
        )}
      </Card.Content>
    </Card>
  );
}
