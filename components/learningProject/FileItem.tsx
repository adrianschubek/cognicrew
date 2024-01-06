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
export default function FileItem({ file, filePath, folder, icon }) {
  const theme = useTheme();
  const alerts = useAlerts();
  const [fileUrl, setFileUrl] = useState<string>();
  const [imageSize, setImageSize] = useState({ width: 0, height: 0 });
  const { data, error, isLoading, mutate } = usePrivateFileUrl(
    filePath,
    "files",
  );
  useEffect(() => {
    if (!data) return;
    setFileUrl(data);
    if (folder === "photos") {
      Image.getSize(data, (width, height) => {
        if (width > height) {
          setImageSize({ width: 80, height: 80 * (height / width) });
        } else {
          setImageSize({ width: 80 * (width / height), height: 80 });
        }
      });
    }
  }, [data]);
  //console.log(fullUrl);
  /* const {
    mutate: deleteFile,
    isLoading,
    error,
  } = useDeleteFile(file.fullPath, "files");*/

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
    // Generate the local URI for the file
    const photoFilename = encodeURIComponent(file.name);
    const fileName = folder === "photos" ? photoFilename : file.name;
    const localUri = FileSystem.documentDirectory + fileName;
    try {
      if (folder === "photos") {
        // Fetch the Blob from the download URL
        const response = await fetch(fileUrl);
        const blob = await response.blob();

        // Convert the Blob to base64
        const reader = new FileReader();
        reader.onloadend = async () => {
          if (reader.result) {
            // Assert that reader.result is a string
            const base64data = (reader.result as string).split(",")[1]; // Remove the prefix (`data:image/png;base64,`)

            // Write the base64 string to the local file system
            await FileSystem.writeAsStringAsync(localUri, base64data, {
              encoding: FileSystem.EncodingType.Base64,
            });

            // Save the local image to the camera roll
            const asset = await MediaLibrary.createAssetAsync(localUri);
            await MediaLibrary.createAlbumAsync("Download", asset, false);
            alerts.success({ message: "Saved to camera roll!" });
          }
        };
        reader.onerror = (error) => {
          throw new Error(`FileReader error: ${error}`);
        };
        reader.readAsDataURL(blob);
      } else {
        try {
          const { uri } = await FileSystem.downloadAsync(fileUrl, localUri);
          console.log("File downloaded to:", uri);
        } catch (error) {
          console.log("Error downloading the file: ", error);
        }
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
        <View
          style={{
            alignItems: "center",
            justifyContent: "center",
            width: 80,
            height: 80,
          }}
        >
          <Image
            source={icon ? icon : { uri: fileUrl }}
            style={
              icon
                ? styles.fileIcon
                : { width: imageSize.width, height: imageSize.height }
            }
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
