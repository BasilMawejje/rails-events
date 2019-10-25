Feature: Restaurant owner can get payment for order
  As a restaurant owner
  in order to get some money
  I need customers to pay on checkout.

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

  Scenario: I check out and pay with my credit card
#    And show me the page
    Given I click Pay with Card stripe button
    And I fill in my card details on the stripe form
    And I submit the stripe form
    Then I should be on the index page