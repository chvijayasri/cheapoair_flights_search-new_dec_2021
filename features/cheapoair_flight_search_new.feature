Feature: Cheapoair Fight search functionality
  Scenario: verify user is able to search for the available flights for a future dates
    Given user is on the Cheapoair Home page
#    When user selects the Flights tab
    And user search for the "Columbus" city and selects "CMH" airport for departure
    And user search for "Cleveland" city and selects "CLE" airport for arrival
    And user selects future dates for departure 10 days from today
    And user selects future dates for arrival 15 days from today
    And user searches for available flights
    Then verify user should see the available flight results


