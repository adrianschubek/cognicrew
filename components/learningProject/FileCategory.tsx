/**
 * FileCategory - Component for displaying a category of files.
 * @param {object} props - Contains the title, files list and the onDelete function.
 */

import React, { useEffect, useState } from "react";
import { View, FlatList } from "react-native";
import FileItem from "./FileItem";
import { List, Divider, HelperText, useTheme } from "react-native-paper";
import { useFiles } from "../../utils/hooks";
import { FileObject } from "@supabase/storage-js";

export default function FileCategory({ title, folder, projectId }) {
  const theme = useTheme();
  const [expanded, setExpanded] = useState<boolean>(false);
  const [files, setFiles] = useState<FileObject[]>([]);
  const { data, error, isLoading, mutate } = useFiles(`${projectId}/${folder}`);
  useEffect(() => {
    if (!data) return;
    setFiles(data.data);
  }, [data]);

  /*
  //here will the subscription be
  useEffect(() => {
    const realtimeFiles = supabase
      .channel("files_all")
      .on(
        "postgres_changes",
        { event: "*", schema: "storage", table: "objects" },
        (payload) => {
          //this subscription does not work!
          console.log("hallo");
          mutateFiles();
          mutatePhotos();
        },
      )
      .subscribe();
  }, []);
*/
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
          There are no files in this set. Add some via the buttons on the bottom
          right
        </HelperText>
      )}
      <View style={{ marginLeft: -40, marginRight: -40 }}>
        <FlatList
          data={files}
          renderItem={({ item }) => (
            <>
              <FileItem
                file={item}
                filePath={`${projectId}/${folder}/${item.name}`}
                folder={folder}
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
