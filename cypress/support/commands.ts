/// <reference types="cypress" />
// ***********************************************
// This example commands.ts shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
declare namespace Cypress {
  interface Chainable<Subject> {
    openApp(): Chainable<Subject>;
  }
}

// temp fix for Alex' audio player bugs!
/* Cypress.on('uncaught:exception', (err, runnable) => {
  return false;
}); */

Cypress.Commands.add("openApp", () => {
  cy.viewport("samsung-s10");
  cy.visit("http://localhost:19006", { timeout: 300000 });
});

Cypress.Commands.add("login", () => {
  // TODO: use environment variables for auth
  cy.get('[data-testid="text-input-flat"]').first().type("5r0yjo@test.de");
  cy.get('[data-testid="text-input-flat"]').last().type("password");
  cy.get('[data-testid="login-button"]').click();
});

Cypress.Commands.add("logout", () => {
  cy.get('[href="/SettingsTab"]').click();
  cy.get('[data-testid="logout-button-icon-container"]').click();
  cy.get('[data-testid="logout-confirm-button-text"]').click();
});

//
// -- This is a parent command --
// Cypress.Commands.add('login', (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add('drag', { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add('dismiss', { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite('visit', (originalFn, url, options) => { ... })
//
declare namespace Cypress {
  interface Chainable<Subject> {
    openApp(): Chainable<Subject>;
    login(): Chainable<Subject>;
    logout(): Chainable<Subject>;
    // login(email: string, password: string): Chainable<void>
    // drag(subject: string, options?: Partial<TypeOptions>): Chainable<Element>
    // dismiss(subject: string, options?: Partial<TypeOptions>): Chainable<Element>
    // visit(url: string, options?: Partial<VisitOptions<Subject>>): Chainable<Subject>
  }
}
