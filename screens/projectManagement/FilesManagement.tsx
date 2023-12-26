/**
 * FilesManagement - Main component for managing files.
 * It handles file uploads, deletions, and categorizes files for display.
 */

import React, { useState, useEffect, Fragment } from "react";
import { View, StyleSheet, VirtualizedList, ScrollView } from "react-native";
import { Divider, FAB, List } from "react-native-paper";
import FileCategory from "../../components/learningProject/FileCategory";
import { FileObject } from "@supabase/storage-js";
import { supabase } from "../../supabase";
import { useProjectStore } from "../../stores/ProjectStore";
import {
  selectAndUploadFile,
  selectAndUploadImage,
} from "../../utils/FileFunctions";
import { useFiles } from "../../utils/hooks";
import LoadingOverlay from "../../components/alerts/LoadingOverlay";

export default function FilesManagement() {
  const [photos, setPhotos] = useState<FileObject[]>([]);
  const projectId = useProjectStore((state) => state.projectId);
  const {
    data: photoData,
    error: photoError,
    isLoading: photosLoading,
    mutate: mutatePhotos,
  } = useFiles(`${projectId}/photos`);
  const {
    data: fileData,
    error: fileError,
    isLoading: filesLoading,
    mutate: mutateFiles,
  } = useFiles(`${projectId}/documents`);

  const onSelectImage = async () => {
    const filePath = `${projectId}/photos`;
    await selectAndUploadImage(filePath);
    mutatePhotos();
  };

  useEffect(() => {
    if (!photoData) return;
    setPhotos(photoData.data);
  }, [photoData]);

  useEffect(() => {
    if (!fileData) return;
    const filesWithExtension = fileData.data.map((file) => {
      const extension = file.name.split(".").pop().toLowerCase();
      return { ...file, extension };
    });
    const categorizedFiles = filesWithExtension.reduce(
      (acc, file) => {
        if (file.extension === "pdf") {
          acc.pdf.push(file);
        } else if (file.extension === "docx") {
          acc.docx.push(file);
        } else if (file.extension === "xlsx") {
          acc.xlsx.push(file);
        } else {
          acc.misc.push(file);
        }
        return acc;
      },
      { pdf: [], docx: [], xlsx: [], misc: [] },
    );
    setFiles(categorizedFiles);
  }, [fileData]);

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

  const onSelectDocument = async () => {
    (await selectAndUploadFile(`${projectId}`, true)).isImage
      ? mutatePhotos()
      : mutateFiles();
  };

  const [files, setFiles] = useState({
    pdf: [],
    docx: [],
    xlsx: [],
    misc: [],
  });

  const categories = [
    { title: "PDF Documents (.pdf)", files: files.pdf },
    { title: "Word Documents (.docx)", files: files.docx },
    { title: "Excel Documents (.xlsx)", files: files.xlsx },
    { title: "Miscellaneous", files: files.misc },
    { title: "Photos", files: photos, folder: "photos" },
  ];
  if (photosLoading || filesLoading)
    return <LoadingOverlay visible={photosLoading || filesLoading} />;
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
                  let folder = category.folder ? category.folder : "documents";
                  return (
                    <Fragment key={index}>
                      <FileCategory
                        title={category.title}
                        files={category.files.map((file) => ({
                          ...file,
                          fullPath: `${projectId}/${folder}/${file.name}`,
                        }))}
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
