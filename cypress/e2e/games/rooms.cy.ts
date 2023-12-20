const id = (Math.random() + 1).toString(36).substring(7);

beforeEach(() => {
  cy.openApp();
  cy.login();
  cy.createProject(id);
});

afterEach(() => {
  cy.openApp();
  cy.deleteProject(id);
});

describe("Room", () => {
  it("can create room, lock/unlock room and delete room", () => {
    cy.get('[data-testid="select-project-button"]')
      .contains(`title_${id}`)
      .click();

    cy.contains("Create Room").click({ force: true });

    cy.get('[data-testid="play-surface"]')
      .find("button")
      .contains("Create")
      .click({ force: true });

    cy.contains("Room is open").should("be.visible");
    cy.contains("Delete Room").should("be.visible");

    cy.contains("Room is open").click();
    cy.contains("Room is closed").should("be.visible");
    cy.contains("Room is closed").click();
    cy.contains("Room is open").should("be.visible");

    cy.contains("Delete Room").click();
  });

  /* it("cannot create a room with empty name", () => {
    // TODO
  }); */
});
