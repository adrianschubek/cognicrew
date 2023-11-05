beforeEach(() => {
  cy.openApp();
  cy.login();
  cy.get('[href="/SettingsTab"]').click();
});

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

it("can change username", () => {
  
})