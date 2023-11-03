import { Button, Dialog, Portal, Text } from "react-native-paper";
import { useAlertsStore } from "../../stores/AlertsStore";

/**
 * controlled by zustand
 */
export default function AlertSyncZustand() {
  const { open, icon, title, message, setOpen } = useAlertsStore();

  return (
    <Portal>
      <Dialog visible={open} onDismiss={() => setOpen(false)}>
        <Dialog.Icon icon={icon} />
        {title && (
          <Dialog.Title>
            <Text variant="titleSmall">{title}</Text>
          </Dialog.Title>
        )}
        {<Dialog.Content>
          <Text variant="bodyMedium">{message}</Text>
        </Dialog.Content>}
        <Dialog.Actions>
          <Button onPress={() => setOpen(false)}>OK</Button>
        </Dialog.Actions>
      </Dialog>
    </Portal>
  );
}
