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
    clearLinks(): Chainable<Subject>;
    clearSets(): Chainable<Subject>;
    clearFlashcards(): Chainable<Subject>;

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
  cy.get('[data-testid="text-input-flat"]').first().clear().type("5r0yjo@test.de");
  cy.get('[data-testid="text-input-flat"]').last().clear().type("password");
  cy.get('[data-testid="login-button"]').click();
  cy.wait(500);
});

Cypress.Commands.add("logout", () => {
  cy.get('[href="/_main_/SettingsTab"]').click();
  cy.get('[data-testid="logout-button"]').click();
  cy.contains('button', 'Logout').click();
  cy.wait(500);
});

Cypress.Commands.add("relog", () => {
  cy.logout();
  cy.wait(500);
  cy.login();
});

Cypress.Commands.add("clearLinks", () => {
  cy.get("body").then((body) => {
    if (body.find('[data-testid="link-card"]').length > 0) {
      cy.get('[data-testid="link-card"]').each(() => {
        cy.get('[data-testid="vertical-dots-button"]').first().click();
        cy.get('[data-testid="delete-link-button"]').click();
        cy.wait(500);
      });
    }
  });
});

Cypress.Commands.add("clearSets", () => {
  // Check if any sets exist and delete them
  cy.get('body').then((body) => {
    if (body.find('[data-testid="flashcard-sets-list-adjust-button"]').length > 0) {
      cy.get('[data-testid="flashcard-sets-list-adjust-button"]').each(() => {
        cy.get('[data-testid="button-delete-set"]').first().click();
        cy.wait(500);
      });
    }
  });
});

Cypress.Commands.add("clearFlashcards", () => {
  cy.get('body').then(body => {
    if (body.find('[data-testid="flashcard-list-button"]').length > 0) {
      cy.get('[data-testid="flashcard-list-button"]').each(() => {
        cy.get('[data-testid="flashcard-list-button"]').first().click();
        cy.get('[data-testid="delete-flashcard-button"]').click();
        cy.wait(500);
      });
    }
  });
});




Cypress.Commands.add("createProject", (id: string) => {
  cy.get('[href="/_main_/LearningProjectsTab"]').click();
  cy.get('[data-testid="icon-button"]').click();
  cy.get('[data-testid="input-project-title"]').click().type(`title_${id}`);
  cy.get('[data-testid="input-project-description"]')
    .click()
    .type(`desc_${id}`);
  cy.get('[data-testid="input-project-semester"]').click();
  cy.contains("button", "Multi-term").click();
  cy.get('[data-testid="input-project-tags"]').click().type(`tags_${id}`);
  cy.get('[data-testid="create-project-button"]').click();
  cy.contains("Project created").should("be.visible");
  cy.contains("OK").click();
});

Cypress.Commands.add("deleteProject", (id: string) => {
  cy.get('[href="/_main_/LearningProjectsTab"]').click();
  cy.get('[data-testid="select-project-button"]')
    .contains(`title_${id}`)
    .click();
  cy.get('[data-testid="project-settings-button"]').click();
  cy.get('[data-testid="delete-project-button"]').click();
  cy.contains("OK").click();
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

// Is this code below here redundant to the code at the top?

declare namespace Cypress {
  interface Chainable<Subject> {
    openApp(): Chainable<void>;
    login(): Chainable<void>;
    logout(): Chainable<void>;
    relog(): Chainable<void>;
    createProject(id: string): Chainable<void>;
    deleteProject(id: string): Chainable<void>;
    // login(email: string, password: string): Chainable<void>
    // drag(subject: string, options?: Partial<TypeOptions>): Chainable<Element>
    // dismiss(subject: string, options?: Partial<TypeOptions>): Chainable<Element>
    // visit(url: string, options?: Partial<VisitOptions<Subject>>): Chainable<Subject>
  }
}
