import * as React from 'react';
import { View, Keyboard, StyleSheet } from 'react-native';
import { Dialog, Button, TextInput, Portal } from 'react-native-paper';
import { responsiveWidth, responsiveHeight } from 'react-native-responsive-dimensions';
import { useUpsertLink } from '../../utils/hooks';
import { useProjectStore } from '../../stores/ProjectStore';

export default function AddVideoLink({ video, showVideoLinkDialog, close, onSubmit }) {
  const [title, setTitle] = React.useState(video?.title || '');
  const [subtitle, setSubtitle] = React.useState(video?.subtitle || '');
  const [description, setDescription] = React.useState(video?.description || '');
  const [videoURL, setVideoURL] = React.useState(video?.link_url || '');

  const projectId = useProjectStore((state) => state.projectId);

  const { isMutating, trigger: upsertLink } = useUpsertLink();
  const addOrEdit = () => {
    upsertLink({
      // @ts-expect-error
      learning_project: projectId, title: title, subtitle: subtitle, description: description, link_url: videoURL
    });
    close();
  }

  const handleSubmit = () => {



    setTitle('');
    setSubtitle('');
    setDescription('');
    setVideoURL('');
    close();
    Keyboard.dismiss();
  };

  React.useEffect(() => {
    if (video) {
      setTitle(video.title);
      setSubtitle(video.subtitle);
      setDescription(video.description);
      setVideoURL(video.link_url);
    } else {
      setTitle('');
      setSubtitle('');
      setDescription('');
      setVideoURL('');
    }
  }, [video]);

  return (
    <Portal>
      <Dialog
        style={{ alignItems: 'center' }}
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
        />
        <TextInput
          style={styles.textInputStyle}
          label="Subtitle:"
          value={subtitle}
          onChangeText={setSubtitle}
        />
        <TextInput
          style={styles.textInputStyle}
          label="Description:"
          value={description}
          onChangeText={setDescription}
        />
        <TextInput
          style={styles.textInputStyle}
          label="URL:"
          value={videoURL}
          onChangeText={setVideoURL}
        />
        <Dialog.Actions>
          <Button
            style={{ width: responsiveWidth(70) }}
            onPress={() => {addOrEdit()}}
            mode="contained"
          >
            {video ? 'Update Video' : 'Add New Video'}
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