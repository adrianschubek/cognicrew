import { Button, Dialog, Portal, Text, useTheme } from "react-native-paper";
import { useAlertsStore } from "../../stores/AlertsStore";
import { useEffect } from "react";

/**
 * controlled by zustand
 */
export default function AlertSyncZustand() {
  /* const {
    open,
    icon,
    title,
    message,
    setOpen,
    okAction,
    cancelAction,
    okText,
    cancelText, 
  }*/

  const activeAlert = useAlertsStore((state) => state.activeAlert);
  const alerts = useAlertsStore((state) => state.alerts);
  const next = useAlertsStore((state) => state.next);

  useEffect(() => {
   if (!activeAlert && alerts.length > 0) {
      next();
    }
  }, [activeAlert, alerts]);

  const theme = useTheme();

  if (!activeAlert) return null;

  const {
    icon,
    title,
    message,
    okAction,
    cancelAction,
    okText,
    cancelText,
    dismissable,
  } = activeAlert;

  return (
    <Portal>
      <Dialog
        visible={true}
        onDismiss={() => dismissable && next()}
        testID={icon + "_alert"}
      >
        {icon && (
          <Dialog.Icon color={theme.colors.primary} size={40} icon={icon} />
        )}
        {title && (
          <Dialog.Title style={{ textAlign: "center", marginTop: 8 }}>
            <Text style={{ color: theme.colors.primary }} variant="titleLarge">
              {title}
            </Text>
          </Dialog.Title>
        )}
        {message && (
          <Dialog.Content style={{ marginTop: !title ? 15 : undefined }}>
            <Text style={{ textAlign: "center" }} variant="bodyMedium">
              {message}
            </Text>
          </Dialog.Content>
        )}
        {(okText !== "" || cancelText !== "") && (
          <Dialog.Actions>
            {cancelText !== "" && (
              <Button
                onPress={() => {
                  cancelAction();
                  next();
                }}
              >
                {cancelText}
              </Button>
            )}
            {okText !== "" && (
              <Button
                onPress={() => {
                  okAction();
                  next();
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
