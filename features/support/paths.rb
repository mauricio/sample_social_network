module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #
  def path_to(page_name)
    case page_name
    when /the homepage/
      '/'
    when /the sign up page/
      signup_path
    when /the login page/
      login_path
    when /the failed login page/
      session_path
    when /the failed sign up page/
      users_path
    when /^the (.*)'s profile page$/i
      user_path( User.find_by_login!( $1 ) )
    when /^the (.*)'s edit profile page$/i
      edit_user_path( User.find_by_login!( $1 ) )
    when /^the edit "([^\"]*)" entry page$/i
      edit_entry_path( Entry.find_by_title!($1) )
    when /^the "([^\"]*)" entry page$/i
      entry_path( Entry.find_by_title!($1) )
    when /^the (.*) page$/i
      send( "#{$1.gsub(/\W/, '_')}_path" )
    # Add more mappings here.
    # Here is a more fancy example:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
