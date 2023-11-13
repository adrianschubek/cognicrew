/**
 * FilesManagement - Main component for managing files.
 * It handles file uploads, deletions, and categorizes files for display.
 */

import React, { useState } from "react";
import { View, ScrollView, StyleSheet } from "react-native";
import { Button, Dialog, Divider, FAB, Portal, Text } from "react-native-paper";
import TextWithPlusButton from "../../components/common/TextWithPlusButton";
import FileCategoryComponent from "../../components/learningProject/FileCategory";
import UploadFileDialog from "../../components/dialogues/UploadFile";

export default function FilesManagement() {
  const [visible, setVisible] = useState(false);

  const [files, setFiles] = useState([
    { id: "1", name: "File1.pdf", extension: ".pdf" },
    { id: "2", name: "Dummy1.docx", extension: ".docx" },
    { id: "3", name: "Dummy.xlsx", extension: ".xlsx" },
    { id: "4", name: "Misc.txt", extension: ".txt" },
    { id: "5", name: "File2.pdf", extension: ".pdf" },
    { id: "6", name: "Dummy2.docx", extension: ".docx" },
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
          function={() => setUploadDialogVisible(true)}
        />
      </View>
      <ScrollView style={styles.scrollView}>
        <FileCategoryComponent
          title="PDF Documents (.pdf)"
          files={categorizeFiles(".pdf")}
          onDelete={confirmDelete}
        />
        <Divider style={styles.divider} />
        <FileCategoryComponent
          title="Word Documents (.docx)"
          files={categorizeFiles(".docx")}
          onDelete={confirmDelete}
        />
        <Divider style={styles.divider} />
        <FileCategoryComponent
          title="Excel (.xlsx)"
          files={categorizeFiles(".xlsx")}
          onDelete={confirmDelete}
        />
        <Divider style={styles.divider} />
        {/* Assuming 'misc' category for files that don't match known extensions */}
        <FileCategoryComponent
          title="Miscellaneous"
          files={categorizeFiles(".txt")}
          onDelete={confirmDelete}
        />
      </ScrollView>
      <FAB
        style={styles.fab}
        small
        icon="plus"
        onPress={() => setUploadDialogVisible(true)}
      />
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
});
