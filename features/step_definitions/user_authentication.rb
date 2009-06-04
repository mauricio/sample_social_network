Then /^the user "([^\"]*)" can log in with password "([^\"]*)"$/ do |login, password|
  fill_in "login", :with => login
  fill_in "password", :with => password
  click_button "Log In"
  response.should contain("Logged in successfully")
end

Given /^that I am logged in as "([^\"]*)" with "([^\"]*)"$/ do |login, password|
  visit new_session_path
  fill_in "login", :with => login
  fill_in "password", :with => password
  click_button "Log In"
end