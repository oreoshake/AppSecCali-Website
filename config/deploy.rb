require 'bundler/capistrano'
require "rvm/capistrano"
require "rvm/capistrano/alias_and_wrapp"

default_run_options[:pty] = true  # Must be set for the password prompt
                                  # from git to work

set :deploy_to, "/var/www"
set :scm, "git"
set :user, "neil.matatall"  # The server's user for deploys
set :application, "appsec_california_2014"
set :repository,  "https://github.com/oreoshake/AppSecCali-Website.git"
set :branch, "master"
set :use_sudo, true
role :app, "162.209.14.65"
role :assets, "162.209.14.65"
role :web, "162.209.14.65"
role :db, "162.209.14.65", :primary => true

set :rvm_ruby_string, 'ruby-2.0.0-p195'
set :rvm_bin_path, "/home/neil.matatall/.rvm/bin/"

namespace :deploy do
	task :copy do
		run "#{try_sudo} cp /var/www/secrets/* ."
	end
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
after "deploy:update_code", "deploy:copy"
# after "deploy:update_code", "deploy:migrate"
# after "deploy:update", "newrelic:notice_deployment"

