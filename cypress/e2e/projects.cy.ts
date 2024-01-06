describe("Projects Functionality", () => {
  beforeEach(() => {
    cy.openApp();
    cy.login();
    cy.get('[href="/_main_/LearningProjectsTab"]').click();
  });

  const PROJECT = {
    title: "Physics " + (Math.random() + 1).toString(36).substring(7),
    description: "Einstein's craft",
    semester: "",
    tags: ["difficult", "interesting"],
    visibility: "",
  };


  it("can create project", function () {
   
   // Create project
   cy.get('[data-testid="icon-button"]').click();
   cy.get('[data-testid="input-project-title"]').click().type(PROJECT.title);
   cy.get('[data-testid="input-project-description"]').click().type(PROJECT.description);
   cy.get('[data-testid="input-project-semester"]').click();
   cy.contains('button', 'Multi-term').click();
   cy.get('[data-testid="input-project-tags"]').click().type(PROJECT.tags[0] + ", " + PROJECT.tags[1]);
   cy.get('[data-testid="create-project-button"]').click();
   
   // Check for the success message
   cy.contains('Project created').should('be.visible');

   // cy.get('[data-testid="input-project-visibility"]').click();
 });

  it("can delete project", function () {

   cy.on('uncaught:exception', (err, runnable) => {
      // returning false here prevents Cypress from failing the test caused by the exception
      return false;
   });

   cy.get('[data-testid="select-project-button"]').first().click();
   cy.get('[data-testid="project-settings-button"]').click();
   cy.get('[data-testid="delete-project-button"]').scrollIntoView().click()
   cy.contains('button', 'OK').click();
 });

});
