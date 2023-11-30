/**
 * FilesManagement - Main component for managing files.
 * It handles file uploads, deletions, and categorizes files for display.
 */

import React, { useState, useEffect } from "react";
import {
  View,
  StyleSheet,
  VirtualizedList,
  TouchableOpacity,
  ScrollView,
} from "react-native";
import { Button, Dialog, Divider, FAB, Portal, Text } from "react-native-paper";
import TextWithPlusButton from "../../components/common/TextWithPlusButton";
import FileCategory from "../../components/learningProject/FileCategory";
import UploadFileDialog from "../../components/dialogues/UploadFile";
import { useSoundSystem1 } from "../../utils/hooks";
import { Ionicons } from "@expo/vector-icons";
import * as ImagePicker from "expo-image-picker";
import * as FileSystem from "expo-file-system";
import { decode } from "base64-arraybuffer";
import { FileObject } from "@supabase/storage-js";
import { supabase } from "../../supabase";
import { useAuth } from "../../providers/AuthProvider";
import ImageItem from "../../components/common/ImageItem";

export default function FilesManagement() {
  const { user } = useAuth();
  const [photos, setPhotos] = useState<FileObject[]>([]);

  useEffect(() => {
    if (!user) return;

    // Load user images
    loadImages();
  }, [user]);

  const loadImages = async () => {
    const { data } = await supabase.storage.from("files").list(user!.id);
    if (data) {
      setPhotos(data);
    }
  };

  const onRemoveImage = async (item: FileObject, listIndex: number) => {
    supabase.storage.from("files").remove([`${user!.id}/${item.name}`]);
    const newFiles = [...photos];
    newFiles.splice(listIndex, 1);
    setPhotos(newFiles);
  };

  const onSelectImage = async () => {
    const options: ImagePicker.ImagePickerOptions = {
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      allowsEditing: true,
    };

    const result = await ImagePicker.launchImageLibraryAsync(options);
    if (!result.canceled) {
      const img = result.assets[0];
      const base64 = await FileSystem.readAsStringAsync(img.uri, {
        encoding: "base64",
      });
      const filePath = `${user.id}/${new Date().getTime()}.${
        img.type === "image" ? "png" : "mp4"
      }`;
      const contentType = img.type === "image" ? "image/png" : "video/mp4";
      await supabase.storage
        .from("files")
        .upload(filePath, decode(base64), { contentType });
      await loadImages();
    }
  };

  useSoundSystem1();

  const [visible, setVisible] = useState(false);

  const [files, setFiles] = useState([
    { id: "1", name: "File1.pdf", extension: ".pdf" },
    { id: "2", name: "Dummy1.docx", extension: ".docx" },
    { id: "3", name: "Dummy.xlsx", extension: ".xlsx" },
    { id: "4", name: "Misc.txt", extension: ".txt" },
  ]);

  const [selectedFile, setSelectedFile] = useState(null);

  /**
   * confirmDelete - Opens a dialog to confirm deletion of a file.
   * @param {string} fileId - The ID of the file to potentially delete.
   */

  const confirmDelete = (fileId) => {
    setSelectedFile(fileId);
    setVisible(true);
  };

  const [uploadDialogVisible, setUploadDialogVisible] = useState(false);

  /**
   * handleUpload - Handles the uploading of a new file.
   * @param {object} newFile - The new file object to be uploaded.
   */

  // not really working as of now
  const handleUpload = (newFile) => {
    setFiles([...files, { ...newFile, id: Date.now().toString() }]);
  };

  /**
   * categorizeFiles - Categorizes files based on their extension.
   * @param {string} extension - The file extension to filter by.
   * @returns {array} - Array of files that match the given extension.
   */
  const categorizeFiles = (extension) => {
    return files.filter((file) => file.extension === extension);
  };

  const dontCategorize = () => {

  };

  /**
   * handleDelete - Handles the deletion of the selected file.
   */
  const handleDelete = () => {
    if (selectedFile) {
      setFiles(files.filter((file) => file.id !== selectedFile));
      setSelectedFile(null);
      setVisible(false);
    }
  };
  return (
    <View style={styles.container}>
      <View style={styles.upperContainer}>
        <TextWithPlusButton
          text="Upload File"
          onPress={() => setUploadDialogVisible(true)}
        />
      </View>

      <VirtualizedList
        renderItem={() => null}
        getItemCount={() => 0}
        ListHeaderComponent={() => {
          return (
            <View style={styles.scrollView}>
              <FileCategory
                title="PDF Documents (.pdf)"
                files={categorizeFiles(".pdf")}
                onDelete={confirmDelete}
              />
              <Divider style={styles.divider} />
              <FileCategory
                title="Word Documents (.docx)"
                files={categorizeFiles(".docx")}
                onDelete={confirmDelete}
              />
              <Divider style={styles.divider} />
              <FileCategory
                title="Excel (.xlsx)"
                files={categorizeFiles(".xlsx")}
                onDelete={confirmDelete}
              />
              <Divider style={styles.divider} />
              <FileCategory
                title="Miscellaneous"
                files={categorizeFiles(".txt")}
                onDelete={confirmDelete}
              />
              <Divider style={styles.divider} />

              <FileCategory
                title="Photos"
                files={dontCategorize()}
                onDelete={confirmDelete}
              />
              <ScrollView>
                {photos.map((item, index) => (
                  <ImageItem
                    key={item.id}
                    item={item}
                    userId={user!.id}
                    onRemoveImage={() => onRemoveImage(item, index)}
                  />
                ))}
              </ScrollView>
              
            </View>
          );
        }}
      ></VirtualizedList>

      <FAB
        style={styles.fab}
        small
        icon="plus"
        onPress={() => setUploadDialogVisible(true)}
      />
      <FAB style={styles.fab2} small icon="camera" onPress={onSelectImage} />
      <UploadFileDialog
        visible={uploadDialogVisible}
        onDismiss={() => setUploadDialogVisible(false)}
        onSubmit={handleUpload}
      />
      {/* Delete confirmation dialog */}
      <Portal>
        <Dialog visible={visible} onDismiss={() => setVisible(false)}>
          <Dialog.Title>Delete Confirmation</Dialog.Title>
          <Dialog.Content>
            <Text>Are you sure you want to remove this file?</Text>
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={() => setVisible(false)}>Cancel</Button>
            <Button onPress={handleDelete}>Delete</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
    </View>
  );
}
const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: 20,
  },
  upperContainer: {
    flexDirection: "row",
    justifyContent: "flex-end",
    paddingRight: 10,
  },
  scrollView: {
    paddingHorizontal: 8,
  },
  divider: {
    marginHorizontal: 8,
  },
  fab: {
    position: "absolute",
    margin: 16,
    right: 0,
    bottom: 0,
  },
  fab2: {
    position: "absolute",
    margin: 16,
    right: 70,
    bottom: 0,
  },
});
