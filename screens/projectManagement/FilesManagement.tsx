/**
 * FilesManagement - Main component for managing files.
 * It handles file uploads, deletions, and categorizes files for display.
 */

import React, { useState, useEffect, Fragment } from "react";
import { View, StyleSheet, VirtualizedList, ScrollView } from "react-native";
import {
  Button,
  Dialog,
  Divider,
  FAB,
  List,
  Portal,
  Text,
} from "react-native-paper";
import FileCategory from "../../components/learningProject/FileCategory";
import { FileObject } from "@supabase/storage-js";
import { supabase } from "../../supabase";
import ImageItem from "../../components/common/ImageItem";
import { useProjectStore } from "../../stores/ProjectStore";
import {
  selectAndUploadFile,
  selectAndUploadImage,
} from "../../utils/FileFunctions";
import { useFiles } from "../../utils/hooks";
import LoadingOverlay from "../../components/alerts/LoadingOverlay";

export default function FilesManagement() {
  const [photos, setPhotos] = useState<FileObject[]>([]);
  const projectId = useProjectStore((state) => state.projectId);
  const {
    data: photoData,
    error: photoError,
    isLoading: photosLoading,
    mutate: mutatePhotos,
  } = useFiles(`${projectId}/photos`);
  const {
    data: fileData,
    error: fileError,
    isLoading: filesLoading,
    mutate: mutateFiles,
  } = useFiles(`${projectId}/documents`);

  const onSelectImage = async () => {
    const filePath = `${projectId}/photos`;
    await selectAndUploadImage(filePath);
    mutatePhotos();
  };

  useEffect(() => {
    if (!photoData) return;
    setPhotos(photoData.data);
  }, [photoData]);

  useEffect(() => {
    if (!fileData) return;
    const filesWithExtension = fileData.data.map((file) => {
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
  }, [fileData]);

  useEffect(() => {
    const realtimeFiles = supabase
      .channel("files_all")
      .on(
        "postgres_changes",
        { event: "*", schema: "storage", table: "objects" },
        (payload) => {
          mutateFiles();
          mutatePhotos();
        },
      )
      .subscribe();
  }, []);

  const onSelectDocument = async () => {
    (await selectAndUploadFile(`${projectId}`, true)).isImage
      ? mutatePhotos()
      : mutateFiles();
  };

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
    { title: "Photos", files: photos, folder: "photos" },
  ];
  if (photosLoading || filesLoading)
    return <LoadingOverlay visible={photosLoading || filesLoading} />;
  return (
    <View style={styles.container}>
      <VirtualizedList
        renderItem={() => null}
        getItemCount={() => 0}
        ListHeaderComponent={() => {
          return (
            <View>
              <List.Section>
                {categories.map((category, index) => {
                  let folder = category.folder ? category.folder : "documents";
                  return (
                    <Fragment key={index}>
                      <FileCategory
                        title={category.title}
                        files={category.files.map(
                          (file) => ({
                            ...file,
                            fullPath: `${projectId}/${folder}/${file.name}`,
                          }),
                        )}
                        onDelete={confirmDelete}
                      />
                      <Divider style={{ marginHorizontal: 8 }} />
                    </Fragment>
                  );
                })}
              </List.Section>
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
