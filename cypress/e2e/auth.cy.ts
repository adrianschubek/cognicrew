beforeEach(() => {
  cy.openApp();
});


describe("Login", () => {

  const TEST_USER = Cypress.env('TEST_USER');

  it("can login with valid credentials", () => {
    cy.get('[data-testid="text-input-flat"]').first().type(TEST_USER.email);
    cy.get('[data-testid="text-input-flat"]').last().type(TEST_USER.pw);
    cy.get('[data-testid="login-button"]').click();
    cy.contains(`Hello, ${TEST_USER.username}`).should("exist");
  });

  it("cannot login with invalid email", () => {
    cy.get('[data-testid="text-input-flat"]').first().type("wrong@wrong.de");
    cy.get('[data-testid="text-input-flat"]').last().type(TEST_USER.pw);
    cy.get('[data-testid="login-button"]').click();
    cy.contains("Invalid login credentials").should("exist");
  });

  it("cannot login with invalid password", () => {
    cy.get('[data-testid="text-input-flat"]').first().type(TEST_USER.email);
    cy.get('[data-testid="text-input-flat"]').last().type("wrong");
    cy.get('[data-testid="login-button"]').click();
    cy.contains("Invalid login credentials").should("exist");
  });

  it("cannot login with empty email", () => {
    cy.get('[data-testid="text-input-flat"]').last().type(TEST_USER.pw);
    cy.get('[data-testid="login-button"]').click();
    cy.contains("Invalid login credentials").should("exist");
  });

  it("cannot login with empty password", () => {
    cy.get('[data-testid="text-input-flat"]').first().type(TEST_USER.email);
    cy.get('[data-testid="login-button"]').click();
    cy.contains("Invalid login credentials").should("exist");
  });

  it("should not allow login with empty fields", () => {
    cy.get('[data-testid="login-button"]').click();
    cy.contains("Invalid login credentials").should("exist");
  });

  it("should persist user session after app reload", () => {
    cy.login();
    cy.reload();
    // after app reload, check if user remains logged in
    cy.contains(`Hello, ${TEST_USER.username}`).should("exist");
  });
  
  
});

describe("Logout", () => {
  it("can logout", () => {
    cy.login();
    cy.wait(500);
    cy.logout();
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
