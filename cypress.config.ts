import { defineConfig } from "cypress";

export default defineConfig({
  experimentalStudio: true,
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
    env: {
      TEST_USER: {
        username: "test_5r0yjo",
        email: "5r0yjo@test.de",
        pw: "password",
      },
      DEMO_USER: {
        username:
          "TimoDerWuschelkopf" + (Math.random() + 1).toString(36).substring(7),
      },
    },
  },
  defaultCommandTimeout: 10000,
  screenshotOnRunFailure: false,
  video: false,
});
