/**
 * FileItem - Component for rendering individual file items.
 * @param {object} props - Contains the file object, onIconPress and onDeletePress functions.
 */

import React from "react";
import { StyleSheet, View, Image, TouchableOpacity } from "react-native";
import { IconButton, Text, useTheme } from "react-native-paper";
import { responsiveFontSize } from "react-native-responsive-dimensions";

/**
 * getFileIconSource - Determines the icon source based on the file extension.
 * @param {string} extension - The file extension.
 * @returns {object} - The source path of the icon image.
 */

const getFileIconSource = (extension) => {
  switch (extension) {
    case ".pdf":
      return require("../../assets/pdf.png");
    case ".docx":
      return require("../../assets/docx_icon.svg.png");
    case ".xlsx":
      return require("../../assets/xlsx_icon.svg.png");
    default:
      return require("../../assets/OneDrive_Folder_Icon.svg.png");
  }
};

export default function FileItem({ file, onIconPress, onDeletePress }) {
  const theme = useTheme();

  return (
    <View
      style={[
        styles.item,
        {
          backgroundColor: theme.colors.surface,
          shadowColor: theme.colors.shadow,
        },
      ]}
    >
      <Image
        source={getFileIconSource(file.extension)}
        style={styles.fileIcon}
      />
      <Text style={styles.itemText}>{file.name}</Text>
      <View style={styles.iconsContainer}>
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
    </View>
  );
}

const styles = StyleSheet.create({
  item: {
    flexDirection: "row",
    alignItems: "center",
    paddingVertical: responsiveFontSize(1),
    paddingHorizontal: responsiveFontSize(1.5),
    borderRadius: responsiveFontSize(1),
    marginVertical: responsiveFontSize(0.5),
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.22,
    shadowRadius: 2.22,
    elevation: 3,
  },
  fileIcon: {
    width: responsiveFontSize(4),
    height: responsiveFontSize(4),
    borderRadius: responsiveFontSize(2),
    marginRight: responsiveFontSize(1),
  },
  itemText: {
    flex: 1,
    fontSize: responsiveFontSize(2),
    marginLeft: responsiveFontSize(1),
  },
  iconsContainer: {
    flexDirection: "row",
    alignItems: "center",
  },
});
