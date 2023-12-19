beforeEach(() => {
  cy.openApp();
});

// TODO: move to environment variables
const DEMO_USER = {
  username: "test_5r0yjo",
  email: "5r0yjo@test.de",
  pw: "password",
};

describe("Login", () => {
  it("can login with valid credentials", () => {
    cy.get('[data-testid="text-input-flat"]').first().type(DEMO_USER.email);
    cy.get('[data-testid="text-input-flat"]').last().type(DEMO_USER.pw);
    cy.get('[data-testid="login-button"]').click();
    cy.contains(`Hello, ${DEMO_USER.username}`).should("exist");
  });

  it("cannot login with invalid email", () => {
    cy.get('[data-testid="text-input-flat"]').first().type("wrong@wrong.de");
    cy.get('[data-testid="text-input-flat"]').last().type(DEMO_USER.pw);
    cy.get('[data-testid="login-button"]').click();
    cy.contains("Invalid login credentials").should("exist");
  });

  it("cannot login with invalid password", () => {
    cy.get('[data-testid="text-input-flat"]').first().type(DEMO_USER.email);
    cy.get('[data-testid="text-input-flat"]').last().type("wrong");
    cy.get('[data-testid="login-button"]').click();
    cy.contains("Invalid login credentials").should("exist");
  });

  it("cannot login with empty email", () => {
    cy.get('[data-testid="text-input-flat"]').last().type(DEMO_USER.pw);
    cy.get('[data-testid="login-button"]').click();
    cy.contains("Invalid login credentials").should("exist");
  });

  it("cannot login with empty password", () => {
    cy.get('[data-testid="text-input-flat"]').first().type(DEMO_USER.email);
    cy.get('[data-testid="login-button"]').click();
    cy.contains("Invalid login credentials").should("exist");
  });
});

describe("Logout", () => {
  it("can logout", () => {
    cy.login();
    cy.get('[href="/_main_/SettingsTab"]').click();
    cy.get('[data-testid="logout-button"]').click();
    cy.get('[style="background-color: rgb(71, 85, 182); border-color: rgba(0, 0, 0, 0); border-width: 0px; border-radius: 25px; margin-right: 0px; padding-right: 10px; padding-left: 10px; box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px;"] > [data-testid="button"] > .css-view-175oi2r > [data-testid="button-text"]').click();
    cy.get('[data-testid="login-button"]').should('contain.text', 'Login');
  });
});

// describe("Register", () => {
  // const userID = Math.random().toString(36).substring(7);
  // it("can register with valid credentials", () => {
  //   cy.get('[data-testid="register-button"]').click();
  //   cy.get('[data-testid="username-input-register"]').type(`test_${userID}`);
  //   cy.get('[data-testid="email-input-register"]').type(`${userID}@test.de`);
  //   cy.get('[data-testid="password-input-register"]').type("password");
  //   cy.get('[data-testid="password2-input-register"]').type("password");
  //   cy.get('[data-testid="register-button-modal"]').click();
  //   cy.get('[data-testid="check_alert-surface"]').should("be.visible");
  // });
  // it("cannot register with duplicate username", () => {
  //   cy.get('[data-testid="register-button"]').click();
  //   cy.get('[data-testid="username-input-register"]').type(`test_${userID}`);
  //   cy.get('[data-testid="email-input-register"]').type(`${userID}@test.de`);
  //   cy.get('[data-testid="password-input-register"]').type("password");
  //   cy.get('[data-testid="password2-input-register"]').type("password");
  //   cy.get('[data-testid="register-button-modal"]').click();
  //   cy.get('[data-testid="alert-circle_alert-surface"]').should("be.visible");
  // });
  // it("cannot register with invalid email", () => {});
// });
