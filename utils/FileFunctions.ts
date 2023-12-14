import * as ImagePicker from "expo-image-picker";
import * as DocumentPicker from "expo-document-picker";
import { supabase } from "../supabase";
import { decode } from "base64-arraybuffer";
import * as FileSystem from "expo-file-system";
export async function selectAndUploadImage(filePath: string) {
  const options: ImagePicker.ImagePickerOptions = {
    mediaTypes: ImagePicker.MediaTypeOptions.Images,
    allowsEditing: true,
  };

  const result = await ImagePicker.launchImageLibraryAsync(options);
  if (!result.canceled) {
    const img = result.assets[0];
    const base64 = await FileSystem.readAsStringAsync(img.uri, {
      encoding: "base64",
    });
    //const fileName = img.fileName || `${new Date().getTime()}.${"png"}`;
    const fileName = `${new Date().getTime()}.${"png"}`;
    const filePathWithDocumentName = `${filePath}/${fileName}`;
    const contentType = "image/png";
    await supabase.storage
      .from("files")
      .upload(filePathWithDocumentName, decode(base64), { contentType });
  }
}
export async function selectAndUploadFile(
  filePath: string,
  onlyProjectIdGivenAsRootFolder?: boolean,
) {
  let result;
  try {
    result = await DocumentPicker.getDocumentAsync({
      type: "*/*", // Allow all file types
      copyToCacheDirectory: true,
    });
  } catch (error) {
    console.error("Error picking a document:", error);
    return;
  }
  if (result?.assets && result?.assets[0]) {
    const pickedFile = result.assets[0];
    //console.log(pickedFile.name, "|", pickedFile.fileName);
    const uri = pickedFile.uri;
    const mimeType = pickedFile.mimeType || "application/octet-stream";

    const isImage = mimeType.startsWith("image");
    let fileExtension = mimeType.split("/").pop();
    const folderPath = onlyProjectIdGivenAsRootFolder
      ? filePath + (isImage ? "/photos" : "/documents")
      : filePath;
    const newFileName = /*pickedFile.name || */ `${new Date().getTime()}.${fileExtension}`;
    const filePathWithDocumentName = `${folderPath}/${newFileName}`;
    const base64 = await FileSystem.readAsStringAsync(uri, {
      encoding: FileSystem?.EncodingType?.Base64,
    });

    const { error } = await supabase.storage
      .from("files")
      .upload(filePathWithDocumentName, decode(base64), {
        contentType: mimeType,
      });
    if (error) {
      console.error("Error uploading file:", error.message);
    } else {
      console.log("File uploaded successfully:", filePath);
    }
    return { isImage } as { isImage: boolean };
  }
}
