class CheapoairSearchResultsPage
  require_relative '../modules/utilities_module'
  include PageObject
  include UtilitiesModule

  div(:flight_results_header,class: 'filters--content col-12 p-0')
  li(:cheapest_flights_tab,class: 'col p-0 sort-tab__item is--tab-cheapest')
  divs(:all_flights,class: 'fare-details__fare')

  def get_flight_results_header
    flight_results_header_element.when_present(45).text
  end

  def selecting_cheapflights_tab
    cheapest_flights_tab_element.click
  end
  sleep 4
  def verify_flight_displayed?
    fail "Flight search results NOT found" unless flight_results_header_element.when_present(60).text.include? 'results found'
  end



  def get_all_flights_prices
    all_prices = []
    all_flights_elements.each  do |each_price|
      all_prices << each_price.text.gsub('$','').to_i
    end
    all_prices

  end

end