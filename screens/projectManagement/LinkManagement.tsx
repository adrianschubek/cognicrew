import * as React from 'react';
import { View, ScrollView, StyleSheet, StatusBar } from 'react-native';
import { responsiveHeight, responsiveWidth } from 'react-native-responsive-dimensions';
import TextWithPlusButton from '../../components/common/TextWithPlusButton';
import VideoLinkCards from '../../components/learningProject/VideoLinkCards';
import AddVideoLink from '../../components/dialogues/AddVideoLink';

export default function LinkManagement() {
  const [videos, setVideos] = React.useState([
    {
      title: 'Video über Bären',
      subtitle: 'Dies ist ein Video',
      description: 'Detailed description of the video here...',
      id: 1,
      videoURL: 'https://www.youtube.com/watch?v=17cRUUKcVOo',
    },
  ]);
  const [showVideoLinkDialog, setShowVideoLinkDialog] = React.useState(false);
  const [editingVideo, setEditingVideo] = React.useState(null);

  const handleAddOrEditVideo = (videoData) => {
    if (editingVideo) {
      setVideos(videos.map(video => video.id === editingVideo.id ? { ...videoData, id: video.id } : video));
    } else {
      setVideos([...videos, { ...videoData, id: videos.length + 1 }]);
    }
    console.log("Updated videos: ", videos);

    setEditingVideo(null);
    setShowVideoLinkDialog(false);
  };

  const handleEditVideo = (video) => {
    setEditingVideo(video);
    setShowVideoLinkDialog(true);
  };

  const handleDeleteVideo = (videoId) => {
    setVideos(videos.filter(video => video.id !== videoId));
  };

  return (
    <View style={styles.container}>
      <StatusBar />
      <AddVideoLink
        video={editingVideo}
        showVideoLinkDialog={showVideoLinkDialog}
        close={() => {
          setShowVideoLinkDialog(false);
          setEditingVideo(null);
        }}
        onSubmit={handleAddOrEditVideo}
      />
      <View style={styles.upperContainer}>
        <TextWithPlusButton
          text="add new link"
          function={() => {
            setEditingVideo(null);
            setShowVideoLinkDialog(true);
          }}
        />
      </View>
      <ScrollView>
        <VideoLinkCards videos={videos} onDelete={handleDeleteVideo} onEdit={handleEditVideo} />
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    width: responsiveWidth(100),
    height: responsiveHeight(100),
    flex: 1,
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'flex-start',
  },
  upperContainer: {
    flex: 0,
    width: responsiveWidth(100),
    flexDirection: 'row',
    justifyContent: 'flex-end',
  },
});