class CheapoairHomePageNew
  include PageObject
  page_url "www.cheapoair.com"

  #@browser.link(aria_controls: 'panel-1').click
  link(:selecting_flights_tab, class: 'navigation_link', index: 0)
  link(:selecting_hotels_tab, class: 'navigation_link', index: 1)
  link(:selecting_cars_tab, class: 'navigation_link', index: 2)
  link(:selecting_packages_tab, class: 'navigation_link', index: 3)
  link(:selecting_activities_tab, class: 'navigation_link', index: 4)
  link(:clearing_the_text_dep, class: 'suggestion-box__clear icon', index: 0)
  link(:clearing_the_text_arr, class: 'suggestion-box__clear icon', index: 1)
  text_field(:set_dep_edit_box, id: 'from0')
  text_field(:set_arr_edit_box, id: 'to0')
  ul(:all_dep_airports, class: 'suggestion-box__list autoSuggest__list', index: 0)
  ul(:all_arr_airports, class: 'suggestion-box__list autoSuggest__list', index: 1)
  text_field(:clicking_on_dep_date, id: 'cal0')
  link(:selecting_dep_date, aria_label: @fut_dep_date)
  text_field(:clicking_on_arr_date, id: 'cal1')
  link(:selecting_arr_date, aria_label: @fut_arr_date)

  button(:search_flights, id: 'searchNow')
  div(:calendar_month, class: 'calendar_single-month active', index: 0)

  def search_dep_airport dep_airport, dep_airport_code
    #@browser.link(class: 'suggestion-box_clear icon').click if @browser.link(class: 'suggestion-box_clear icon').present?
    clearing_the_text_dep_element.click if clearing_the_text_dep_element.present?

    set_dep_edit_box_element.send_keys dep_airport
    # self.set_dep_edit_box = dep_airport(this can be used only for edit box and while usinf self no needof using self)
    sleep 2
    #@browser.text_field(id: 'from0').set dep_airport
    all_dep_airports_element.list_item_elements.each do |all_dep_airport|
      # _elements,lis is used in watir
      #.list_item_elements is used in page objects
      #.list
      p all_dep_airport.text
      if all_dep_airport.text.include? dep_airport_code
        all_dep_airport.click
        break
      end
    end
  end

  def search_arr_airport arr_airport, arr_airport_code
    clearing_the_text_arr_element.click if clearing_the_text_arr_element.present?
    set_arr_edit_box_element.send_keys arr_airport
    sleep 2
    # @browser.input(id: 'to0').set arr_airport
    # @browser.div(class: 'suggestion-box_content air is_visible').lis.each do |all_arr-airports|
    # we cannot use div right for unordered list,even it highlights the list values?
    all_arr_airports_element.list_item_elements.each do |all_arr_airports|
      p all_arr_airports.text
      if all_arr_airports.text.include? arr_airport_code
        all_arr_airports.click
        break
        # selecting all the airports ,Cleveland ,selects the second one
      end
    end
  end

  def cal_date no_of_days
    (Time.now + 24 * 60 * 60 * no_of_days).strftime("%-d %B %Y")
  end

  def choose_dep_date (no_of_days)
    clicking_on_dep_date_element.click
    # @fut_dep_date = cal_date no_of_days
    #we can make it as an instance variable.
    fut_dep_date = cal_date no_of_days
    #dep_date= '14 December 2021'
    # selecting_dep_date_element.click
    # in page object we cannot make names for dynamic values?
    @browser.a(aria_label: fut_dep_date).click
    # calender_month_element.a(aria_label: fut_dep_date).click
  end

  sleep 4

  def choose_arr_date (no_of_days)
    clicking_on_arr_date_element.click
    #@fut_arr_date = cal_date no_of_days
    fut_arr_date = cal_date no_of_days
    #arr_date = '30 December 2021'
    # selecting_arr_date_element.click
    @browser.a(aria_label: fut_arr_date).click
    # calendar_month_element.a(aria_label: fut_arr_date).click
  end

  def search_flights
    search_flights_element.click

  end

end