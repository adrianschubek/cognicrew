import * as React from "react";
import { View, ScrollView, StyleSheet, StatusBar } from "react-native";
import {
  responsiveHeight,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import TextWithPlusButton from "../../components/common/TextWithPlusButton";
import VideoLinkCards from "../../components/learningProject/VideoLinkCards";
import AddVideoLink from "../../components/dialogues/AddVideoLink";
import { useLinks } from "../../utils/hooks";
import { useEffect, useState } from "react";
import { useProjectStore } from "../../stores/ProjectStore";

export default function LinkManagement() {
  const [showVideoLinkDialog, setShowVideoLinkDialog] = useState(false);
  const [editingVideo, setEditingVideo] = useState(null);

  const projectId = useProjectStore((state) => state.projectId);
  const { data, isLoading, error } = useLinks(projectId);

  useEffect(() => {
    if (!data) return;
    setLinkItems(data);
  }, [data]);

  const [linkItems, setLinkItems] = useState([]);
  const handleEditVideo = (video) => {
    setEditingVideo(video);
    setShowVideoLinkDialog(true);
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
        <VideoLinkCards videos={linkItems} onEdit={handleEditVideo} />
      </ScrollView>
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
  upperContainer: {
    flex: 0,
    width: responsiveWidth(100),
    flexDirection: "row",
    justifyContent: "flex-end",
  },
});
