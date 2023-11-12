import * as React from 'react';
import { useState } from 'react';
import { Card, IconButton, Text, Menu, Divider } from 'react-native-paper';
import { Share, Image, StyleSheet, Linking, TouchableOpacity } from 'react-native';
import { responsiveWidth, responsiveHeight } from 'react-native-responsive-dimensions';

export default function VideoLinkCards({ videos, onDelete, onEdit }) {
  const [expandedId, setExpandedId] = useState(null);
  const [menuVisible, setMenuVisible] = useState(false);

  const getIconForVideo = (videoURL) => {
    const youtubePatterns = ['youtube.com', 'youtu.be'];
    const youtubeIcon = 'https://www.iconpacks.net/icons/2/free-youtube-logo-icon-2431-thumb.png';
    const defaultIcon = 'https://support.discord.com/hc/user_images/yVOeDzOpxgO8ODSf9bDQ-g.png';

    const isYouTubeURL = youtubePatterns.some(pattern => videoURL.includes(pattern));
    return isYouTubeURL ? youtubeIcon : defaultIcon;
  };

  const openVideo = (url) => {
    if (!url) {
      console.error("URL is not provided for video.");
      return;
    }

    Linking.canOpenURL(url).then(supported => {
      if (supported) {
        Linking.openURL(url);
      } else {
        console.error("Cannot open URL: ", url);
      }
    }).catch(err => {
      console.error("Error in opening URL: ", err);
    });
  };
  const onShare = async (videoTitle) => {
    try {
      await Share.share({
        message: `Check this out: ${videoTitle}`,
      });
    } catch (error) {
      alert(error.message);
    }
  };

  return videos.map((video) => (
    <Card
      elevation={1}
      style={styles.cardStyle}
      key={video.id}
      onPress={() => openVideo(video.videoURL)}
      accessible
      accessibilityLabel={`Video titled ${video.title}`}
    >
      <Card.Title
        title={video.title}
        subtitle={video.subtitle}
        left={() => (
          <TouchableOpacity onPress={() => openVideo(video.videoURL)}>
            <Image source={{ uri: getIconForVideo(video.videoURL) }} style={styles.iconStyle} />
          </TouchableOpacity>
        )}
        right={() => (
          <>
            <IconButton icon="share" onPress={() => onShare(video.title)} />
            <Menu
              visible={menuVisible === video.id}
              onDismiss={() => setMenuVisible(false)}
              anchor={<IconButton icon="dots-vertical" onPress={() => setMenuVisible(video.id)} />}>
              <Menu.Item onPress={() => { onDelete(video.id); setMenuVisible(false); }} title="Delete" />
              <Divider />
              <Menu.Item onPress={() => { onEdit(video); setMenuVisible(false); }} title="Edit" />
            </Menu>
          </>
        )}
      />
      {expandedId === video.id && (
        <Card.Content>
          <Text>{typeof video.description === 'string' ? video.description : 'Invalid description'}</Text>
        </Card.Content>
      )}
      <IconButton icon={expandedId === video.id ? 'chevron-up' : 'chevron-down'} onPress={() => setExpandedId(expandedId === video.id ? null : video.id)} />
    </Card>
  ));
}

const styles = StyleSheet.create({
  cardStyle: {
    flex: 1,
    width: responsiveWidth(90),
    marginBottom: responsiveHeight(2),
  },
  thumbnailStyle: {
    width: 50,
    height: 50,
    borderRadius: 25,
  },
  iconStyle: {
    width: 30,
    height: 30,
    marginRight: 10,
  },
});
