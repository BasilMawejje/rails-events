Feature: User can see events and their info
  As a user
  In order to buy a ticket
  I would like to see a list of events and info about them

Background:

    Given the following events with associations exist
      | name         | description   | price | event_category_id | image        | alternate_image |
      | Sample event | lorem ipsum   |   100 | 1                 | allstar1.jpg | allstar2.jpg    |

    Then I navigate to the index page

  Scenario: user can view events
    Then I should see the text "Sample event"
    And I should see the text "100"
    Then I should see the button "Add to Cart"
