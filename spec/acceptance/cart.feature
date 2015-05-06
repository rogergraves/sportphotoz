Feature: Cart testing

  @selenium
  Scenario: User adds photos to the cart
    Given Marathon 'Zombie Challenge 2015' exists and has a slug 'zombie2015'
    And Participant with BIB 123 exists and takes part in marathon 'Zombie Challenge 2015'
    And Participant with BIB 123 has a photo with name 'first.jpg'
    And Participant with BIB 123 has a photo with name 'second.jpg'
    And Participant with BIB 123 has a photo with name 'third.jpg'
    Then I am on page '/marathons/zombie2015/participants/123'
    And I should see 3 photos
    Then I buy 'second.jpg' photo
    And I click on link 'Continue Shopping'
    Then I buy 'third.jpg' photo
    And I click on link 'Continue Shopping'
    Then I am on page '/cart'
    And I should see 2 in the cart
    And I should see 'second.jpg' photo in the cart
    And I should see 'third.jpg' photo in the cart