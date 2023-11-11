import * as React from "react";
import { Button, Dialog, Portal, TextInput } from "react-native-paper";
import { StyleSheet} from "react-native";

export default function AddLinks({ showAddingLinks, close }) {
    return(
    <Portal>
        <Dialog visible={showAddingLinks} onDismiss={close}>

          <Dialog.Title>
            Add a new link
          </Dialog.Title>
          <Dialog.Content style={styles.container}>
                <TextInput
                placeholder="URL"
                />
           </Dialog.Content>

          <Dialog.Actions>
            <Button onPress={close} style={{ marginRight: 'auto' }}>Cancel</Button>
            <Button
              mode="contained"
              onPress={close}
            >
              Add link
            </Button>
          </Dialog.Actions>

        </Dialog>
    </Portal>
    );
}

const styles = StyleSheet.create({
    container: {

    },

});
  