
namespace :db do

  desc 'Simple task to re-generate the dev and tests databases'
  task :regenerate do
    envs = [ 'development', 'test' ]
    envs.each do |e|
      begin
        system( "rake db:drop RAILS_ENV=#{e}" )
      rescue
        puts 'database already droped'
      end
      system( "rake db:create RAILS_ENV=#{e}" )
      system( "rake db:migrate RAILS_ENV=#{e}" )
    end
  end

end