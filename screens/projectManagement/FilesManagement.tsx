/**
 * FilesManagement - Main component for managing files.
 * It handles file uploads, deletions, and categorizes files for display.
 */

import React, { useEffect, useState } from "react";
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
import {
  useSoundSystem1,
  useFileUpload,
  useFileDelete,
  useFilesList,
  useFileDownload,
} from "../../utils/hooks";
import * as DocumentPicker from "expo-document-picker";
import { useAuth } from "../../providers/AuthProvider";
import { FileObject } from "@supabase/storage-js";
import * as ImagePicker from "expo-image-picker";
import * as FileSystem from "expo-file-system";
import { supabase } from "../../supabase";
import { decode } from "base64-arraybuffer";
import ImageItem from "../../components/common/ImageItem";

export default function FilesManagement() {
  const fileUpload = useFileUpload();
  const fileDownload = useFileDownload(); // Call this hook here instead of in handleDownload
  const { filesList, fetchFilesList } = useFilesList();
  const deleteFile = useFileDelete();
  const [uploadDialogVisible, setUploadDialogVisible] = useState(false);

  const [otherFiles, setOtherFiles] = useState<FileObject[]>([]); // State for non-image files

  const loadOtherFiles = async () => {
    const { data } = await supabase.storage.from("files").list(user.id, {
      // You may want to filter out images if they are stored in the same location
    });
    if (data) {
      setOtherFiles(data.filter(file => !file.name.match(/\.(jpg|jpeg|png)$/i)));
    }
  };


  const refreshFiles = () => {
    fetchFilesList();
  };

  

  useEffect(() => {
    fetchFilesList();
  }, []);

  // Call this function when you want to delete a file
  const handleFileDelete = async (filePath) => {
    const response = await deleteFile(filePath);
    if (response.success) {
      // Refresh the list to reflect the deletion
      refreshFiles();
    }
  };

  const handleFileSelection = async () => {
    try {
      const result = await DocumentPicker.getDocumentAsync({
        type: "*/*", // or any other MIME types you want to allow
      });

      if (result.canceled === false && result.assets) {
        const file = result.assets[0]; // Assuming you are picking one file at a time

        if (file && "uri" in file && "name" in file && "size" in file) {
          if (!user) {
            console.error("No user is authenticated!");
            // Handle the case when there is no authenticated user
            return;
          }

          // Construct the path with user's ID
          const userSpecificPath = `uploads/${user.id}/${file.name}`;

          // Log the full path for debugging
          console.log(`Uploading to path: ${userSpecificPath}`);

          // Create the file object with the user-specific path
          const fileObject = {
            uri: file.uri,
            name: userSpecificPath, // Use the user-specific path here
            type: "multipart/form-data", // Make sure the type is correctly set
          };

          // Now call your upload function with the file object
          const uploadResponse = await fileUpload(fileObject);

          if (uploadResponse.success) {
            // Refresh file list
            refreshFiles();
          } else {
            // Handle the error, e.g., show an alert
            console.error("Error uploading file:", uploadResponse.error);
          }
        }
      }
    } catch (err) {
      console.error("Error selecting file:", err);
    }
  };

  // Function to handle file downloads

  const handleDownload = async (file) => {
    // fileDownload function should be modified to take the whole file object if necessary
    const { success, data, error } = await fileDownload(file.name); // Assuming file has a name property
    if (success) {
      // Handle the data, e.g., save to device, open, etc.
    } else {
      // Error handling
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

  const { user } = useAuth();
  const [files1, setFiles1] = useState<FileObject[]>([]);

   useEffect(() => {
    if (!user) return;
    loadImages();
    loadOtherFiles();
  }, [user]);

    // Function to extract file extension
    const getFileExtension = (filename) => {
      return filename.slice(((filename.lastIndexOf(".") - 1) >>> 0) + 2);
    };

    const categorizeOtherFiles = (extension) => {
      return otherFiles.filter(file => getFileExtension(file.name).toLowerCase() === extension);
    };

    const handleOtherFileUpload = async () => {
      try {
        const result = await DocumentPicker.getDocumentAsync({
          type: "*/*", // All file types
        });
    
        if (!result.canceled && result.assets && result.assets.length > 0) {
          const fileAsset = result.assets[0];
          const uri = fileAsset.uri;
          const name = fileAsset.name;
          const fileExtension = name.split('.').pop();
          const contentType = `application/${fileExtension}`; // A basic assumption of content type
    
          // Prepare the file for upload
          const base64 = await FileSystem.readAsStringAsync(uri, {
            encoding: FileSystem.EncodingType.Base64,
          });
          const filePath = `${user.id}/${new Date().getTime()}.${fileExtension}`;
    
          // Uploading the file to Supabase
          await supabase.storage
            .from("files")
            .upload(filePath, decode(base64), { contentType });
    
          // Refreshing the files list
          await loadOtherFiles();
        }
      } catch (error) {
        console.error("Error uploading file:", error);
      }
    };
    

  const loadImages = async () => {
    const { data } = await supabase.storage.from("files").list(user.id);
    if (data) {
      setFiles1(data);
    }
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

  const onRemoveImage = async (item: FileObject, listIndex: number) => {
    supabase.storage.from('files').remove([`${user!.id}/${item.name}`])
    const newFiles = [...files1]
    newFiles.splice(listIndex, 1)
    setFiles1(newFiles)
  }

  const [selectedFile, setSelectedFile] = useState(null);

  /**
   * confirmDelete - Opens a dialog to confirm deletion of a file.
   * @param {string} fileId - The ID of the file to potentially delete.
   */

  const confirmDelete = (fileId) => {
    setSelectedFile(fileId);
    setVisible(true);
  };

  /**
   * handleUpload - Handles the uploading of a new file.
   * @param {object} newFile - The new file object to be uploaded.
   */

  // not really working as of now
  const handleUpload = async (newFile) => {
    const uploadResponse = await fileUpload(newFile);
    if (uploadResponse.success) {
      refreshFiles(); // Refresh the list to show the new file
    } else {
      // Handle the error, e.g., show an alert
    }
  };
  /**
   * categorizeFiles - Categorizes files based on their extension.
   * @param {string} extension - The file extension to filter by.
   * @returns {array} - Array of files that match the given extension.
   */
  const categorizeFiles = (extension) => {
    return files.filter((file) => file.extension === extension);
  };

  const categorizePhotos = () => {
    // Assuming your image files have extensions like these
    const imageExtensions = [".jpg", ".jpeg", ".png"];
    return files1.filter((file) =>
      imageExtensions.includes(`.${file.name.split(".").pop().toLowerCase()}`),
    );
  };

  /**
   * handleDelete - Handles the deletion of the selected file.
   */
  const handleDelete = async () => {
    if (selectedFile) {
      // Assuming selectedFile is the path or name of the file to be deleted
      const response = await deleteFile(selectedFile);
      if (response.success) {
        refreshFiles(); // Refresh the list to reflect the deletion
        setVisible(false);
      } else {
        // Handle the error, e.g., show an alert
      }
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
                files={categorizeOtherFiles('pdf')}                onDelete={confirmDelete}
                onDownload={handleDownload} // Pass the handleDownload function here
              />
              <Divider style={styles.divider} />
              <FileCategory
                title="Word Documents (.docx)"
                files={categorizeOtherFiles('docx')}                onDelete={confirmDelete}
                onDownload={handleDownload} // And here
              />
              <Divider style={styles.divider} />
              <FileCategory
                title="Excel (.xlsx)"
                files={categorizeOtherFiles("xlsx")}
                onDelete={confirmDelete}
                onDownload={handleDownload} // And here
              />
              <Divider style={styles.divider} />
              <FileCategory
                title="Miscellaneous"
                files={categorizeOtherFiles("txt")}
                onDelete={confirmDelete}
                onDownload={handleDownload} // And here
              /> 
              <Divider style={styles.divider} />
              <FileCategory
                title="Photos"
                files={categorizePhotos()}
                onDelete={onRemoveImage}
                onDownload={handleDownload}
              />
               <ScrollView>
      {files1.map((item, index) => (
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
        icon="camera"
        onPress={handleFileSelection} // Update this to call the file selection function
      />
      <View style={styles.container}>
        <ScrollView>
          {files1.map((item, index) => (
            <ImageItem
              key={item.id}
              item={item}
              userId={user!.id}
              onRemoveImage={() => onRemoveImage(item, index)}
            />
          ))}
        </ScrollView>
        {/* FAB to add images */}
        <TouchableOpacity
          onPress={onSelectImage}
          style={styles.fab2}
        ></TouchableOpacity>
      </View>

      <FAB
        style={styles.fab3}
        small
        icon="file-upload"
        onPress={handleOtherFileUpload}
      />
      <UploadFileDialog
        visible={uploadDialogVisible}
        onDismiss={() => setUploadDialogVisible(false)}
        onSubmit={handleUpload} // Make sure this function uploads to Supabase and then calls `fetchFilesList`
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
  container2: {
    flex: 1,
    padding: 20,
    backgroundColor: "#151515",
  },
  fab2: {
    borderWidth: 1,
    alignItems: "center",
    justifyContent: "center",
    width: 70,
    position: "absolute",
    bottom: 40,
    right: 30,
    height: 70,
    backgroundColor: "#2b825b",
    borderRadius: 100,
  },
  fab3: {
    borderWidth: 1,
    alignItems: "center",
    justifyContent: "center",
    width: 100,
    position: "absolute",
    bottom: 20,
    right: 30,
    height: 20,
    backgroundColor: "#2b825b",
    borderRadius: 100,
  },
});