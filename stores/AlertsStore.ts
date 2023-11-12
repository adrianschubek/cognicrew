import { create } from "zustand";

export type AlertInput = {
  label: string;
  helperText: string;
  placeholder: string;
  defaultValue: string;
  required: boolean;
  icon: string;
  type: "text" | "number" | "password" | "checkbox";
  /**
   * //FIXME bug: inputValue can be undefined in AlertSyncZustand
   */
  validator: (inputValue: string | undefined) => boolean;
};

export type Alert = {
  icon: string;
  title: string;
  message: string;
  okText: string;
  cancelText: string;
  dismissable: boolean;
  okAction: (inputValues: string[]) => void;
  cancelAction: (inputValues: string[]) => void;
  inputs: Partial<AlertInput>[];
};

export const DEFAULT_ALERT: Alert = {
  icon: "information-outline",
  title: "",
  message: "",
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
