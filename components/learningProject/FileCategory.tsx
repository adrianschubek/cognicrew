/**
 * FileCategory - Component for displaying a category of files.
 * @param {object} props - Contains the title, files list and the onDelete function.
 */

import React, { useState } from "react";
import { View, FlatList } from "react-native";
import FileItem from "./FileItem";
import { List, Divider, HelperText, useTheme } from "react-native-paper";

export default function FileCategory({ title, files }) {
  const theme = useTheme();
  const [expanded, setExpanded] = useState<boolean>(false);
  return (
    <List.Accordion
      title={title}
      left={(props) => <List.Icon {...props} icon="folder" />}
      expanded={expanded}
      onPress={() => setExpanded(!expanded)}
    >
      {!files.length && (
        <HelperText
          type="info"
          style={{ backgroundColor: theme.colors.secondaryContainer }}
        >
          There are no files in this set. Add some via the buttons on
          the bottom right
        </HelperText>
      )}
      <View style={{ marginLeft: -40, marginRight: -40 }}>
        <FlatList
          data={files}
          renderItem={({ item }) => (
            <>
              <FileItem file={item} />
              <Divider />
            </>
          )}
          keyExtractor={(item) => item.id}
        />
      </View>
    </List.Accordion>
  );
}
