Given /^that no entry with the "([^\"]*)" title exists$/ do |title|
  Entry.count( :conditions => { :title => title } ).should == 0
end

Given /^that the user "([^\"]*)" created an entry with the "([^\"]*)" title, "([^\"]*)" description and the "([^\"]*)" tags$/ do |login, title, description, tags|
  user = User.find_by_login!( login )
  user.entries.create!( :title => title, :description => description, :tag_list => tags )
end
