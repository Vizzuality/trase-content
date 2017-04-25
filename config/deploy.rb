# config valid only for current version of Capistrano
#lock '3.6.1'

set :application, 'trase-content'
set :repo_url, 'git@github.com:Vizzuality/trase-content.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/trase-content'

append :linked_files, '.env'

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'vendor/bundle'

set :keep_releases, 5

namespace :deploy do
  after :finishing, 'deploy:cleanup'
  after 'deploy:publishing', 'deploy:restart'
end

set :rvm_ruby_version, '2.4.1'