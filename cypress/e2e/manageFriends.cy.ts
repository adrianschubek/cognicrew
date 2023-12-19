describe('Manage Friends Functionality', () => {
  beforeEach(() => {
    cy.openApp();
    cy.login();
    cy.get('[href="/_main_/SettingsTab"]').click();
  });

  // The only friend in the test user's friend's list
  const FRIEND = {
    nickname: "alexlanz"
  };

  it('searchFriend', function() {
    // Search has no match thus results empty list
    cy.get('input[placeholder="Search friends"]').type('b');
    cy.contains(FRIEND.nickname).should('not.exist');
    cy.get('input[placeholder="Search friends"]').clear()

    // Search for substring of the friend and make sure he is still within the list
    cy.get('input[placeholder="Search friends"]').type(FRIEND.nickname.substring(0, 4));
    cy.contains(FRIEND.nickname).should('be.visible');

    // Search for the friend with complete nickname and make sure he is still within the list
    cy.get('input[placeholder="Search friends"]').type(FRIEND.nickname.slice(-4));
    cy.contains(FRIEND.nickname).should('be.visible');
  });

  it('addFriendNonExistent', function() {
    // Open the add friend dialog
    cy.get('[data-testid="plus-add-friend-button"]').click();
    // Type in a nickname that doesn't exist
    cy.get('[data-testid="text-input-flat"]').last().click().type('nonexistentfriend');
    // Submit the form by clicking the 'Add Friend' button
    cy.contains('button', 'Add Friend').click();
    // Check for the error message
    cy.contains('There is no friend with this nickname').should('be.visible');
  });

})