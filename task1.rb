require 'selenium-webdriver'
require_relative 'methods'

#registration
home_page
register_as('Secondtest.user')

#log out
log_out
register_as('Firsttest.user')
sleep 2
fail 'Did not see msg' unless msg_is('Your account has been activated. You can now log in.')

#change password
change_passw
fail 'Passw is not updated' unless msg_is('Password was successfully updated.')

#create project
create_project('Fisrttestproject')
fail 'Project is not created' unless msg_is('Successful creation.')

#create project version
project_version('Firsttestprojectversion')
fail 'Project is not created' unless msg_is('Successful creation.')

#add user to project
second_user

#edit user role

#create issues
create_issues

#issues visibility



#Log out
log_out

login_as('Secondtest.user')
close