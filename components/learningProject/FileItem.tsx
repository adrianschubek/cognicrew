/**
 * FileItem - Component for rendering individual file items.
 * @param {object} props - Contains the file object, onIconPress and onDeletePress functions.
 */

import React from "react";
import { StyleSheet, View, Image, TouchableOpacity } from "react-native";
import { Card, IconButton, List, Text, useTheme } from "react-native-paper";
import {
  responsiveFontSize,
  responsiveWidth,
} from "react-native-responsive-dimensions";

/**
 * getFileIconSource - Determines the icon source based on the file extension.
 * @param {string} extension - The file extension.
 * @returns {object} - The source path of the icon image.
 */

const getFileIconSource = (extension) => {
  switch (extension.toLowerCase()) {
    case "pdf":
      return require("../../assets/pdf.png");
    case "docx":
      return require("../../assets/docx_icon.svg.png");
    case "xlsx":
      return require("../../assets/xlsx_icon.svg.png");
    default:
      return require("../../assets/OneDrive_Folder_Icon.svg.png");
  }
};

export default function FileItem({ file, onIconPress, onDeletePress }) {
  const theme = useTheme();

  console.log("File extension:", file.extension);

  return (
    /*
    <Card>
      <Card.Title
        title={file.name}
        left={() => (
          <View style={{ alignItems: "center", justifyContent: "center" }}>
            <Image
              source={getFileIconSource(file.extension)}
              style={styles.fileIcon}
            />
          </View>
        )}
        right={() => (
          <View style={{ flexDirection: "row", alignItems: "center" }}>
            <TouchableOpacity onPress={onIconPress}>
              <IconButton
                icon="download"
                size={responsiveFontSize(3)}
                style={{ marginRight: responsiveFontSize(0.05) }}
              />
            </TouchableOpacity>
            <TouchableOpacity onPress={onDeletePress}>
              <IconButton icon="delete" size={responsiveFontSize(3)} />
            </TouchableOpacity>
          </View>
        )}
      />
    </Card>*/
    <List.Item
      style={{
        backgroundColor: theme.colors.secondaryContainer,
        paddingHorizontal: 8,
      }}
      title={file.name}
      left={() => (
        <View style={{ alignItems: "center", justifyContent: "center" }}>
          <Image
            source={getFileIconSource(file.extension)}
            style={styles.fileIcon}
          />
        </View>
      )}
      right={() => (
        <View
          style={{
            flexDirection: "row",
            alignItems: "center",
            marginRight: 10,
          }}
        >
          <TouchableOpacity onPress={onIconPress}>
            <IconButton
              icon="download"
              size={responsiveFontSize(3)}
              style={{ marginRight: responsiveFontSize(0.05) }}
            />
          </TouchableOpacity>
          <TouchableOpacity onPress={onDeletePress}>
            <IconButton icon="delete" size={responsiveFontSize(3)} />
          </TouchableOpacity>
        </View>
      )}
    />
  );
}

const styles = StyleSheet.create({
  fileIcon: {
    width: responsiveFontSize(4),
    height: responsiveFontSize(4),
    borderRadius: responsiveFontSize(2),
    marginRight: 10,
    marginLeft: 10,
    //backgroundColor: "green",
  },
});
