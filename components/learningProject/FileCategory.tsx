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

export default function FileCategory({ title, files, onDelete, onDownload }) {
  const [expanded, setExpanded] = useState(true);
  const theme = useTheme();

  /**
   * handleDownload - Placeholder for file download logic.
   * @param {object} file - The file to download.
   */

  const handleDownload = (file) => {
    // Placeholder for download logic
    console.log("Download logic for: ", file);
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
              onIconPress={() => onDownload(item)} // Pass the whole file object
              onDeletePress={() => onDelete(item.id)}
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
