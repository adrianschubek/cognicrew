import { type } from "cypress/types/jquery";
import { StyleProp, TextStyle } from "react-native";
import { create } from "zustand";

type CommonInput = {
  /**
   * The label to display for the input.
   */
  label: string;
  /**
   * The helper text to display for the input.
   */
  helperText: string;
  /**
   * The placeholder text to display for the input.
   */
  placeholder: string;
  /**
   * The default value of the input.
   */
  defaultValue: string;
  /**
   * Whether or not the input is required.
   */
  required: boolean;
  /**
   * The icon to display for the input.
   */
  icon: string;
  /**
   * The validator function to use for the input. It should return true if the input is valid, and false otherwise.
   * @param value The value of the input.
   * @param allValues All input values in the alert.
   */
  validator: (value: string, allValues: string[]) => boolean;
  /**
   * The error text to display if the input is invalid.
   */
  errorText: string;
  /**
   * Whether or not the input is disabled.
   */
  disabled?: boolean;
};

type TextInput = CommonInput & {
  /**
   * The type of the input.
   */
  type: "text" | "number" | "password";
};
type CheckboxInput = CommonInput & {
  type: "checkbox";
};
type ButtonInput = CommonInput & {
  type: "button";
  /**
   * The action to perform when the button is clicked.
   *
   * if the action returns `string`, the alert will NOT be dismissed and the string will be displayed as an error.
   *
   * Return an empty string to keep the input open without displaying an error.
   *
   * @param values All input values in the alert.
   */
  action: (values: string[]) => string | void | Promise<string | void>;
};
type SearchSelectInput = CommonInput & {
  type: "search-select";
  /**
   * key-value pairs of options to display in the select.
   */
  data: { key: string; value: string }[];
  /**
   * Number of options to display in the (virtualized) list.
   */
  visibleOptions: number;
};

type DropdownInput = CommonInput & {
  type: "dropdown";
  /**
   * key-value pairs of options to display in the select.
   */
  data: { key: string; value: string }[];
};

type AlertField =
  | TextInput
  | CheckboxInput
  | ButtonInput
  | SearchSelectInput
  | DropdownInput;

/* export function isTextInput(input: AlertField): input is TextInput {
  return input.type === "text" || input.type === "number" || input.type === "password";
}
export function isCheckboxInput(input: AlertField): input is CheckboxInput {
  return input.type === "checkbox";
}
export function isButtonInput(input: AlertField): input is ButtonInput {
  return input.type === "button";
}
export function isSearchSelectInput(input: AlertField): input is SearchSelectInput {
  return input.type === "search-select";
} */

export type Alert = {
  /**
   * The icon to display in the alert.
   */
  icon: string;
  /**
   * The title of the alert.
   */
  title: string;
  /**
   * Custom style for the title.
   */
  titleStyle: StyleProp<TextStyle>;
  /**
   * The message of the alert.
   */
  message: string;
  /**
   * Custom style for the message.
   */
  messageStyle: StyleProp<TextStyle>;
  /**
   * The text to display on the "OK" button.
   */
  okText: string;
  /**
   * The text to display on the "Cancel" button.
   */
  cancelText: string;
  /**
   * Whether or not the alert can be dismissed (e.g. by clicking outside of the alert).
   */
  dismissable: boolean;
  /**
   * The action to perform when the "OK" button is clicked.
   *
   * if the action returns `string`, the alert will NOT be dismissed and the string will be displayed as an error.
   *
   * Return an empty string to keep the input open without displaying an error.
   *
   * @param values All input values in the alert.
   */
  okAction: (values: string[]) => string | void | Promise<string | void>;
  /**
   * The action to perform when the "Cancel" button is clicked.
   *
   * if the action returns `string`, the alert will NOT be dismissed and the string will be displayed as an error.
   *
   * Return an empty string to keep the input open without displaying an error.
   *
   * @param values All input values in the alert.
   */
  cancelAction: (values: string[]) => string | void | Promise<string | void>;
  /**
   * The fields to display in the alert.
   * @see AlertField
   */
  fields: Partial<AlertField>[];
};

export const DEFAULT_ALERT: Alert = {
  icon: "information-outline",
  title: "",
  titleStyle: {},
  message: "",
  messageStyle: {},
  okText: "OK",
  cancelText: "",
  dismissable: true,
  okAction: () => {},
  cancelAction: () => {},
  fields: [],
};

export const DEFAULT_ALERT_INPUT: AlertField = {
  validator: () => true,
  label: "",
  helperText: "",
  placeholder: "",
  defaultValue: "",
  icon: "",
  required: false,
  type: "text",
  errorText: "",
  disabled: false,
  // @ts-expect-error FIXME
  action: () => {},
  visibleOptions: 5,
  data: [],
};

type AlertsStoreType = {
  /**
   * The current alert to display.
   */
  activeAlert: Alert;
  /**
   * The queue of alerts to display.
   */
  alerts: Alert[];
  /**
   * Creates a new alert and adds it to the queue.
   */
  dispatch: (alert: Partial<Alert>) => void;
  /**
   * Removes the current alert from the queue and sets the next alert as the current alert.
   */
  next: () => void;
};

/**
 * internal. do not use.
 *
 * @see Use `const { alert } = useAlerts();` instead.
 */
export const useAlertsStore = create<AlertsStoreType>((set, get) => ({
  activeAlert: null,
  alerts: [],
  dispatch: (alert: Alert) => {
    // ignore duplicate alerts already in queue
    if (
      get().alerts.some(
        (a) =>
          a.message === alert.message &&
          a.title === alert.title &&
          a.icon === alert.icon &&
          a.okText === alert.okText &&
          a.cancelText === alert.cancelText,
      )
    ) {
      return;
    }
    set((state) => ({
      alerts: [
        ...state.alerts,
        {
          ...DEFAULT_ALERT,
          ...{
            ...alert,
            fields: alert.fields
              ? alert.fields.map((input) => ({
                  ...DEFAULT_ALERT_INPUT,
                  ...input,
                }))
              : [],
          },
        },
      ],
    }));
  },
  next: () => {
    set((state) => ({
      alerts: state.alerts.slice(1),
      activeAlert: state.alerts[0],
    }));
  },
}));
