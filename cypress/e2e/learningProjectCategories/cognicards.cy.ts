describe("Cognicards Functionality", () => {
  beforeEach(() => {
    cy.openApp();
    cy.login();
    cy.get('[href="/_main_/LearningProjectsTab"]').click();
    cy.get('[data-testid="select-project-button"]').first().click();
    cy.get('[data-testid="project-category-buttons"]').eq(0).click(); // 0 <=> "Cognicards", but more dynamic than for example
                                                                      // cy.get('[data-testid="project-category-buttons"]').contains('Cognilinks').click();
  });

  const FLASHCARD_1 = {
    question: "Question 1 " + (Math.random() + 1).toString(36).substring(7),
    answer: "Answer 1 " + (Math.random() + 1).toString(36).substring(7),
  };

  const FLASHCARD_2 = {
    question: "Question 2 " + (Math.random() + 1).toString(36).substring(7),
    answer: "Answer 2 " + (Math.random() + 1).toString(36).substring(7),
  };

  const FLASHCARD_3 = {
    question: "Question 3 " + (Math.random() + 1).toString(36).substring(7),
    answer: "Answer 3 " + (Math.random() + 1).toString(36).substring(7),
  };

  const EDIT_FLASHCARD_1 = {
    question: "Q 1 " + (Math.random() + 1).toString(36).substring(7),
    answer: "A 1 " + (Math.random() + 1).toString(36).substring(7),
  };

  const TEST_SET_1 = "Test Set 1 " + (Math.random() + 1).toString(36).substring(7);
  const TEST_SET_2 = "Test Set 2 " + (Math.random() + 1).toString(36).substring(7);
  const TEST_SET_3 = "Test Set 3 " + (Math.random() + 1).toString(36).substring(7);


  const EDIT_SET_1 = "Edited Set 1 " + (Math.random() + 1).toString(36).substring(7);
  const EDIT_SET_2  = "Edited Set 2 " + (Math.random() + 1).toString(36).substring(7);

  let numberOfSets = 0;

  function addAndValidateFlashcardSet(setName) {
    cy.get('[data-testid="input-create-new-set"]').click().type(setName);
    cy.get('[data-testid="button-create-new-set"]').click();
    cy.get('[data-testid="flashcard-sets-list-adjust-button"]').first().should('have.value', setName);
    numberOfSets++;
  }

  function addNewFlashcard(setName, flashcard) {
    cy.get('[data-testid="flashcard-fab-button"]').click();
    cy.contains('button', 'Add new flashcard').click();
    cy.get(`[aria-label="${setName}"]`).click();
    cy.get('[data-testid="input-flashcard-question"]').click().type(flashcard.question);
    cy.get('[data-testid="input-flashcard-answer"]').click().type(flashcard.answer);
    cy.get('[data-testid="add-new-flashcard-button"]').click();
    cy.wait(500); // wait for flashcard to render after pressing add button
  }
  
  context("Flashcard sets and flashcards", () => {
    
    beforeEach(() => {
      // navigate to the correct page before performing test
      cy.get('[data-testid="flashcard-fab-button"]').click();
      cy.contains('button', 'Create, delete and edit flashcard sets').click();
      cy.wait(1000)
    })
    
    context("Create and Edit Sets", () => { 
      it("can add flashcard set", function () {
        // check if there are any sets to clear
        cy.get('body').then(body => {
          if (body.find('[data-testid="flashcard-sets-list-adjust-button"]').length > 0) {
            cy.clearSets();
          }
        });
        // add three test sets for further testing and validate
        addAndValidateFlashcardSet(TEST_SET_1);
        addAndValidateFlashcardSet(TEST_SET_2);
        addAndValidateFlashcardSet(TEST_SET_3);
      });

      it("should have correct number of flashcard sets", function () {
        cy.wait(500)
        cy.get('[data-testid="flashcard-sets-list-adjust-button"]').should('have.length', numberOfSets);
      });    

      it("can add flashcard set with special characters", function () {
        const specialCharSetName = "Set!@#";
        addAndValidateFlashcardSet(specialCharSetName);
      });

      it("can handle (add) very long flashcard set names", function () {
        const longSetName = "Long".repeat(30);
        addAndValidateFlashcardSet(longSetName);
      });

      it("can edit flashcard set", function () {
        // edit first and last set
        cy.get('[data-testid="flashcard-sets-list-adjust-button"]').first().click().clear().type(EDIT_SET_1 + '{enter}'); 
        cy.get('[data-testid="flashcard-sets-list-adjust-button"]').first().should('have.value', EDIT_SET_1);   
        cy.get('[data-testid="flashcard-sets-list-adjust-button"]').last().click().clear().type(EDIT_SET_2 + '{enter}');
        cy.get('[data-testid="flashcard-sets-list-adjust-button"]').last().should('have.value', EDIT_SET_2);     
        cy.contains('button', 'Done').click();
        
        // check if edit was successful
        cy.wait(500)
        cy.contains('[data-testid="flashcard-sets-list-folder-button"]', EDIT_SET_1);
        cy.contains('[data-testid="flashcard-sets-list-folder-button"]', EDIT_SET_2);
      });

      it("can sort flashcard sets by both alphabetical and inverse alphabetical order", function () {
        cy.contains('button', 'Done').click();
        cy.get('[data-testid="flashcard-fab-button"]').click();
        cy.contains('button', 'Sort sets by').click();
      
        // function to check the sorting order - it encapsulates the logic for clicking a sorting option, waiting for the sort to complete and checking the order of the flashcard sets (alphabetical vs. inverse alphabetical)
        function checkSortingOrder(index, comparator) {
          cy.get('[data-testid="right-icon-adornment-container"]').eq(index).click();
          cy.contains('button', 'Accept').click();
          cy.wait(1000); // wait for sorting to complete
      
          cy.get('[data-testid="flashcard-sets-list-folder-button"]').then($buttons => {
            const setNames = $buttons.map((i, el) => Cypress.$(el).text()).get();
            const isOrderedCorrectly = setNames.every(comparator);
            expect(isOrderedCorrectly).to.be.true;
          });
        }
      
        // check alphabetical order <=> index 2
        checkSortingOrder(2, (el, i, arr) => i === 0 || arr[i - 1].localeCompare(el) <= 0);
      
        // re-open sorting options
        cy.get('[data-testid="flashcard-fab-button"]').click();
        cy.contains('button', 'Sort sets by').click();
      
        // check inverse alphabetical order <=> index 3
        checkSortingOrder(3, (el, i, arr) => i === 0 || arr[i - 1].localeCompare(el) >= 0);
      });    
    });

    
    context("Search Sets", () => {

      beforeEach(() => {
        cy.wait(500);
      })

      it("can search flashcard set by exact name", function () {
        cy.get('[data-testid="input-search-for-flashcard-set"]').click().type(EDIT_SET_1);
        cy.wait(500);
        cy.get('[data-testid="flashcard-sets-list-adjust-button"]').should('have.value', EDIT_SET_1);
      });

      const searchTerm = EDIT_SET_1.substring(0, 5);

      it("can search flashcard set by partial name", function () {
        cy.get('[data-testid="input-search-for-flashcard-set"]').click().type(searchTerm);
        cy.wait(500);
        cy.get('[data-testid="flashcard-sets-list-adjust-button"]').then($buttons => {

          // assert that each button is an HTMLInputElement and get its value
          const values = $buttons.toArray().map(el => (el as HTMLInputElement).value);
        
          // check if the values include EDIT_SET_1 and EDIT_SET_2
          expect(values).to.include(EDIT_SET_1);
          expect(values).to.include(EDIT_SET_2);
        });
      });      

      it("search is case insensitive", function () {
        cy.get('[data-testid="input-search-for-flashcard-set"]').click().type(searchTerm.toLowerCase());
        cy.wait(500);
        cy.get('[data-testid="flashcard-sets-list-adjust-button"]').then($buttons => {

          // assert that each button is an HTMLInputElement and get its value
          const values = $buttons.toArray().map(el => (el as HTMLInputElement).value);

          // check if the values include EDIT_SET_1 and EDIT_SET_2
          expect(values).to.include(EDIT_SET_1);
          expect(values).to.include(EDIT_SET_2);
        });
      });
    })

    
    context("Delete Sets", () => {
      
      beforeEach(() => {
        cy.get('body').then(body => {
          if (body.find('[data-testid="flashcard-sets-list-adjust-button"]').length > 0) {
            cy.clearSets();
          }
        });
        addAndValidateFlashcardSet(TEST_SET_1);
        addAndValidateFlashcardSet(TEST_SET_2);
        addAndValidateFlashcardSet(TEST_SET_3);
      })

      it("can delete all flashcard sets", function () {
        cy.clearSets();
        cy.get('[data-testid="flashcard-sets-list-adjust-button"]').should('have.length', 0);
      });  

      it("can delete a single flashcard set and retain order after deleting", function () {
        // delete the first set
        cy.get('[data-testid="button-delete-set"]').first().click();
        // check that the second set moves up and takes the place of deleted first set
        cy.get('[data-testid="flashcard-sets-list-adjust-button"]').first().should('have.value', TEST_SET_2);
      });
    });  


    context("Create and Edit Flashcards", () => {
 
     it("can add flashcard", function () {
       // create a consistent test environment consisting of the three predefined flashcard test sets
       cy.get('body').then(body => {
         if (body.find('[data-testid="flashcard-sets-list-adjust-button"]').length > 0) {
           cy.clearSets();
         }
       });
       addAndValidateFlashcardSet(TEST_SET_1);
       addAndValidateFlashcardSet(TEST_SET_2);
       addAndValidateFlashcardSet(TEST_SET_3);
       cy.contains('button', 'Done').click();

       addNewFlashcard(TEST_SET_1, FLASHCARD_1);
       
       // check if added successfully
       cy.contains('[data-testid="flashcard-sets-list-folder-button"]', TEST_SET_1).click();
       cy.contains('[data-testid="flashcard-list-button"]', FLASHCARD_1.question).click();
       cy.get('[data-testid="input-edit-flashcard-question"]').should('have.value', FLASHCARD_1.question);
       cy.get('[data-testid="input-edit-flashcard-answer"]').should('have.value', FLASHCARD_1.answer);
     }); 

     it("can edit flashcard", function () {
      cy.contains('button', 'Done').click();

      // navigate to exemplary flashcard
      cy.contains('[data-testid="flashcard-sets-list-folder-button"]', TEST_SET_1).click();
      cy.contains('[data-testid="flashcard-list-button"]', FLASHCARD_1.question).click();

      // edit and check question
      cy.get('[data-testid="input-edit-flashcard-question"]').should('have.value', FLASHCARD_1.question);
      cy.get('[data-testid="input-edit-flashcard-question"]').click().clear().type(EDIT_FLASHCARD_1.question);
      cy.get('[data-testid="input-edit-flashcard-question"]').should('have.value', EDIT_FLASHCARD_1.question);

      // edit and check answer
      cy.get('[data-testid="input-edit-flashcard-answer"]').should('have.value', FLASHCARD_1.answer);
      cy.get('[data-testid="input-edit-flashcard-answer"]').click({ force: true }).clear().type(EDIT_FLASHCARD_1.answer);
      cy.get('[data-testid="input-edit-flashcard-answer"]').should('have.value', EDIT_FLASHCARD_1.answer);
      
      // check question label to also reflect newest changes
      cy.contains('button', EDIT_FLASHCARD_1.question).click();
     });
  });


  context("Delete Flashcards", () => {
    // creates a consistent test environment for deletion tests
    beforeEach(() => {
      cy.contains('button', 'Done').click();

      // navigate to exemplary flashcard set and delete all flashcards
      cy.get('[data-testid="flashcard-sets-list-folder-button"]').first().click();
      cy.wait(500)
      cy.clearFlashcards();

      // add three new flashcards to TEST_SET_1
      addNewFlashcard(TEST_SET_1, FLASHCARD_1);
      addNewFlashcard(TEST_SET_1, FLASHCARD_2);
      addNewFlashcard(TEST_SET_1, FLASHCARD_3);
    }); 
    
    it("can delete single flashcard and retain order after deleting", function () {
      cy.get('[data-testid="flashcard-list-button"]').first().click();

      // delete and check flashcard - Flashcard 2 will move up and take the place of Flashcard 1 after deletion
      cy.get('[data-testid="delete-flashcard-button"]').click();
      cy.get('[data-testid="flashcard-list-button"]').first().should('contain.text', FLASHCARD_2.question);
     }); 

     it("can delete all flashcards of a set and subsequently show empty set (helper) text", function () {
      cy.clearFlashcards();
      cy.get('[data-testid="empty-set-text"]').should('be.visible');
     }); 
  })

 });
});