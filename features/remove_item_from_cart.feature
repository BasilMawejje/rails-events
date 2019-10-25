Feature: remove item from cart
  As a user
  In order to change my mind
  I would like to remove an event to the cart

  Background:
    Given the following user exists
      | email               | password |
      | example@example.com | password |

    And the following user is signed in
      | email               | password |
      | example@example.com | password |

    Given the following events with associations exist
      | name         | description   | price | event_category_id | image        | alternate_image |
      | Sample event | lorem ipsum   |   100 | 1                 | allstar1.jpg | allstar2.jpg    |

    And I navigate to the index page
    And I click "Add to Cart" link

  Scenario: User clicks add item
    Then I should be on the cart page
    Then I should see "You've selected 1 tickets!"
    And I click "remove from cart" icon
    Then I should see "You've selected 0 tickets!"