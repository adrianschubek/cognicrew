import { FileObject } from "@supabase/storage-js";
import { Image, View, Text, TouchableOpacity } from "react-native";
import { useEffect, useState } from "react";
import { IconButton, useTheme } from "react-native-paper";
import { responsiveFontSize } from "react-native-responsive-dimensions";
import * as MediaLibrary from "expo-media-library";
import * as FileSystem from "expo-file-system";
import { useAlerts } from "react-native-paper-fastalerts";
import { useFileUrl } from "../../utils/hooks";
import LoadingOverlay from "../alerts/LoadingOverlay";

const ImageItem = ({
  item,
  projectId,
  onRemoveImage,
}: {
  item: FileObject;
  projectId: number;
  onRemoveImage: () => void;
}) => {
  const alerts = useAlerts();
  const [imageUrl, setImageUrl] = useState<string>("");
  const { data, error, isLoading, mutate } = useFileUrl(
    `${projectId}/photos/${item.name}`,
  );

  useEffect(() => {
    if (!data) return;
    setImageUrl(data.data.publicUrl);
    //console.log(data.data.publicUrl);
  }, [data]);

  useEffect(() => {
    mutate();
  }, [item, projectId]);

  const theme = useTheme();

  const saveToCameraRoll = async () => {
    const { status } = await MediaLibrary.requestPermissionsAsync();
    if (status !== "granted") {
      alerts.error({
        message: "Sorry, we need camera roll permissions to make this work!",
      });
      return;
    }

    try {
      if (imageUrl) {
        // Generate the local URI for the file
        const filename = encodeURIComponent(item.name);
        const fileUri = FileSystem.documentDirectory + filename;

        // Fetch the Blob from the download URL
        const response = await fetch(imageUrl);
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
      }
    } catch (error) {
      console.error("Error saving to camera roll:", error);
      alerts.error({
        message: `Error saving to camera roll: ${error.message}`,
      });
    }
  };
  if (isLoading) return <LoadingOverlay visible={isLoading} />;
  return (
    <View
      style={{
        flexDirection: "row",
        alignItems: "center",
        padding: 8,
        backgroundColor: theme.colors.surface,
        shadowColor: theme.colors.shadow,
        shadowOffset: { width: 0, height: 1 },
        shadowOpacity: 0.22,
        shadowRadius: 2.22,
        elevation: 3,
        marginVertical: 4,
        borderRadius: 4,
      }}
    >
      {imageUrl ? (
        <Image style={{ width: 80, height: 80 }} source={{ uri: imageUrl }} />
      ) : (
        <View
          style={{
            width: 80,
            height: 80,
            backgroundColor: theme.colors.onSurface,
          }}
        />
      )}
      <Text style={{ flex: 1, color: theme.colors.onSurface }}>
        {item.name}
      </Text>
      <TouchableOpacity onPress={saveToCameraRoll}>
        <IconButton icon="download" size={responsiveFontSize(3)} />
      </TouchableOpacity>
      <TouchableOpacity onPress={onRemoveImage}>
        <IconButton icon="delete" size={responsiveFontSize(3)} />
      </TouchableOpacity>
    </View>
  );
};

export default ImageItem;
