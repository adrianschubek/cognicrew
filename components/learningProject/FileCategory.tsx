/**
 * FileCategory - Component for displaying a category of files.
 * @param {object} props - Contains the title, files list and the onDelete function.
 */

import React, { useState } from "react";
import {
  View,
  Text,
  FlatList,
  StyleSheet,
  TouchableOpacity,
} from "react-native";
import FileItem from "./FileItem";
import { useTheme } from "react-native-paper";
import * as FileSystem from 'expo-file-system';
import { supabase } from "../../supabase";
import { useAuth } from "../../providers/AuthProvider";


export default function FileCategory({ title, files, onDelete }) {
  const [expanded, setExpanded] = useState(true);
  const theme = useTheme();
  const { user } = useAuth();


  /**
   * handleDownload - Placeholder for file download logic.
   * @param {object} file - The file to download.
   */

  const handleDownload = async (file) => {
    try {
      const publicUrl  = supabase.storage
        .from('files')
        .getPublicUrl(`${user.id}/documents/${file.name}`);

  
      if (publicUrl) {
        const localUri = FileSystem.documentDirectory + file.name;
        const { uri } = await FileSystem.downloadAsync(publicUrl.data.publicUrl, localUri);
        console.log('File downloaded to:', uri);
      }
    } catch (error) {
      console.error('Download error:', error);
    }
  };
  const toggleExpand = () => {
    setExpanded(!expanded);
  };

  return (
    <View style={styles.container}>
      <TouchableOpacity onPress={toggleExpand} style={styles.headerContainer}>
        <Text style={[styles.header, { color: theme.colors.onSurface }]}>
          {title}
        </Text>
      </TouchableOpacity>
      {expanded && (
        <FlatList
          data={files}
          renderItem={({ item }) => (
            <FileItem
              file={item}
              onIconPress={() => handleDownload(item)}
              onDeletePress={() => onDelete(item)}
            />
          )}
          keyExtractor={(item) => item.id}
        />
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    paddingHorizontal: 10,
    paddingVertical: 5,
  },
  headerContainer: {
    paddingVertical: 10,
  },
  header: {
    fontWeight: "bold",
    fontSize: 18,
    marginBottom: 5,
  },
});
