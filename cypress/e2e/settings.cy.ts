beforeEach(() => {
  cy.openApp();
  cy.login();
  cy.get('[href="/_main_/SettingsTab"]').click(); // SettingsTab only leads to "initialRouteName={NAVIGATION.MANAGE_FRIENDS}", but not directly to Settings
  cy.contains("Settings").click({ force: true });
});

const DEMO_USER = Cypress.env('DEMO_USER');
const TEST_USER = Cypress.env('TEST_USER');

context("Username", () => {
  
  afterEach(() => {
    // change name back to original
    cy.get('[href="/_main_/SettingsTab"]').click();
    cy.contains("Settings").click({ force: true });
    cy.get('[data-testid="text-input-flat"]').eq(1).click().type(TEST_USER.username);
    cy.get('[data-testid="update-username-button"]').click();
  })
  
  // FIXME: race condition: orignal name vs. new name across test runs
  it("can change username", () => {
    // change username
    cy.get('[data-testid="text-input-flat"]').eq(1).click().type(DEMO_USER.username); // index 1 <=> input field for changing user name
    cy.get('[data-testid="update-username-button"]').click();
    cy.contains('Success').should('be.visible');
    cy.contains('button', 'OK').click();

    // relog and see if username is actually changed
    cy.relog();
    cy.contains(DEMO_USER.username).should('be.visible'); // FIXME: race condition fixed by afterEach above
  });

  it("should validate minimum username length", () => {
    const tooShortUsername = 'abc'; // less than 5 characters is not allowed
    cy.get('[data-testid="text-input-flat"]').eq(2).click().type(tooShortUsername);
    cy.get('[data-testid="update-username-button"]').should('be.disabled');
  });

  it("should validate maximum username length", () => {
    const tooLongUsername = 'a'.repeat(33); // more than 32 characters is not allowed
    cy.get('[data-testid="text-input-flat"]').eq(2).click().type(tooLongUsername);
    cy.get('[data-testid="update-username-button"]').should('be.disabled');
  });

})

it("can toggle dark/light mode", () => {
  cy.get("button").should("contains.text", "Darkmode");
  cy.get("button").should("not.contain.text", "Lightmode");
  cy.contains("Darkmode").click();
  cy.get("button").should("contains.text", "Lightmode");
  cy.get("button").should("not.contain.text", "Darkmode");
  cy.contains("Lightmode").click();
  cy.get("button").should("contains.text", "Darkmode");
  cy.get("button").should("not.contain.text", "Lightmode");
});