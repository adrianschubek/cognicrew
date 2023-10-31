import { createContext } from "react";

export const PreferencesContext = createContext({
  toggleTheme: () => {},
  darkmode: false,
});
