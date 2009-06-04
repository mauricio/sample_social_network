Feature: Users should be able to share their thoughts using a blogging system

Users should be able to create blog postings in the website
and other users should be able to view and comment them.

Scenario: A User should be create a blog post and then view it
  Given that a user "testuser" with password "testpassword" and email "testemail@mail.com" exists
  Given that I am logged in as "testuser" with "testpassword"
  Given that I am at the new entry page
  Given that no entry with the "sample title" title exists
  When I fill in "entry_title" with "sample title"
  When I fill in "entry_description" with "sample description"
  When I fill in "entry_tag_list" with "sample tags"
  When I press "Create"
  Then I should see "Your entry was successfully created"
  Then I should be at the "sample title" entry page
  Then I should see "sample title"
  Then I should see "sample description"
  Then I should see "sample tags"
  Then I should see "testuser"

Scenario: Non logged in user should not be able to create entries
  Given that there are no users at the database
  When I go to the new entry page
  Then I should be at the new session page
  Then I should see "You have to be logged in to do that"

Scenario: A User should not be able to create a blog post without a title
  Given that a user "testuser" with password "testpassword" and email "testemail@mail.com" exists
  Given that I am logged in as "testuser" with "testpassword"
  Given that I am at the new entry page
  Given that no entry with the "sample title" title exists
  When I fill in "entry_description" with "sample description"
  When I fill in "entry_tag_list" with "sample tags"
  When I press "Create"
  Then I should see "There were problems with the following fields"
  Then I should be at the entries page

Scenario: A User should be able to edit a blog entry he created
  Given that a user "testuser" with password "testpassword" and email "testemail@mail.com" exists
  Given that no entry with the "sample title" title exists
  Given that no entry with the "new sample title" title exists
  Given that the user "testuser" created an entry with the "sample title" title, "sample description" description and the "sample tags" tags
  Given that I am logged in as "testuser" with "testpassword"
  Given that I am at the edit "sample title" entry page
  When I fill in "entry_title" with "new sample title"
  When I fill in "entry_description" with "awesomely new description"
  When I press "Update"
  Then I should see "Your entry was successfully updated"
  Then I should be at the "new sample title" entry page
  Then I should see "new sample title"
  Then I should see "awesomely new description"
  Then I should see "sample tags"