Feature: Cheapoair Car search functionality
  Scenario: verify user is able to search for the cars availability
    Given user is on the Cheapoair Home page
    When user search for cars availability for future dates
     Then user should see the list of cars options

