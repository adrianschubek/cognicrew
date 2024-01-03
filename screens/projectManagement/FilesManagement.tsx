/**
 * FilesManagement - Main component for managing files.
 * It handles file uploads, deletions, and categorizes files for display.
 */

import React, { Fragment, useEffect } from "react";
import { View, StyleSheet, VirtualizedList } from "react-native";
import { Divider, FAB, List } from "react-native-paper";
import FileCategory from "../../components/learningProject/FileCategory";
import { useProjectStore } from "../../stores/ProjectStore";
import {
  selectAndUploadFile,
  selectAndUploadImage,
} from "../../utils/FileFunctions";
import { supabase } from "../../supabase";

export default function FilesManagement() {
  const projectId = useProjectStore((state) => state.projectId);
  const onSelectImage = async () => {
    const filePath = `${projectId}/photos`;
    await selectAndUploadImage(filePath);
  };
  const onSelectDocument = async () => {
    await selectAndUploadFile(`${projectId}`, true);
  };
  const categories = [
    { title: "PDF Documents (.pdf)", folder: "pdf" },
    { title: "Word Documents (.docx)", folder: "docx" },
    { title: "Excel Documents (.xlsx)", folder: "xlsx" },
    { title: "Miscellaneous", folder: "miscellaneous" },
    { title: "Photos", folder: "photos" },
  ];
  /*useEffect(() => {
    const fileTracker = supabase
      .channel(`files-tracker`)
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
          mutate();
        },
      )
      .subscribe();
  }, []);*/
  return (
    <View style={styles.container}>
      <VirtualizedList
        renderItem={() => null}
        getItemCount={() => 0}
        ListHeaderComponent={() => {
          return (
            <View>
              <List.Section>
                {categories.map((category, index) => {
                  return (
                    <Fragment key={index}>
                      <FileCategory
                        title={category.title}
                        projectId={projectId}
                        folder={category.folder}
                        mutationSignal={() => {}}
                      />
                      <Divider style={{ marginHorizontal: 8 }} />
                    </Fragment>
                  );
                })}
              </List.Section>
              {/*View margin for FAB.Group when scrolling down */}
              <View style={{ marginBottom: 86 }}></View>
            </View>
          );
        }}
      ></VirtualizedList>
      <FAB
        style={styles.fab}
        small
        icon="file-upload"
        onPress={onSelectDocument}
      />
      <FAB style={styles.fab2} small icon="camera" onPress={onSelectImage} />
      {/* Delete confirmation dialog */}
    </View>
  );
}
const styles = StyleSheet.create({
  container: {
    marginTop: -8,
    flex: 1,
  },
  fab: {
    position: "absolute",
    margin: 16,
    right: 0,
    bottom: 0,
  },
  fab2: {
    position: "absolute",
    margin: 16,
    right: 70,
    bottom: 0,
  },
});
