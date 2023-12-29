/**
 * FileItem - Component for rendering individual file items.
 * @param {object} props - Contains the file object, onIconPress and onDeletePress functions.
 */

import React, { useEffect, useState } from "react";
import { StyleSheet, View, Image, TouchableOpacity } from "react-native";
import { IconButton, List, useTheme } from "react-native-paper";
import { responsiveFontSize } from "react-native-responsive-dimensions";
import { supabase } from "../../supabase";
import * as MediaLibrary from "expo-media-library";
import * as FileSystem from "expo-file-system";
import { useAlerts } from "react-native-paper-fastalerts";
//import { useDeleteFile } from "../../utils/hooks";
import { usePrivateFileUrl } from "../../utils/hooks";
import LoadingOverlay from "../alerts/LoadingOverlay";
export default function FileItem({ file, filePath, folder }) {
  const theme = useTheme();
  const alerts = useAlerts();
  const [photoUrl, setPhotoUrl] = useState<string>();
  const { data, error, isLoading, mutate } = usePrivateFileUrl(
    filePath,
    "files",
  );
  useEffect(() => {
    if (!data) return;
    setPhotoUrl(data);
  }, [data]);
  //console.log(fullUrl);
  /* const {
    mutate: deleteFile,
    isLoading,
    error,
  } = useDeleteFile(file.fullPath, "files");*/
  /**
   * getFileIconSource - Determines the icon source based on the file extension.
   * @param {string} extension - The file extension.
   * @returns {object} - The source path of the icon image.
   */
  const getIconOrImageSource = (folder) => {
    switch (folder) {
      case "pdf":
        return require("../../assets/pdf.png");
      case "docx":
        return require("../../assets/docx_icon.svg.png");
      case "xlsx":
        return require("../../assets/xlsx_icon.svg.png");
      case "photos":
        return photoUrl;
      default:
        return require("../../assets/OneDrive_Folder_Icon.svg.png");
    }
  };
  async function deleteFile() {
    const { error } = await supabase.storage.from("files").remove([filePath]);
  }
  /**
   * handleDownload - Placeholder for file download logic.
   * @param {object} file - The file to download.
   */
  const handleDownload = async () => {
    const { status } = await MediaLibrary.requestPermissionsAsync();
    if (status !== "granted") {
      alerts.error({
        message: "Sorry, we need camera roll permissions to make this work!",
      });
      return;
    }
    try {
      if (photoUrl) {
        // Generate the local URI for the file
        const filename = encodeURIComponent(file.name);
        const fileUri = FileSystem.documentDirectory + filename;

        // Fetch the Blob from the download URL
        const response = await fetch(photoUrl);
        const blob = await response.blob();

        // Convert the Blob to base64
        const reader = new FileReader();
        reader.onloadend = async () => {
          if (reader.result) {
            // Assert that reader.result is a string
            const base64data = (reader.result as string).split(",")[1]; // Remove the prefix (`data:image/png;base64,`)

            // Write the base64 string to the local file system
            await FileSystem.writeAsStringAsync(fileUri, base64data, {
              encoding: FileSystem.EncodingType.Base64,
            });

            // Save the local image to the camera roll
            const asset = await MediaLibrary.createAssetAsync(fileUri);
            await MediaLibrary.createAlbumAsync("Download", asset, false);
            alerts.success({ message: "Saved to camera roll!" });
          }
        };
        reader.onerror = (error) => {
          throw new Error(`FileReader error: ${error}`);
        };
        reader.readAsDataURL(blob);
      } else {
        const localUri = FileSystem.documentDirectory + file.name;
        const { uri } = await FileSystem.downloadAsync(photoUrl, localUri);
        console.log("File downloaded to:", uri);
      }
    } catch (error) {
      console.error("Error saving to camera roll:", error);
      error({
        message: `Error saving to camera roll: ${error.message}`,
      });
    }
  };
  if (isLoading) return <LoadingOverlay visible={isLoading} />;
  return (
    <List.Item
      style={{
        backgroundColor: theme.colors.secondaryContainer,
        paddingHorizontal: 8,
      }}
      title={file.name}
      left={() => (
        <View style={{ alignItems: "center", justifyContent: "center" }}>
          <Image
            source={
              folder !== "photos"
                ? getIconOrImageSource(folder)
                : { uri: getIconOrImageSource(folder) }
            }
            style={file.extension ? styles.fileIcon : { width: 80, height: 80 }}
          />
        </View>
      )}
      right={() => (
        <View
          style={{
            flexDirection: "row",
            alignItems: "center",
            marginRight: 10,
          }}
        >
          <TouchableOpacity onPress={handleDownload}>
            <IconButton
              icon="download"
              size={responsiveFontSize(3)}
              style={{ marginRight: responsiveFontSize(0.05) }}
            />
          </TouchableOpacity>
          <TouchableOpacity
            onPress={() => {
              alerts.confirm({
                title: "Delete file",
                icon: "delete",
                message: `Are you sure you want to delete ${file.name}?`,
                cancelText: "Cancel",
                okText: "Delete",
                okAction: () => deleteFile(),
              });
            }}
          >
            <IconButton icon="delete" size={responsiveFontSize(3)} />
          </TouchableOpacity>
        </View>
      )}
    />
  );
}

const styles = StyleSheet.create({
  fileIcon: {
    width: responsiveFontSize(4),
    height: responsiveFontSize(4),
    borderRadius: responsiveFontSize(2),
    marginRight: 10,
    marginLeft: 10,
    //backgroundColor: "green",
  },
});
