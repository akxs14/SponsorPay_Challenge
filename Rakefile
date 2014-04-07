# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

SponsorPayChallenge::Application.load_tasks

#Add a task to the top of the rake -T list, to explain how to get the full list
#of tasks including rails and gem tasks
if ENV['LOAD_RAILS'] == '1'
  load_rails_environment
else
  desc "!!! Rails and gem tasks are not listed, rerun with LOAD_RAILS=1 to reveal"
  task :_README
end
