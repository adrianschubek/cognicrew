/**
 * FileCategory - Component for displaying a category of files.
 * @param {object} props - Contains the title, files list and the onDelete function.
 */

import React, { useState } from "react";
import { View, FlatList } from "react-native";
import FileItem from "./FileItem";
import { List, Divider } from "react-native-paper";

export default function FileCategory({ title, files, onDelete }) {
  const [expanded, setExpanded] = useState<boolean>(false);
  return (
    <List.Accordion
      title={title}
      left={(props) => <List.Icon {...props} icon="folder" />}
      expanded={expanded}
      onPress={() => setExpanded(!expanded)}
    >
      <View style={{ marginLeft: -40, marginRight: -40 }}>
        <FlatList
          data={files}
          renderItem={({ item }) => (
            <>
              <FileItem file={item} onDeletePress={() => onDelete(item)} />
              <Divider />
            </>
          )}
          keyExtractor={(item) => item.id}
        />
      </View>
    </List.Accordion>
  );
}
