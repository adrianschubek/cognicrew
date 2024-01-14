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
import * as Sharing from "expo-sharing";

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
   * @param {object} file - The file to download.
   */
  async function downloadFile() {
    // Generate the local URI for the file
    const fileName = encodeURIComponent(file.name);
    const localUri = FileSystem.documentDirectory + fileName;
    try {
      const { uri } = await FileSystem.downloadAsync(fileUrl, localUri);
      //if file is not photo or video do this
      if (folder !== "photos" && file.metadata?.mimetype !== "video/mp4") {
        try {
          const fileString = await FileSystem.readAsStringAsync(localUri, {
            encoding: FileSystem.EncodingType.Base64,
          });

          const permissions =
            await FileSystem.StorageAccessFramework.requestDirectoryPermissionsAsync();
          if (!permissions.granted) {
            return;
          }
          try {
            const fileExtension = file.name.split(".").pop();
            const mimeType =
              file.metadata?.mimetype ?? `application/${fileExtension}`;
            await FileSystem.StorageAccessFramework.createFileAsync(
              permissions.directoryUri,
              fileName,
              mimeType,
            ).then(async (uri) => {
              await FileSystem.writeAsStringAsync(uri, fileString, {
                encoding: FileSystem.EncodingType.Base64,
              });
              alerts.success({ message: "File downloaded successfully" });
            });
          } catch (e) {
            throw new Error(e);
          }
        } catch (e) {
          throw new Error(e);
        }
      } //if file is photo or video do this
      else {
        const { status } = await MediaLibrary.requestPermissionsAsync();
        if (status !== "granted") {
          alerts.error({
            message:
              "Sorry, we need camera roll permissions to make this work!",
          });
          return;
        }
        if (status === "granted") {
          console.log("granted");
        }
        // Save the file to the camera roll
        const asset = await MediaLibrary.createAssetAsync(uri);
        const album = await MediaLibrary.getAlbumAsync("Download");
        if (album == null) {
          await MediaLibrary.createAlbumAsync("Download", asset, false);
        } else {
          await MediaLibrary.addAssetsToAlbumAsync([asset], album, false);
        }
        console.log("File saved to camera roll");
        alerts.success({
          message: "File downloaded successfully to your local media library",
        });
        //console.log("File downloaded to:", uri);
      }
    } catch (error) {
      console.log("Error downloading the file: ", error);
    }
  }
  async function shareFile() {
    const fileName = encodeURIComponent(file.name);
    const localUri = FileSystem.documentDirectory + fileName;
    try {
      const { uri } = await FileSystem.downloadAsync(fileUrl, localUri);
      if (!(await Sharing.isAvailableAsync())) {
        alerts.error({
          message: `Uh oh, sharing isn't available on your platform`,
        });
        return;
      }
      await Sharing.shareAsync(uri);
    } catch (error) {
      console.log("Error downloading the file: ", error);
    }
  }
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
          <TouchableOpacity
            onPress={() => {
              downloadFile();
            }}
          >
            <IconButton
              icon="download"
              size={responsiveFontSize(3)}
              style={{ marginRight: responsiveFontSize(0.05) }}
            />
          </TouchableOpacity>
          <IconButton
            style={{ margin: 0, padding: 0 }}
            icon="share"
            onPress={() => {
              shareFile();
            }}
          />
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
