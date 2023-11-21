import * as React from "react";
import {
  StyleSheet,
} from "react-native";
import { useState } from "react";
import {
  Dialog,
  Portal,
  Button,
  TextInput,
  useTheme,
} from "react-native-paper";
import { responsiveFontSize, responsiveHeight } from "react-native-responsive-dimensions";

export default function AddFriend({showAddFriendPopup, close, addFriend}){
    const theme = useTheme();
    const [newFriendName, setNewFriendName] = useState("");
    const handleNewFriendNameChange = (name) => {
        setNewFriendName(name);
      };
      const handleAddNewFriend = () => {
        addFriend(newFriendName);
       close();
        setNewFriendName("");
      };
      

    return(
        <Portal>
        <Dialog visible={showAddFriendPopup} onDismiss={close}>
          <Dialog.Title>
            Get in touch with your colleagues - Add New Friend
          </Dialog.Title>
          <Dialog.Content>
            <TextInput
              onChangeText={handleNewFriendNameChange}
              value={newFriendName}
              placeholder="Enter user's nickname"
            />
            <Button
              mode="contained"
              onPress={() => handleAddNewFriend()}
              style={styles.button}
            >
              Add Friend
            </Button>
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={close}>Cancel</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
    )
}
const styles = StyleSheet.create({
    button: {
      marginTop: responsiveHeight(1.3),
  }});
  