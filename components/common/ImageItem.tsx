import { FileObject } from "@supabase/storage-js";
import { Image, View, Text, TouchableOpacity } from "react-native";
import { useState } from "react";
import { supabase } from "../../supabase";
import { IconButton, useTheme } from "react-native-paper";
import { responsiveFontSize } from "react-native-responsive-dimensions";

const ImageItem = ({
  item,
  userId,
  onRemoveImage,
}: {
  item: FileObject;
  userId: string;
  onRemoveImage: () => void;
}) => {
  const [image, setImage] = useState<string>("");

  // Maybe adjust: This will trigger a "download" each time the component renders
  supabase.storage
    .from("files")
    .download(`${userId}/photos/${item.name}`)
    .then(({ data, error }) => {
      if (error) {
        console.error("Error downloading image:", error.message);
        return;
      }
      const fr = new FileReader();
      if (data) {
        fr.readAsDataURL(data);
        fr.onload = () => {
          setImage(fr.result as string);
        };
      }
    });

  const theme = useTheme();

  return (
    <View
      style={{
        flexDirection: "row",
        alignItems: "center",
        padding: 8,
        backgroundColor: theme.colors.surface,
        shadowColor: theme.colors.shadow,
        shadowOffset: { width: 0, height: 1 },
        shadowOpacity: 0.22,
        shadowRadius: 2.22,
        elevation: 3,
        marginVertical: 4,
        borderRadius: 4,
      }}
    >
      {image ? (
        <Image style={{ width: 80, height: 80 }} source={{ uri: image }} />
      ) : (
        <View
          style={{
            width: 80,
            height: 80,
            backgroundColor: theme.colors.onSurface,
          }}
        />
      )}
      <Text style={{ flex: 1, color: theme.colors.onSurface }}>
        {item.name}
      </Text>
      <TouchableOpacity onPress={onRemoveImage}>
        <IconButton icon="delete" size={responsiveFontSize(3)} />
      </TouchableOpacity>
    </View>
  );
};

export default ImageItem;
