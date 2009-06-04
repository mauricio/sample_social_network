Feature: User authentication

To get users to use the application and interact with all features
they must be able to be authenticated on it using the login form

Scenario: Login using an existing account
  Given that a user "testuser" with password "testpassword" and email "testemail@mail.com" exists
  When I go to the login page
  Then the user "testuser" can log in with password "testpassword"

Scenario: Deny login for an inexistent user
  Given that no user "testuser" exists
  When I go to the login page
  When I fill in "login" with "testuser"
  When I fill in "password" with "testpassword"
  When I press "Log in"
  Then I should be at the failed login page
  Then I should see "Couldn't log you in as 'testuser'"

Scenario: Deny login for an existent user if the password is incorrect
  Given that a user "testuser" with password "testpassword" and email "testemail@mail.com" exists
  When I go to the login page
  When I fill in "login" with "testuser"
  When I fill in "password" with "wrongpassword"
  When I press "Log in"
  Then I should be at the failed login page
  Then I should see "Couldn't log you in as 'testuser'"