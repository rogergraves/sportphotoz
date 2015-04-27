Feature: About page testing

  @selenium
  Scenario: About page exists
    Given I am on home page
    And I click on link 'About'
    Then the page should show 'Aesthetic fixie meh, tilde retro tofu tote bag gastropub.'