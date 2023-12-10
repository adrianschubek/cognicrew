/**
 * FilesManagement - Main component for managing files.
 * It handles file uploads, deletions, and categorizes files for display.
 */

import React, { useState, useEffect, Fragment } from "react";
import { View, StyleSheet, VirtualizedList, ScrollView } from "react-native";
import { Button, Dialog, Divider, FAB, Portal, Text } from "react-native-paper";
import FileCategory from "../../components/learningProject/FileCategory";
import { useSoundSystem1 } from "../../utils/hooks";
import * as ImagePicker from "expo-image-picker";
import * as FileSystem from "expo-file-system";
import { decode } from "base64-arraybuffer";
import { FileObject } from "@supabase/storage-js";
import { supabase } from "../../supabase";
import ImageItem from "../../components/common/ImageItem";
import * as DocumentPicker from "expo-document-picker";
import { useProjectStore } from "../../stores/ProjectStore";

export default function FilesManagement() {
  const [photos, setPhotos] = useState<FileObject[]>([]);
  const projectId = useProjectStore((state) => state.projectId);
  // obsolete for now
  const onRemoveImage = async (item: FileObject, listIndex: number) => {
    supabase.storage.from("files").remove([`${projectId}/${item.name}`]);
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
      // Update the file path to include the 'photos' folder
      const filePath = `${projectId}/photos/${new Date().getTime()}.${
        img.type === "image" ? "png" : "mp4"
      }`;
      const contentType = img.type === "image" ? "image/png" : "video/mp4";
      await supabase.storage
        .from("files")
        .upload(filePath, decode(base64), { contentType });
      await loadImages();
    }
  };

  // Loads only image files from the 'photos' directory
  const loadImages = async () => {
    const { data, error } = await supabase.storage
      .from("files")
      .list(`${projectId}/photos`, {
        limit: 100,
        offset: 0,
      });

    if (error) {
      console.error("Error loading images:", error.message);
    } else if (data) {
      // Assuming that all files in the 'photos' directory are images
      setPhotos(data);
    }
  };

  // Loads files within the "documents" directory
  const loadFiles = async () => {
    const { data, error } = await supabase.storage
      .from("files")
      .list(`${projectId}/documents`, {
        limit: 100,
        offset: 0,
      });

    if (error) {
      console.error("Error loading files:", error.message);
    } else if (data) {
      const filesWithExtension = data.map((file) => {
        const extension = file.name.split(".").pop().toLowerCase();
        return { ...file, extension };
      });

      const categorizedFiles = filesWithExtension.reduce(
        (acc, file) => {
          if (file.extension === "pdf") {
            acc.pdf.push(file);
          } else if (file.extension === "docx") {
            acc.docx.push(file);
          } else if (file.extension === "xlsx") {
            acc.xlsx.push(file);
          } else {
            acc.misc.push(file);
          }
          return acc;
        },
        { pdf: [], docx: [], xlsx: [], misc: [] },
      );

      setFiles(categorizedFiles);
    }
  };

  useEffect(() => {
    loadImages();
    loadFiles();
  }, []);

  const onSelectDocument = async () => {
    let result;
    try {
      result = await DocumentPicker.getDocumentAsync({
        type: "*/*", // Allow all file types
        copyToCacheDirectory: true,
      });
    } catch (error) {
      console.error("Error picking a document:", error);
      return;
    }
    if (result?.assets && result?.assets[0]) {
      const pickedFile = result.assets[0];
      const uri = pickedFile.uri;
      const mimeType = pickedFile.mimeType || "application/octet-stream";

      const isImage = mimeType.startsWith("image");
      let fileExtension = mimeType.split("/").pop();
      const folderPath = isImage ? "photos" : "documents";
      const newFileName = `${new Date().getTime()}.${fileExtension}`;
      const filePath = `${projectId}/${folderPath}/${newFileName}`;

      const base64 = await FileSystem.readAsStringAsync(uri, {
        encoding: FileSystem?.EncodingType?.Base64,
      });

      const { error } = await supabase.storage
        .from("files")
        .upload(filePath, decode(base64), {
          contentType: mimeType,
        });

      if (error) {
        console.error("Error uploading file:", error.message);
      } else {
        console.log("File uploaded successfully:", filePath);
        // Refresh the lists
        if (isImage) {
          await loadImages();
        } else {
          await loadFiles();
        }
      }
    }
  };

  useSoundSystem1();

  const [visible, setVisible] = useState(false);

  const [files, setFiles] = useState({
    pdf: [],
    docx: [],
    xlsx: [],
    misc: [],
  });
  const [selectedFile, setSelectedFile] = useState(null);

  /**
   * confirmDelete - Opens a dialog to confirm deletion of a file.
   * @param {string} fileId - The ID of the file to potentially delete.
   */

  const confirmDelete = (fileWithPath) => {
    console.log("Selected for deletion:", fileWithPath);

    setSelectedFile(fileWithPath); // Store the full path along with the file object
    setVisible(true); // Show the confirmation dialog
  };

  const onDeleteConfirmed = async () => {
    console.log("Attempting to delete:", selectedFile);

    if (!selectedFile) return;

    const { error } = await supabase.storage
      .from("files")
      .remove([selectedFile.fullPath]);

    if (error) {
      console.error("Error deleting file:", error.message);
    } else {
      // Update state to remove the file from the list
      if (selectedFile.fullPath.includes("/photos/")) {
        setPhotos(
          photos.filter(
            (photo) =>
              `${projectId}/photos/${photo.name}` !== selectedFile.fullPath,
          ),
        );
      } else {
        setFiles((prevFiles) => {
          return {
            pdf: prevFiles.pdf.filter(
              (file) =>
                `${projectId}/documents/${file.name}` !== selectedFile.fullPath,
            ),
            docx: prevFiles.docx.filter(
              (file) =>
                `${projectId}/documents/${file.name}` !== selectedFile.fullPath,
            ),
            xlsx: prevFiles.xlsx.filter(
              (file) =>
                `${projectId}/documents/${file.name}` !== selectedFile.fullPath,
            ),
            misc: prevFiles.misc.filter(
              (file) =>
                `${projectId}/documents/${file.name}` !== selectedFile.fullPath,
            ),
          };
        });
      }
      setVisible(false);
    }
  };
  const categories = [
    { title: "PDF Documents (.pdf)", files: files.pdf },
    { title: "Word Documents (.docx)", files: files.docx },
    { title: "Excel Documents (.xlsx)", files: files.xlsx },
    { title: "Miscellaneous", files: files.misc },
  ];
  return (
    <View style={styles.container}>
      <VirtualizedList
        renderItem={() => null}
        getItemCount={() => 0}
        ListHeaderComponent={() => {
          return (
            <View style={styles.scrollView}>
              {categories.map((category, index) => (
                <Fragment key={index}>
                  <FileCategory
                    title={category.title}
                    files={category.files.map((file) => ({
                      ...file,
                      fullPath: `${projectId}/documents/${file.name}`,
                    }))}
                    onDelete={confirmDelete}
                  />
                  <Divider style={{ marginHorizontal: 8 }} />
                </Fragment>
              ))}
              <FileCategory
                title="Photos"
                files={() => {}}
                onDelete={confirmDelete}
              />
              <ScrollView>
                {photos.map((item, index) => (
                  <ImageItem
                    key={item.id}
                    item={item}
                    projectId={projectId}
                    onRemoveImage={() =>
                      confirmDelete({
                        ...item,
                        fullPath: `${projectId}/photos/${item.name}`,
                      })
                    }
                  />
                ))}
              </ScrollView>
              {/*View margin for FAB.Group when scrolling down */}
              <View style={{ marginBottom: 86 }}></View>
            </View>
          );
        }}
      ></VirtualizedList>

      <FAB
        style={styles.fab}
        small
        icon="file-upload"
        onPress={onSelectDocument}
      />
      <FAB style={styles.fab2} small icon="camera" onPress={onSelectImage} />
      {/* Delete confirmation dialog */}
      <Portal>
        <Dialog visible={visible} onDismiss={() => setVisible(false)}>
          <Dialog.Title>Delete Confirmation</Dialog.Title>
          <Dialog.Content>
            <Text>Are you sure you want to remove this file?</Text>
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={() => setVisible(false)}>Cancel</Button>
            <Button onPress={onDeleteConfirmed}>Delete</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
    </View>
  );
}
const styles = StyleSheet.create({
  container: {
    marginTop: -8,
    flex: 1,
    paddingTop: 8,
  },
  scrollView: {
    paddingHorizontal: 8,
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
