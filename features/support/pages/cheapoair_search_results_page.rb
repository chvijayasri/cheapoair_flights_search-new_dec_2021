class CheapoairSearchResultsPage
  include PageObject
  div(:search_results,class:'filters--content col-12 p-0')
  def actual_flight_results
    acutual_results=search_results_element.text.to_i
    p acutual_results
  end
end