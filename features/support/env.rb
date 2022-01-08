require 'rspec'
require 'page-object'
require 'data_magic'

# if ENV['browser']==nil
#   $browser_type = 'chrome'
#   else
#     $browser_type = ENV['browser']
#     end
# #$browser_type = ENV['browser'] = 'chrome'
# if ENV['env'] ==nil
# environment_name = ''
# else
#   $browser_type = ENV['env']
# end
#
# $url = "www.cheapoair#{environment_name}.com"

World(PageObject::PageFactory)