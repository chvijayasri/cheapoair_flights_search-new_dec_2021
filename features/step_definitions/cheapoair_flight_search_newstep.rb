Given(/^user is on the Cheapoair Home page$/) do
  visit CheapoairHomePageNew
end

And(/^user searches for the (.*) city and selects (.*) airport for departure$/) do |dep_city, dep_airport|
  on(CheapoairHomePageNew).search_dep_airport dep_city, dep_airport
end

And(/^user searches for the (.*)city and selects (.*) airport for arrival$/) do |arr_city, arr_airport|
  on(CheapoairHomePageNew).search_arr_airport arr_city, arr_airport
end

And(/^user selects future dates for departure$/) do
  on(CheapoairHomePageNew).choose_dep_date 2
end

And(/^user selects future dates for arrival$/) do
  on(CheapoairHomePageNew).choose_arr_date 3
end

And(/^user searches for available flights$/) do
  on(CheapoairHomePageNew).search_flights_element.click
end

Then(/^verify user should see the available flight results$/) do
  # on(CheapoairSearchResultsPage).verify_flights_displayed?
  actual_value = on(CheapoairSearchResultsPage).get_flight_results_header
  on(CheapoairSearchResultsPage).verify_expected_value_exists? actual_value, 'results found'
  # expect(actual_value).should include 'results found'
end

When(/^user search for the available flights for the future dates$/) do
  on(CheapoairHomePageNew).search_available_flights "Columbus","CMH -Columbus,Ohio","Cleveland","CLE - Cleveland,Ohio"
end

When(/^user leaves the departure and arrival city fields blank$/) do
  # on(CheapoairHomePageNew).dep_suggestion_box_element.click if on(CheapoairHomePageNew).dep_suggestion_box_element.present?
  # on(CheapoairHomePageNew).arr_suggestion_box_element.click if on(CheapoairHomePageNew).arr_suggestion_box_element.present?
  on(CheapoairHomePageNew) do |page|
    page.dep_suggestion_box_element.click if page.dep_suggestion_box_element.present?
    page.arr_suggestion_box_element.click if page.arr_suggestion_box_element.present?
  end
end

Then(/^user should see the following error messages:$/) do |table|
  # table is a table.hashes.keys # => [:Please enter a From city or airport. :Please enter a To City or airport.]
  all_error_messages = on(CheapoairHomePageNew).get_all_error_messages
  table.hashes.each do |each_error|   each_error['error_messages']
  current_error = each_error['error_messages']
  fail "#{current_error} message is NOT found in all the errors - #{all_error_messages} " unless all_error_messages.include? current_error
  sleep 5
  end
end

And(/^flight search results are displayed with sort order of the price$/) do
  # on(CheapoairSearchResultsPage).select_cheapest_flights_tab
  all_prices = on(CheapoairSearchResultsPage).get_all_flights_prices
  fail "#{all_prices} are not in the Sort Order" unless all_prices == all_prices.sort
end


When(/^user search for the available flights for the future dates with yaml data$/) do
  @data = YAML.load_file  'features/support/test data/test_data.yml'
  p @data['dep_city_name']
  p @data['arr_city_name']
  on(CheapoairHomePageNew) do |page|
    page.search_dep_airport  @data['dep_city_name'],@data['dep_airport_name']
    page.search_arr_airport  @data['arr_city_name'],@data['arr_airport_name']
    page.choose_dep_date 2
    page.choose_arr_date 3
    page.search_flights_element.click
  end
end