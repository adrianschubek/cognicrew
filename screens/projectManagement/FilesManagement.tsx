/**
 * FilesManagement - Main component for managing files.
 * It handles file uploads, deletions, and categorizes files for display.
 */

import React, { Fragment } from "react";
import { View, StyleSheet, VirtualizedList } from "react-native";
import { Divider, FAB, HelperText, List } from "react-native-paper";
import FileCategory from "../../components/learningProject/file/FileCategory";
import { useProjectStore } from "../../stores/ProjectStore";
import {
  selectAndUploadFile,
  selectAndUploadImage,
} from "../../utils/FileFunctions";

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
                      />
                      <Divider style={{ marginHorizontal: 8 }} />
                    </Fragment>
                  );
                })}
              </List.Section>
              <HelperText type="info">
                Downloading photos and videos will save them automatically to
                the media library of your device. Other file formats will be
                saved to the manually selected location.
              </HelperText>
              {/*View margin for FAB.Group when scrolling down */}
              <View style={{ marginBottom: 86 }}></View>
            </View>
          );
        }}
      />
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
