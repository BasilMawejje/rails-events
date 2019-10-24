Feature: The welcome page
  As a User
  in order to buy a ticket
  I need to visit a landing page

  Scenario: User visits the site
    Given I navigate to the index page
    Then I should see "Featured Events"
