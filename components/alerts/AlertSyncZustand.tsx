import {
  Button,
  Dialog,
  HelperText,
  Portal,
  Switch,
  Text,
  TextInput,
  useTheme,
} from "react-native-paper";
import { useAlertsStore } from "../../stores/AlertsStore";
import { Fragment, useEffect, useState } from "react";

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

  const [inputValues, setInputValues] = useState<string[]>([]);

  useEffect(() => {
    if (!activeAlert && alerts.length > 0) {
      next();
    }
  }, [activeAlert, alerts]);

  useEffect(() => {
    if (activeAlert && activeAlert?.inputs.length !== 0) {
      setInputValues(
        activeAlert.inputs.map((field) => field.defaultValue ?? ""),
      );
    }
  }, [activeAlert]);

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
    inputs,
  } = activeAlert;

  return (
    <Portal>
      <Dialog
        visible={true}
        onDismiss={() => dismissable && next()}
        testID={icon + "_alert"}
        style={{ zIndex: 999999 }}
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
        {(message || inputs.length !== 0) && (
          <>
            <Dialog.Content style={{ marginTop: !title ? 15 : undefined }}>
              {message && (
                <Text style={{ textAlign: "center" }} variant="bodyMedium">
                  {message}
                </Text>
              )}
              {/* FIXME: Crashes in production */}
              {inputs.map((field, i) => (
                <Fragment key={i}>
                  {field.type === "checkbox" ? (
                    <>
                      <TextInput
                        style={{ marginTop: 10 }}
                        theme={{ roundness: 10 }}
                        value={field.label}
                        editable={false}
                        left={
                          field.icon && <TextInput.Icon icon={field.icon} />
                        }
                        right={
                          <TextInput.Icon
                            icon={() => (
                              <Switch
                                value={inputValues[i] === "true"}
                                onValueChange={() => {
                                  const newValues = [...inputValues];
                                  newValues[i] =
                                    inputValues[i] === "true"
                                      ? "false"
                                      : "true";
                                  setInputValues(newValues);
                                }}
                              />
                            )}
                          />
                        }
                      />
                      {field.helperText && (
                        <HelperText type="info" visible={true}>
                          {field.helperText}
                        </HelperText>
                      )}
                    </>
                  ) : (
                    <>
                      <TextInput
                        style={{ marginVertical: 2 }}
                        label={field.label}
                        placeholder={field.placeholder}
                        secureTextEntry={field.type === "password"}
                        left={
                          field.icon && <TextInput.Icon icon={field.icon} />
                        }
                        keyboardType={
                          field.type === "number" ? "number-pad" : "default"
                        }
                        value={inputValues[i]}
                        onChangeText={(text) => {
                          const newValues = [...inputValues];
                          newValues[i] = text;
                          setInputValues(newValues);
                        }}
                        error={
                          field.validator && !field.validator(inputValues[i])
                        }
                      ></TextInput>
                      {field.helperText && (
                        <HelperText type="info" visible={true}>
                          {field.helperText}
                        </HelperText>
                      )}
                    </>
                  )}
                </Fragment>
              ))}
            </Dialog.Content>
          </>
        )}
        {(okText !== "" || cancelText !== "") && (
          <Dialog.Actions>
            {cancelText !== "" && (
              <Button
                onPress={() => {
                  cancelAction(inputValues);
                  next();
                }}
              >
                {cancelText}
              </Button>
            )}
            {okText !== "" && (
              <Button
                onPress={() => {
                  okAction(inputValues);
                  next();
                }}
                disabled={
                  inputs.some(
                    (field, i) => field.required && inputValues[i].length === 0,
                  ) ||
                  inputs.some(
                    (field, i) =>
                      field.validator && !field.validator(inputValues[i]),
                  )
                }
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
