import * as React from "react";
import { useState } from "react";
import { Card, IconButton, Text, Menu, Divider } from "react-native-paper";
import {
  Share,
  Image,
  StyleSheet,
  Linking,
  TouchableOpacity,
  View,
} from "react-native";
import { responsiveWidth } from "react-native-responsive-dimensions";
import { useDeleteLink } from "../../../utils/hooks";

export default function LinkCard({ link, onEdit }) {
  const [expandedId, setExpandedId] = useState(null);
  const [menuVisible, setMenuVisible] = useState(false);

  const getIconForLink = (u) => {
    const url = new URL(u);
    const youtubePatterns = ["youtube.com", "youtu.be"];
    const youtubeIcon =
      "https://www.iconpacks.net/icons/2/free-youtube-logo-icon-2431-thumb.png";
    const defaultIcon = `https://www.google.com/s2/favicons?domain=${url.hostname}`;
    const isYouTubeURL = youtubePatterns.some((pattern) =>
      u.toLowerCase().includes(pattern),
    );
    return isYouTubeURL ? youtubeIcon : defaultIcon;
  };

  const { isMutating, trigger: deleteLink } = useDeleteLink();
  
  const openLink = (url) => {
    if (!url) {
      console.error("URL is not provided for link.");
      return;
    }
    Linking.canOpenURL(url)
      .then((supported) => {
        if (supported) {
          Linking.openURL(url);
        } else {
          console.error("Cannot open URL: ", url);
        }
      })
      .catch((err) => {
        console.error("Error in opening URL: ", err);
      });
  };
  const onShare = async (link) => {
    try {
      const message = `Check this out: ${link.title}\n${link.link_url}`;
      await Share.share({
        message: message,
      });
    } catch (error) {
      alert(error.message);
    }
  };

  return (
    <Card
      testID="link-card"
      elevation={1}
      style={{ flex: 1, width: responsiveWidth(90), marginBottom: 16 }}
      key={link.id}
      onPress={() => openLink(link.link_url)}
      accessible
      accessibilityLabel={`Link titled ${link.title}`}
    >
      <Card.Title
        titleStyle={{
          marginTop: 0,
          marginBottom: link.subtitle !== "" ? 16 : 36,
        }}
        title={link.title}
        subtitle={link.subtitle}
        left={() => (
          <View
            style={{
              alignItems: "center",
              marginRight: 10,
              justifyContent: "center",
              marginTop: 8,
            }}
          >
            <TouchableOpacity
              style={{ width: 30, height: 30 }}
              onPress={() => openLink(link.link_url)}
            >
              <Image
                source={{ uri: getIconForLink(link.link_url) }}
                width={30}
                height={30}
              />
            </TouchableOpacity>
            <IconButton
              testID="chevron-button"
              style={{ margin: 0, padding: 0, marginTop: 8 }}
              icon={expandedId === link.id ? "chevron-up" : "chevron-down"}
              onPress={() =>
                setExpandedId(expandedId === link.id ? null : link.id)
              }
            />
          </View>
        )}
        right={() => (
          <View
            style={{
              flexDirection: "column",
              alignItems: "center",
              marginTop: 8,
            }}
          >
            <IconButton
              testID="share-link-button"
              style={{ margin: 0, padding: 0 }}
              icon="share"
              onPress={() => onShare(link)}
            />
            <Menu
              style={{ margin: 0, padding: 0 }}
              visible={menuVisible === link.id}
              onDismiss={() => setMenuVisible(false)}
              anchor={
                <IconButton
                  testID="vertical-dots-button"
                  icon="dots-vertical"
                  onPress={() => setMenuVisible(link.id)}
                />
              }
            >
              <Menu.Item
                testID="delete-link-button"
                onPress={() => {
                  deleteLink({ id: link.id });
                  setMenuVisible(false);
                }}
                title="Delete"
              />
              <Divider />
              <Menu.Item
                testID="edit-link-button"
                onPress={() => {
                  onEdit(link);
                  setMenuVisible(false);
                }}
                title="Edit"
              />
            </Menu>
          </View>
        )}
      />
      {expandedId === link.id && (
        <Card.Content>
          <Text style={{ marginLeft: 10 }}>
            {link.description
              ? typeof link.description === "string"
                ? link.description
                : "Invalid description"
              : "No description"}
          </Text>
        </Card.Content>
      )}
    </Card>
  );
}
