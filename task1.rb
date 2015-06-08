require 'selenium-webdriver'
require_relative 'methods'

home_page
register_as('user5')
sleep 2

fail 'Did not see msg' unless msg_is('Your account has been activated. You can now log in.')

@browser.close