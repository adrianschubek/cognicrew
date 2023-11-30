import React from "react";
import { View, Text, FlatList, StyleSheet } from "react-native";
import { useTheme } from "react-native-paper";
import ImageItem from "../common/ImageItem";

export default function ImageCategory({ title, images, onDelete, onDownload }) {
  const theme = useTheme();

  return (
    <View style={styles.container}>
      <Text style={[styles.header, { color: theme.colors.onSurface }]}>
        {title}
      </Text>
      <FlatList
        data={images}
        renderItem={({ item }) => (
          <ImageItem
            image={item}
            onDeletePress={() => onDelete(item.id)}
            onDownloadPress={() => onDownload(item.id)}
          />
        )}
        keyExtractor={(item) => item.id.toString()}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    paddingHorizontal: 10,
    paddingVertical: 5,
  },
  header: {
    fontWeight: "bold",
    fontSize: 18,
    marginBottom: 5,
  },
});
