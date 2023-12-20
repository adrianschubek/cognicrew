describe("Cognilinks Functionality", () => {
    beforeEach(() => {
      cy.openApp();
      cy.login();
      cy.get('[href="/_main_/LearningProjectsTab"]').click();
      cy.get('[data-testid="select-project-button"]').first().click();
      cy.get('[data-testid="project-category-buttons"]').eq(2).click(); // 2 <=> "Cognilinks", but more dynamic than for example
                                                                        // cy.get('[data-testid="project-category-buttons"]').contains('Cognilinks').click();
    });
  
    const LINK1 = {
      title: "LOST - Viel Zu Heiss [Official Visualizer]",
      subtitle: "Club Banger",
      description: "Der Hit schallert auch bei Schnee",
      url: "https://www.youtube.com/watch?v=gbg-5WSgOmM",
    };
  
    const LINK2 = {
      title: "LOST - Viel Zu Kalt [Official Video]",
      subtitle: "Club Banger",
      description: "Der Hit schallert auch bei Sonne",
      url: "https://www.youtube.com/watch?v=IlVyg5nvuoI",
    };
  
     
    context("Add and Edit Links", () => {
      it("addLinkSuccess", function () {
        cy.clearLinks(); 
        cy.get('[data-testid="link-fab-button"]').click();
        cy.contains('button', 'Add new link').click();
        const linkValues = [LINK1.title, LINK1.subtitle, LINK1.description, LINK1.url];
        linkValues.forEach((value, index) => {
          cy.get('[data-testid="text-input-flat"]').eq(index).click().type(value);
        });
  
        cy.contains('button', 'Save').click();
        cy.get('[data-testid="link-card"]').should('exist');
        cy.get('[data-testid="link-card"]').should('contain', LINK1.title);
        cy.get('[data-testid="link-card"]').should('contain', LINK1.subtitle);
  
        // TODO: check URL as well
        cy.get('[data-testid="chevron-button"]').last().click();
        cy.get('[data-testid="link-card"]').should('contain', LINK1.description);
      });  
  
      it("addLink with missing mandatory fields", function () {
        cy.get('[data-testid="link-fab-button"]').click();
        cy.contains('button', 'Add new link').click();
      
        // Intentionally leave out mandatory fields (title, URL), e.g., only fill in the subtitle
        cy.get('[data-testid="text-input-flat"]').eq(1).click().type(LINK1.subtitle);
      
        // Assert that the 'Save' button is disabled
        cy.contains('button', 'Save').should('be.disabled');
      });
  
      it("editLink with empty mandatory fields", function () {
        cy.get('[data-testid="vertical-dots-button"]').first().click();
        cy.get('[data-testid="edit-link-button"]').click();     
      
        // Clear mandatory fields
        cy.get('[data-testid="text-input-flat"]').first().clear();
        cy.get('[data-testid="text-input-flat"]').last().clear();
      
        // Assert that the 'Save' button is disabled
        cy.contains('button', 'Save').should('be.disabled');
      });
  
      it("editLinkSuccess", function () {
        cy.get('[data-testid="vertical-dots-button"]').last().click();
        cy.get('[data-testid="edit-link-button"]').click();     
        const linkValues = [LINK2.title, LINK2.subtitle, LINK2.description, LINK2.url];
        linkValues.forEach((value, index) => {
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
        cy.get('[data-testid="link-fab-button"]').click();
        cy.contains('button', 'Add new link').click();
        const linkValues1 = [LINK1.title, LINK1.subtitle, LINK1.description, LINK1.url];
        linkValues1.forEach((value, index) => {
          cy.get('[data-testid="text-input-flat"]').eq(index).click().type(value);
        });
        cy.contains('button', 'Save').click();
  
        cy.get('[data-testid="link-fab-button"]').click();
        cy.contains('button', 'Add new link').click();
        const linkValues2 = [LINK2.title, LINK2.subtitle, LINK2.description, LINK2.url];
        linkValues2.forEach((value, index) => {
          cy.get('[data-testid="text-input-flat"]').eq(index).click().type(value);
        });
        cy.contains('button', 'Save').click();
        cy.wait(1500) // allows the added link cards to be fully rendered before proceeding to the tests, so that they they work as intended at all times
      });
      
     it("deleteLinksSuccess", function () {
      cy.get('[data-testid="chevron-button"]').last().click();  
      cy.get('[data-testid="link-card"]').should('contain', LINK2.description);
      cy.get('[data-testid="vertical-dots-button"]').last().click();
      cy.get('[data-testid="delete-link-button"]').click();   
      cy.wait(1500) // allows the deleted link card to disappear before proceeding, so test works as intended at all times
      cy.get('[data-testid="chevron-button"]').last().click();  
      cy.get('[data-testid="link-card"]').should('not.contain', LINK2.description);
      cy.get('[data-testid="link-card"]').should('contain', LINK1.description);
  
      cy.get('[data-testid="vertical-dots-button"]').last().click();
      cy.get('[data-testid="delete-link-button"]').click();
      cy.get('[data-testid="link-card"]').should('not.exist');
    });
  
    });
   
    // TODO: Share-popup does not work properly in web version?
    /* it("shareLink", function () {
      cy.get('[data-testid="share-link-button"]').first().click();
    }); */ 
    
  });
  