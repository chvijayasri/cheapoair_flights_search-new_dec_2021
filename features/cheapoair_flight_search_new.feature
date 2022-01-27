@FlightSearch
Feature: Cheapoair Fight search functionality
@smoke
  #Imperative style
  Scenario: verify user is able to search for the available flights for a future dates
    Given user is on the Cheapoair Home page
#    When user selects the Flights tab
    And user searches for the Columbus city and selects CMH-Columbus,Ohio airport for departure
    And user searches for the Cleveland city and selects CLE-Cleveland,Ohio airport for arrival
    And user selects future dates for departure
    And user selects future dates for arrival
    And user searches for available flights
    Then verify user should see the available flight results

@sanity
  #Declarative style
  Scenario: verify user is able to search for the available flights for a future dates in Declarative style
    Given user is on the Cheapoair Home page
    When user search for the available flights for the future dates
    Then verify user should see the available flight results

   @jira_434_yml
  Scenario: verify user is able to search for the available flights for a future dates in yaml style
    Given user is on the Cheapoair Home page
    When user search for the available flights for the future dates with yaml data
    Then verify user should see the available flight results

  @jira_345
  # negative case
  Scenario: verify user is able to validate the mandatory search fields for ALL the fields for flight search
    Given user is on the Cheapoair Home page
    And user searches for the Columbus city and selects CMH - Columbus,Ohio airport for departure
    And user searches for the Cleveland city and selects CLE-Cleveland,Ohio airport for arrival
    When user leaves the departure and arrival city fields blank
#    And user selects future dates for departure
#    And user selects future dates for arrival
    And user searches for available flights
    Then user should see the following error messages:
      |error_messages                      |
      |Please enter a From city or airport.|
      |Please enter a To city or airport.  |
      |Please enter a Depart date.         |
      |Please enter a Return date.         |

  Scenario Outline:  verify user is able to search for the available flights for a future dates for different locations
    Given user is on the Cheapoair Home page
    And user searches for the <dep_city_name> city and selects <dep_airport_name> airport for departure
    And user searches for the <arr_city_name> city and selects <arr_airport_name> airport for arrival
    And user selects future dates for departure
    And user selects future dates for arrival
    And user searches for available flights
    And verify user should see the available flight results
    Examples:
      | dep_city_name | dep_airport_name | arr_city_name | arr_airport_name |
      | Columbus      | CMH              | Cleveland     | CLE              |
      |Milwaukee      |MKE               | LosAngels     | LAX              |
      |Chicago        |ORD               |Cincinnati     |CVG               |
  Scenario: validate the flight search results are displayed with sort order of  price
    Given user is on the Cheapoair Home page
    When user search for the available flights for the future dates
    Then verify user should see the available flight results
    And flight search results are displayed with sort order of the price
