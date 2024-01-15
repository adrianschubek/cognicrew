describe("Cognilinks Functionality", () => {
    beforeEach(() => {
      cy.openApp();
      cy.login();
      cy.get('[href="/_main_/LearningProjectsTab"]').click();
      cy.get('[data-testid="select-project-button"]').first().click();
      cy.get('[data-testid="project-category-buttons"]').eq(2).click(); // 2 <=> "Cognilinks", but more dynamic than for example
                                                                        // cy.get('[data-testid="project-category-buttons"]').contains('Cognilinks').click();
      cy.wait(1000);
    });
  
    const LINK1 = {
      title: "LOST - Viel Zu Heiss [Official Visualizer]" + (Math.random() + 1).toString(36).substring(7),
      subtitle: "Club Banger",
      description: "Der Hit schallert auch bei Schnee",
      url: "https://www.youtube.com/watch?v=gbg-5WSgOmM",
    };
  
    const LINK2 = {
      title: "LOST - Viel Zu Kalt [Official Video]" + (Math.random() + 1).toString(36).substring(7),
      subtitle: "Club Banger",
      description: "Der Hit schallert auch bei Sonne",
      url: "https://www.youtube.com/watch?v=IlVyg5nvuoI",
    };

    const linkValues1 = [LINK1.title, LINK1.subtitle, LINK1.description, LINK1.url];
    const linkValues2 = [LINK2.title, LINK2.subtitle, LINK2.description, LINK2.url];

     
    context("Add and Edit Links", () => {
      it("can add links", function () {
        cy.clearLinks(); 
        cy.get('[data-testid="link-fab-button"]').click();
        cy.contains('button', 'Add new link').click();
        linkValues1.forEach((value, index) => {
          cy.get('[data-testid="text-input-flat"]').eq(index).click().type(value);
        });
  
        cy.contains('button', 'Save').click();
        cy.get('[data-testid="link-card"]').should('exist');
        cy.get('[data-testid="link-card"]').should('contain', LINK1.title);
        cy.get('[data-testid="link-card"]').should('contain', LINK1.subtitle);
  
        cy.get('[data-testid="chevron-button"]').last().click();
        cy.get('[data-testid="link-card"]').should('contain', LINK1.description);
      });  
  
      it("can add link with missing mandatory fields", function () {
        cy.get('[data-testid="link-fab-button"]').click();
        cy.contains('button', 'Add new link').click();
      
        // Intentionally leave out mandatory fields (title, URL), e.g., only fill in the subtitle
        cy.get('[data-testid="text-input-flat"]').eq(1).click().type(LINK1.subtitle);
      
        // Assert that the 'Save' button is disabled
        cy.contains('button', 'Save').should('be.disabled');
      });
  
      it("can edit link with empty mandatory fields", function () {
        cy.get('[data-testid="vertical-dots-button"]').first().click();
        cy.get('[data-testid="edit-link-button"]').click();     
      
        // Clear mandatory fields
        cy.get('[data-testid="text-input-flat"]').first().clear();
        cy.get('[data-testid="text-input-flat"]').last().clear();
      
        // Assert that the 'Save' button is disabled
        cy.contains('button', 'Save').should('be.disabled');
      });
  
      it("can edit link", function () {
        cy.get('[data-testid="vertical-dots-button"]').last().click();
        cy.get('[data-testid="edit-link-button"]').click();     
        linkValues2.forEach((value, index) => {
          cy.get('[data-testid="text-input-flat"]').eq(index).click().clear().type(value);
        });
        cy.contains('button', 'Save').click();
        cy.get('[data-testid="chevron-button"]').last().click();
        cy.get('[data-testid="link-card"]').should('contain', LINK2.description); 
      });  
    }); 
    
    context("Delete Links", () => {
      beforeEach(() => {
        cy.clearLinks();  // Clear any existing links of previous tests - this approach ensures that each run of the delete tests starts in a consistent state, 
                          // independent of any prior test runs or leftover data, thereby ensuring robust and independent tests

        // Add links to ensure there is something to delete
        // Add LINK1
        cy.get('[data-testid="link-fab-button"]').click();
        cy.contains('button', 'Add new link').click();
        linkValues1.forEach((value, index) => {
          cy.get('[data-testid="text-input-flat"]').eq(index).click().type(value);
        });
        cy.contains('button', 'Save').click();
        cy.wait(1000) // allows the added link cards to be fully rendered before proceeding to the tests, so that they they work as intended at all times
  
        // Add LINK2
        cy.get('[data-testid="link-fab-button"]').click();
        cy.contains('button', 'Add new link').click();
        linkValues2.forEach((value, index) => {
          cy.get('[data-testid="text-input-flat"]').eq(index).click().type(value);
        });
        cy.contains('button', 'Save').click();
        cy.wait(1000); // allows the added link cards to be fully rendered before proceeding to the tests, so that they they work as intended at all times
      });
      
     it("can delete links", function () {
      cy.get('[data-testid="chevron-button"]').last().click();  
      cy.wait(1000);
      cy.get('[data-testid="link-card"]').should('contain', LINK2.description);
      cy.get('[data-testid="vertical-dots-button"]').last().click();
      cy.get('[data-testid="delete-link-button"]').click();   

      cy.wait(1000); // allows the deleted link card to disappear before proceeding, so test works as intended at all times
      cy.get('[data-testid="chevron-button"]').last().click();  
      cy.get('[data-testid="link-card"]').should('not.contain', LINK2.description);
      cy.get('[data-testid="link-card"]').should('contain', LINK1.description);
  
      cy.get('[data-testid="vertical-dots-button"]').last().click();
      cy.get('[data-testid="delete-link-button"]').click();
      cy.wait(1000);
      cy.get('[data-testid="link-card"]').should('not.exist');
    });
  
    });   
   
  });
  