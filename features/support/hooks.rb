require 'watir'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @browser = Watir::Browser.new  $browser_type
  @browser.driver.manage.window.maximize
end

After do
  @browser.close
end
After do |scenario|
  SCREENSHOTS_DIRECTORY = "html-report"
  if scenario.failed?
    #Saves screenshots to features/test_results/Screenshots directory, name is scenario name + timestamp
    time_stamp = Time.now.to_s.gsub('-','_').gsub(" ","_").gsub(':','_').gsub(/_8480/,'')
    screenshot = "#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}_#{time_stamp}.png"
    @browser.driver.save_screenshot(File.join(SCREENSHOTS_DIRECTORY, screenshot))
    embed(File.join(SCREENSHOTS_DIRECTORY, screenshot), "image/png", "SCREENSHOT")
  end
end
