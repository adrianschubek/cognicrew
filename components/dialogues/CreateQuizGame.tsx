import { Button, Dialog, Portal } from "react-native-paper";

export default function CreateQuizGame({ showCreateQuizGame, close }) {
  return (
    <Portal>
      <Dialog visible={showCreateQuizGame} onDismiss={close}>
        {
          <Dialog.Actions>
            <Button onPress={close}>Done</Button>
          </Dialog.Actions>
        }
      </Dialog>
    </Portal>
  );
}
