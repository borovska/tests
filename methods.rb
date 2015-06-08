require 'selenium-webdriver'

@browser=Selenium::WebDriver.for :firefox

def home_page
  @browser.get 'http://demo.redmine.org'
end

def msg_is( message)
  @browser.find_element(id: 'flash_notice').text.include? message

end

def register_as(login)
  @browser.find_element(class: 'register').click
  #login = DateTime.now.to_s
  @browser.find_element(id: 'user_login').send_keys login
  @browser.find_element(id:'user_password').send_keys '123456'
  @browser.find_element(id:'user_password_confirmation').send_keys '123456'
  @browser.find_element(id:'user_firstname').send_keys login
  @browser.find_element(id:'user_lastname').send_keys 'qwerty'
  @browser.find_element(id:'user_mail').send_keys(login+ '@qwe.qwe')
  @browser.find_element(name:'commit').click

end

def login_as (login)
  @browser.find_element(class: 'login').click
  @browser.find_element(id: 'username').send_keys login
  @browser.find_element(id: 'password').send_keys '123456'
  @browser.find_element(name: 'login').click
  sleep 2
  #@browser.find_element(id: 'loggedas').displayed?
end

def log_out
  @browser.find_element(class: 'logout').click
end

def change_passw
  @browser.find_element(class: 'my-account').click
  @browser.find_element(class: 'icon-passwd').click
  @browser.find_element(id:'password').send_keys '123456'
  @browser.find_element(id: 'new_password').send_keys '123123'
  @browser.find_element(id: 'new_password_confirmation').send_keys '123123'
  @browser.find_element(name: 'commit').click
end

def create_project (project)
  @browser.find_element(class: 'projects').click
  @browser.find_element(class: 'icon-add').click
  @browser.find_element(id:'project_name').send_keys project
  @browser.find_element(id:'project_identifier').send_keys (project + 'indifier')
  @browser.find_element(name:'commit').click
end

def project_version (version)
  @browser.find_element(id: 'tab-versions').click
  @browser.find_element(xpath: '//a[contains(text(),"New version")]').click
  @browser.find_element(id: 'version_name').send_keys version
  @browser.find_element(name: 'commit').click
end

#issues
def create_issues
  @browser.find_element(class: 'new-issue').click
  @browser.find_element(id: 'issue_tracker_id').click
  @browser.find_element(id: 'issue_subject').send_keys 'blah-blah'
  @browser.find_element(name: 'commit').click
end

#add user
def second_user
  @browser.find_element(id: 'tab-members').click
  @browser.find_element(class: 'icon-add').click
  @browser.find_element(id: 'principal_search').send_keys('Secondtest.user')
  @browser.find_element(value: '108595').click
end

def close
  @browser.close
end
