/**
 * FileItem - Component for rendering individual file items.
 * @param {object} props - Contains the file object, onIconPress and onDeletePress functions.
 */

import React, { useState } from "react";
import { StyleSheet, View, Image, TouchableOpacity } from "react-native";
import { Card, IconButton, List, Text, useTheme } from "react-native-paper";
import {
  responsiveFontSize,
  responsiveWidth,
} from "react-native-responsive-dimensions";
import { supabase } from "../../supabase";
import * as MediaLibrary from "expo-media-library";
import * as FileSystem from "expo-file-system";
import { useAlerts } from "react-native-paper-fastalerts";
export default function FileItem({ file, onDeletePress }) {
  const { data: publicUrl } = supabase.storage.from("files").getPublicUrl("");
  const theme = useTheme();
  const alerts = useAlerts();
  const [photoUrlExists, setPhotoUrlExists] = useState<boolean>(false);
  const fullUrl = publicUrl.publicUrl + file.fullPath;
  /**
   * getFileIconSource - Determines the icon source based on the file extension.
   * @param {string} extension - The file extension.
   * @returns {object} - The source path of the icon image.
   */
  const getIconOrImageSource = (extension) => {
    switch (extension?.toLowerCase()) {
      case "pdf":
        return require("../../assets/pdf.png");
      case "docx":
        return require("../../assets/docx_icon.svg.png");
      case "xlsx":
        return require("../../assets/xlsx_icon.svg.png");
      case undefined:
        setPhotoUrlExists(true);
        return fullUrl;
      default:
        return require("../../assets/OneDrive_Folder_Icon.svg.png");
    }
  };
  const handleDownload = async () => {
    const { status } = await MediaLibrary.requestPermissionsAsync();
    if (status !== "granted") {
      alerts.error({
        message: "Sorry, we need camera roll permissions to make this work!",
      });
      return;
    }

    try {
      if (photoUrlExists) {
        // Generate the local URI for the file
        const filename = encodeURIComponent(file.name);
        const fileUri = FileSystem.documentDirectory + filename;

        // Fetch the Blob from the download URL
        const response = await fetch(fullUrl);
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
        const { uri } = await FileSystem.downloadAsync(fullUrl, localUri);
        console.log("File downloaded to:", uri);
      }
    } catch (error) {
      console.error("Error saving to camera roll:", error);
      alerts.error({
        message: `Error saving to camera roll: ${error.message}`,
      });
    }
  };
  /**
   * handleDownload - Placeholder for file download logic.
   * @param {object} file - The file to download.
   */

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
              file.extension
                ? getIconOrImageSource(file.extension)
                : { uri: getIconOrImageSource(file.extension) }
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
          <TouchableOpacity onPress={onDeletePress}>
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
