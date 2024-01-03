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
import { supabase } from "../../supabase";
import LoadingOverlay from "../alerts/LoadingOverlay";

export default function FileCategory({
  title,
  folder,
  projectId,
  mutationSignal,
}) {
  const theme = useTheme();
  const [expanded, setExpanded] = useState<boolean>(false);
  const [files, setFiles] = useState<FileObject[]>([]);
  const { data, error, isLoading, mutate } = useFiles(`${projectId}/${folder}`);
  useEffect(() => {
    if (!data) return;
    console.log("setFiles in folder: ", folder);
    setFiles(data.data);
  }, [data]);
  const getIconSource = (folder) => {
    switch (folder) {
      case "pdf":
        return require("../../assets/pdf.png");
      case "docx":
        return require("../../assets/docx_icon.svg.png");
      case "xlsx":
        return require("../../assets/xlsx_icon.svg.png");
      case "photos":
        return null;
      default:
        return require("../../assets/OneDrive_Folder_Icon.svg.png");
    }
  };
  const icon = getIconSource(folder);

  useEffect(() => {
    const fileTracker = supabase
      .channel(`files-${folder}-tracker`)
      .on(
        "postgres_changes",
        {
          event: "*",
          schema: "public",
          table: "tracker",
          filter: "key=eq.files",
        },
        (payload) => {
          console.log("payload: ", payload);
          console.log("new: ", payload.new);
          mutate();
        },
      )
      .subscribe();
  }, []);
  /*useEffect(() => {
    if (!mutationSignal) return;
  }, [mutationSignal]);*/
  if (isLoading) return <LoadingOverlay visible={isLoading} />;
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
                icon={icon}
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
