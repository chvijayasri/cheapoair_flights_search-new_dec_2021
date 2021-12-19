Given(/^user is on the Cheapoair Home page$/) do
  visit CheapoairHomePageNew
end

# When(/^user selects the Flights tab$/) do
#   on(CheapoairHomePageNew).selecting_flights_tab_element.click
#   sleep 2
# end

And(/^user search for the "([^"]*)" city and selects "([^"]*)" airport for departure$/) do |dep_airport, dep_airport_code|
  on(CheapoairHomePageNew).search_dep_airport dep_airport, dep_airport_code
end

And(/^usser searchs for "([^"]*)" city and selects "([^"]*)" airport for arrival$/) do |arr_airport, arr_airport_code|
  on(CheapoairHomePageNew).search_arr_airport arr_airport, arr_airport_code
end

And(/^user selects future dates for departure (\d+) days from today$/) do |no_of_days|
  on(CheapoairHomePageNew).choose_dep_date no_of_days
end

And(/^user selects future dates for arrival (\d+) days from today$/) do |no_of_days|
  on(CheapoairHomePageNew).choose_arr_date no_of_days
end

And(/^user searches for avaialble flights$/) do
  on(CheapoairHomePageNew).search_flights
  sleep 2
end

Then(/^verify user should see the available flight results$/) do
  on(CheapoairSearchResultsPage).actual_flight_results
end
