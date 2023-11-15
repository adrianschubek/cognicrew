import { create } from "zustand";

type AlertInput = {
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
   * The type of the input.
   */
  type: "text" | "number" | "password" | "checkbox" | "button";
  /**
   * The validator function to use for the input. It should return true if the input is valid, and false otherwise.
   */
  validator: (inputValue: string) => boolean;
  /**
   * The error text to display if the input is invalid.
   */
  errorText: string;
  /**
   * Whether or not the input is disabled.
   */
  disabled?: boolean;
};

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
   * The alignment of the title.
   */
  titleAlign?: "left" | "center" | "right";
  /**
   * The message of the alert.
   */
  message: string;
  /**
   * The alignment of the message.
   */
  messageAlign?: "left" | "center" | "right";
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
   */
  okAction: (inputValues: string[]) => void;
  /**
   * The action to perform when the "Cancel" button is clicked.
   */
  cancelAction: (inputValues: string[]) => void;
  /**
   * The inputs to display in the alert.
   * @see AlertInput
   */
  inputs: Partial<AlertInput>[];
};

export const DEFAULT_ALERT: Alert = {
  icon: "information-outline",
  title: "",
  titleAlign: "center",
  message: "",
  messageAlign: "center",
  okText: "OK",
  cancelText: "",
  dismissable: true,
  okAction: () => {},
  cancelAction: () => {},
  inputs: [],
};

export const DEFAULT_ALERT_INPUT: AlertInput = {
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
            inputs: alert.inputs
              ? alert.inputs.map((input) => ({
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
