beforeEach(() => {
  cy.openApp();
});

describe("Login", () => {
  it("can login with valid credentials", () => {
    cy.get('[data-testid="text-input-flat"]').first().type("foo@bar.de");
    cy.get('[data-testid="text-input-flat"]').last().type("foobar");
    cy.get('[data-testid="login-button"]').click();
    cy.get('[href="/HomeTab"]').should("contain.text", "Feed");
  });

  it("cannot login with invalid email", () => {
    cy.get('[data-testid="text-input-flat"]').first().type("wrong@wrong.de");
    cy.get('[data-testid="text-input-flat"]').last().type("foobar");
    cy.get('[data-testid="login-button"]').click();
    cy.get('[data-testid="alert-circle_alert-surface"]').should("be.visible");
  });

  it("cannot login with invalid password", () => {
    cy.get('[data-testid="text-input-flat"]').first().type("foo@bar.de");
    cy.get('[data-testid="text-input-flat"]').last().type("wrong");
    cy.get('[data-testid="login-button"]').click();
    cy.get('[data-testid="alert-circle_alert-surface"]').should("be.visible");
  });

  it("cannot login with empty email", () => {
    cy.get('[data-testid="text-input-flat"]').last().type("foobar");
    cy.get('[data-testid="login-button"]').click();
    cy.get('[data-testid="alert-circle_alert-surface"]').should("be.visible");
  });

  it("cannot login with empty password", () => {
    cy.get('[data-testid="text-input-flat"]').first().type("foo@bar.de");
    cy.get('[data-testid="login-button"]').click();
    cy.get('[data-testid="alert-circle_alert-surface"]').should("be.visible");
  });
});

describe("Logout", () => {
  it("can logout", () => {
    cy.login();
    cy.get('[href="/SettingsTab"]').click();
    cy.get('[data-testid="logout-button-icon-container"]').click();
    cy.get('[data-testid="logout-confirm-button-text"]').click();
    cy.get('[data-testid="login-button"] ').should("contain.text", "Login");
  });
});

describe("Register", () => {
  const newUsername = "test_" + Math.random().toString(36).substring(7);
  it("can register with valid credentials", () => {
    cy.get('[data-testid="register-button"]').click();
  });

  it("cannot register with duplicate username", () => {});

  it("cannot register with invalid email", () => {});
});
