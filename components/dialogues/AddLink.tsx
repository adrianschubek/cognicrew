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

export default function AddLink({ link, showLinkDialog, close }) {
  const [title, setTitle] = useState(link?.title || "");
  const [subtitle, setSubtitle] = useState(link?.subtitle || "");
  const [description, setDescription] = useState(link?.description || "");
  const [URL, setURL] = useState<string>(link?.link_url || "");
  const projectId = useProjectStore((state) => state.projectId);
  const { isMutating, trigger: upsertLink } = useUpsertLink();
  const ensuredHttpURL = URL.match(/^(https?:\/\/)/) ? URL : `http://${URL}`;
  const addOrEdit = () => {
    upsertLink({
      // @ts-expect-error
      learning_project: projectId,
      id: link?.id,
      title: title,
      subtitle: subtitle,
      description: description,
      link_url: ensuredHttpURL,
    });
    close();
    setTitle("");
    setSubtitle("");
    setDescription("");
    setURL("");
    close();
    Keyboard.dismiss();
  };
  useEffect(() => {
    if (link) {
      setTitle(link.title);
      setSubtitle(link.subtitle);
      setDescription(link.description);
      setURL(link.link_url);
    } else {
      setTitle("");
      setSubtitle("");
      setDescription("");
      setURL("");
    }
  }, [link]);

  return (
    <Portal>
      <Dialog
        style={{ alignItems: "center" }}
        visible={showLinkDialog}
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
          value={URL}
          onChangeText={setURL}
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
            {link ? "Update Link" : "Add New Link"}
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
