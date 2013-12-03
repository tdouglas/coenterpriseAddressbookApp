server "ec2-54-201-26-109.us-west-2.compute.amazonaws.com", :web, :app, :db, primary: true

set :application, "coenterpriseAddressbookApp"
set :user, "deploy"
set :deploy_to, "/home/#{user}/applications/#{application}"
set :use_sudo, false

set :repository,  "git@github.com:tdouglas/coenterpriseAddressbookApp.git"
set :deploy_via, :remote_cache
set :scm, :git
set :branch, "master"

set :domains, "ec2-54-201-26-109.us-west-2.compute.amazonaws.com"

#############################################################
#   Passenger
#############################################################

namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after :deploy, "passenger:restart"

desc "tail production log files"
task :tail_logs, :roles => :app do
  trap("INT") { puts 'Interupted'; exit 0; }
  run "tail -f #{shared_path}/log/production.log" do |channel, stream, data|
    puts  # for an extra line break before the host name
    puts "#{channel[:host]}: #{data}"
    break if stream == :err
  end
end

load "deploy/assets" #precompile assets
require 'bundler/capistrano' #bundle install after deploy

###################
# BOWER
###################
namespace :deploy do
  namespace :assets do
    desc 'install asset dependencies'
    task :install do
      run "cd #{latest_release} && bower install --no-color"
    end
  end
end

before 'deploy:assets:precompile', 'deploy:assets:install'
