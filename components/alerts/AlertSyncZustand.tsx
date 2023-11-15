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
 * Universal alert component that can be used to display alerts.
 * @see useAlerts
 */
export default function AlertSyncZustand() {
  const activeAlert = useAlertsStore((state) => state.activeAlert);
  const alerts = useAlertsStore((state) => state.alerts);
  const next = useAlertsStore((state) => state.next);

  const [inputValues, setInputValues] = useState<string[]>([]); // fixed by [""]

  useEffect(() => {
    if (!activeAlert && alerts?.length > 0) {
      next();
    }
  }, [activeAlert, alerts]);

  useEffect(() => {
    if (activeAlert) {
      setInputValues(() =>
        activeAlert?.inputs?.length !== 0
          ? activeAlert.inputs.map((field) => field.defaultValue ?? "")
          : [],
      );
    }
  }, [activeAlert]);

  const theme = useTheme();

  // Fixed: inputvalues may not be set but activeAlert is set during first render. => undefined
  if (
    !activeAlert ||
    (activeAlert?.inputs?.length !== 0 && inputValues.length === 0)
  )
    return null;

  const {
    icon,
    title,
    titleStyle,
    message,
    messageStyle,
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
            <Text
              style={{ color: theme.colors.primary, ...(titleStyle as {}) }}
              variant="titleLarge"
            >
              {title}
            </Text>
          </Dialog.Title>
        )}
        {(message || inputs?.length !== 0) && (
          <>
            <Dialog.Content style={{ marginTop: !title ? 15 : undefined }}>
              {message && (
                <Text
                  style={{ textAlign: "center", ...(messageStyle as {}) }}
                  variant="bodyMedium"
                >
                  {message}
                </Text>
              )}
              {inputs.map((field, i) => (
                <Fragment key={i}>
                  {field.type === "checkbox" ? (
                    <>
                      <TextInput
                        style={{ marginVertical: 2, marginTop: 10 }}
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
                      {field.errorText && !field.validator(inputValues[i]) && (
                        <HelperText type="error" visible={true}>
                          {field.errorText}
                        </HelperText>
                      )}
                    </>
                  ) : field.type === "button" ? (
                    <></>
                  ) : (
                    <>
                      <TextInput
                        style={{ marginVertical: 2, marginTop: 10 }}
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
                        disabled={field.disabled}
                      ></TextInput>
                      {field.helperText && (
                        <HelperText type="info" visible={true}>
                          {field.helperText}
                        </HelperText>
                      )}
                      {field.errorText && !field.validator(inputValues[i]) && (
                        <HelperText type="error" visible={true}>
                          {field.errorText}
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
                disabled={inputs?.some(
                  (field, i) =>
                    field.required &&
                    (inputValues[i]?.length === 0 ||
                      (field.validator && !field.validator(inputValues[i]))),
                )}
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
