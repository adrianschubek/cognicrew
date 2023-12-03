import { FileObject } from "@supabase/storage-js";
import { Image, View, Text, TouchableOpacity } from "react-native";
import { useEffect, useState } from "react";
import { supabase } from "../../supabase";
import { IconButton, useTheme } from "react-native-paper";
import { responsiveFontSize } from "react-native-responsive-dimensions";
import * as MediaLibrary from "expo-media-library";
import * as Permissions from "expo-permissions";
import * as FileSystem from 'expo-file-system';
import { useAlerts } from "../../utils/hooks";


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
  const [image, setImage] = useState<string>("");
  const [downloadUrl, setDownloadUrl] = useState<string>("");


  // Maybe adjust: This will trigger a "download" each time the component renders
  supabase.storage
    .from("files")
    .download(`${projectId}/photos/${item.name}`)
    .then(({ data, error }) => {
      if (error) {
        console.error("Error downloading image:", error.message);
        return;
      }
      const fr = new FileReader();
      if (data) {
        fr.readAsDataURL(data);
        fr.onload = () => {
          setImage(fr.result as string);
        };
      }
    });

    useEffect(() => {
      const fetchImage = async () => {
        const { data, error } = await supabase.storage
          .from("files") // Use the correct bucket name
          .download(`${projectId}/photos/${item.name}`); // Correct path to the file
    
        if (error) {
          console.error("Error downloading image:", error.message);
          return;
        }
    
        if (data) {
          // Convert the downloaded data to a Blob URL if necessary
      const blobUrl = URL.createObjectURL(data);

          setDownloadUrl(blobUrl);
          setImage(blobUrl); // Set the image for display purposes
        }
      };
    
      fetchImage();
    }, [item, projectId]);
    

    
  const theme = useTheme();
  
  const saveToCameraRoll = async () => {
    const { status } = await MediaLibrary.requestPermissionsAsync();
    if (status !== "granted") {
      alerts.error({message:"Sorry, we need camera roll permissions to make this work!"});
      return;
    }
  
    try {
      if (downloadUrl) {
        // Generate the local URI for the file
        const filename = encodeURIComponent(item.name);
        const fileUri = FileSystem.documentDirectory + filename;
  
        // Fetch the Blob from the download URL
        const response = await fetch(downloadUrl);
        const blob = await response.blob();
  
        // Convert the Blob to base64
        const reader = new FileReader();
        reader.onloadend = async () => {
          if (reader.result) {
            // Assert that reader.result is a string
            const base64data = (reader.result as string).split(',')[1]; // Remove the prefix (`data:image/png;base64,`)
  
            // Write the base64 string to the local file system
            await FileSystem.writeAsStringAsync(fileUri, base64data, {
              encoding: FileSystem.EncodingType.Base64,
            });
  
            // Save the local image to the camera roll
            const asset = await MediaLibrary.createAssetAsync(fileUri);
            await MediaLibrary.createAlbumAsync("Download", asset, false);
            alerts.success({message:"Saved to camera roll!"});
          }
        };
        reader.onerror = (error) => {
          throw new Error(`FileReader error: ${error}`);
        };
        reader.readAsDataURL(blob);
      }
    } catch (error) {
      console.error("Error saving to camera roll:", error);
      alerts.error({message:`Error saving to camera roll: ${error.message}`});
    }
  };
  
  

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
      {image ? (
        <Image style={{ width: 80, height: 80 }} source={{ uri: image }} />
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
