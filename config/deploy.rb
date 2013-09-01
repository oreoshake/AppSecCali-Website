require 'bundler/capistrano'


default_run_options[:pty] = true  # Must be set for the password prompt
                                  # from git to work

set :deploy_to, "/var/www"
set :scm, "git"
set :user, "neil.matatall"  # The server's user for deploys
set :application, "appsec_california_2014"
set :repository,  "https://github.com/oreoshake/AppSecCali-Website.git"
set :branch, "master"

set :deploy_via, :remote_cache
# set :deploy_via, :copy
set :use_sudo, true
role :app, "162.209.14.65"


namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# sudo "rvmsudo bundle install", :as => 'neil.matatall', :sudo => "/home/neil.matatall/.rvm/bin/rvmsudo"