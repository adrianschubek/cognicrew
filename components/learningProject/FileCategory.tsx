/**
 * FileCategory - Component for displaying a category of files.
 * @param {object} props - Contains the title, files list and the onDelete function.
 */

import React, { useState } from "react";
import { View, FlatList, StyleSheet } from "react-native";
import FileItem from "./FileItem";
import { useTheme, Text, List, Divider } from "react-native-paper";
import * as FileSystem from "expo-file-system";
import { supabase } from "../../supabase";
import { useAuth } from "../../providers/AuthProvider";
import { responsiveWidth } from "react-native-responsive-dimensions";

export default function FileCategory({ title, files, onDelete }) {
  const [expanded, setExpanded] = useState<boolean>(false);
  const theme = useTheme();
  const { user } = useAuth();
  const header = "titleMedium";

  /**
   * handleDownload - Placeholder for file download logic.
   * @param {object} file - The file to download.
   */

  const handleDownload = async (file) => {
    try {
      const publicUrl = supabase.storage
        .from("files")
        .getPublicUrl(`${user.id}/documents/${file.name}`);

      if (publicUrl) {
        const localUri = FileSystem.documentDirectory + file.name;
        const { uri } = await FileSystem.downloadAsync(
          publicUrl.data.publicUrl,
          localUri,
        );
        console.log("File downloaded to:", uri);
      }
    } catch (error) {
      console.error("Download error:", error);
    }
  };
  const toggleExpand = () => {
    setExpanded(!expanded);
  };

  return (
    <List.Accordion
      title={title}
      left={(props) => <List.Icon {...props} icon="folder" />}
      expanded={expanded}
      onPress={toggleExpand}
    >
      <View style={{ marginLeft: -40, marginRight: -40 }}>
        <FlatList
          data={files}
          renderItem={({ item }) => (
            <>
              <FileItem
                file={item}
                onIconPress={() => handleDownload(item)}
                onDeletePress={() => onDelete(item)}
              />
              <Divider />
            </>
          )}
          keyExtractor={(item) => item.id}
        />
      </View>
    </List.Accordion>
  );
}
