import { Button, Dialog, Portal, Text, useTheme } from "react-native-paper";
import { useAlertsStore } from "../../stores/AlertsStore";

/**
 * controlled by zustand
 */
export default function AlertSyncZustand() {
  const {
    open,
    icon,
    title,
    message,
    setOpen,
    okAction,
    cancelAction,
    okText,
    cancelText,
  } = useAlertsStore();

  const theme = useTheme();

  return (
    <Portal>
      <Dialog visible={open} onDismiss={() => setOpen(false)}>
        {icon && (
          <Dialog.Icon color={theme.colors.primary} size={40} icon={icon} />
        )}
        {title && (
          <Dialog.Title style={{ textAlign: "center", marginTop: 8}}>
            <Text style={{color: theme.colors.primary}} variant="titleLarge">{title}</Text>
          </Dialog.Title>
        )}
        {message && (
          <Dialog.Content style={{  marginTop: !title ? 15 : undefined }}>
            <Text style={{textAlign: "center",}} variant="bodyMedium">{message}</Text>
          </Dialog.Content>
        )}
        {(okText !== "" || cancelText !== "") && (
          <Dialog.Actions>
            {cancelText !== "" && (
              <Button
                onPress={() => {
                  setOpen(false);
                  cancelAction();
                }}
              >
                {cancelText}
              </Button>
            )}
            {okText !== "" && (
              <Button
                onPress={() => {
                  setOpen(false);
                  okAction();
                }}
              >
                {okText}
              </Button>
            )}
          </Dialog.Actions>
        )}
      </Dialog>
    </Portal>
  );
}
