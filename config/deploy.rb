set :user, 'root'
set :domain, '111.16.88.56'
set :application, "deopt"

set :repository,  "https://github.com/zhangliyue/deopt"
set :deploy_to, "/home/zhangyue/#{application}"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "111.16.88.56"                          # Your HTTP server, Apache/etc
#role :app, "127.0.0.1"                          # This may be the same as your `Web` server
# role :db,  "111.16.88.56", :primary => true # This is where Rails migrations will run
# role :db,  "127.0.0.1", :primary => true # This is where Rails migrations will run
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
 #  desc "cause restart"
    
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
   task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=production"
 end
end
  after "deploy:update_code", :bundle_install                                    # desc "install the necessary"
  task :bundle_install, :roles => :app do
   run "cd #{release_path}&& bundle install"
end
