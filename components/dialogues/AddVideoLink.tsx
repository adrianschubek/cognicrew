import * as React from "react";
import { Keyboard, StyleSheet } from "react-native";
import { Dialog, Button, TextInput, Portal } from "react-native-paper";
import {
  responsiveWidth,
  responsiveHeight,
} from "react-native-responsive-dimensions";
import { useUpsertLink } from "../../utils/hooks";
import { useProjectStore } from "../../stores/ProjectStore";
import { useEffect, useState } from "react";

export default function AddVideoLink({ video, showVideoLinkDialog, close }) {
  const [title, setTitle] = useState(video?.title || "");
  const [subtitle, setSubtitle] = useState(video?.subtitle || "");
  const [description, setDescription] = useState(video?.description || "");
  const [videoURL, setVideoURL] = useState<string>(video?.link_url || "");
  const projectId = useProjectStore((state) => state.projectId);
  const { isMutating, trigger: upsertLink } = useUpsertLink();
  const ensuredHttpURL = videoURL.match(/^(https?:\/\/)/) ? videoURL : `http://${videoURL}`;
  const addOrEdit = () => {
    upsertLink({
      // @ts-expect-error
      learning_project: projectId,
      id: video?.id,
      title: title,
      subtitle: subtitle,
      description: description,
      link_url: ensuredHttpURL,
    });
    close();
    setTitle("");
    setSubtitle("");
    setDescription("");
    setVideoURL("");
    close();
    Keyboard.dismiss();
  };
  useEffect(() => {
    if (video) {
      setTitle(video.title);
      setSubtitle(video.subtitle);
      setDescription(video.description);
      setVideoURL(video.link_url);
    } else {
      setTitle("");
      setSubtitle("");
      setDescription("");
      setVideoURL("");
    }
  }, [video]);

  return (
    <Portal>
      <Dialog
        style={{ alignItems: "center" }}
        visible={showVideoLinkDialog}
        onDismiss={() => {
          close();
          Keyboard.dismiss();
        }}
      >
        <TextInput
          style={styles.textInputStyle}
          label="Title:"
          value={title}
          onChangeText={setTitle}
          //multiline={true}
          blurOnSubmit={true}
        />
        <TextInput
          style={styles.textInputStyle}
          label="Subtitle:"
          value={subtitle}
          onChangeText={setSubtitle}
          //multiline={true}
          blurOnSubmit={true}
        />
        <TextInput
          style={styles.textInputStyle}
          label="Description:"
          value={description}
          onChangeText={setDescription}
          //multiline={true}
          blurOnSubmit={true}
        />
        <TextInput
          style={styles.textInputStyle}
          label="URL:"
          value={videoURL}
          onChangeText={setVideoURL}
          //multiline={true}
          blurOnSubmit={true}
        />
        <Dialog.Actions>
          <Button
            style={{ width: responsiveWidth(70), marginTop: 10 }}
            onPress={() => {
              addOrEdit();
            }}
            mode="contained"
          >
            {video ? "Update Video" : "Add New Video"}
          </Button>
        </Dialog.Actions>
      </Dialog>
    </Portal>
  );
}

const styles = StyleSheet.create({
  textInputStyle: {
    marginBottom: responsiveHeight(1),
    width: responsiveWidth(70),
  },
});
