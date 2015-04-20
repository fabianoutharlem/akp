# set :stages, ["staging", "production"]
# set :default_stage, "staging"
# require 'capistrano/ext/multistage'

# config valid only for Capistrano 3.1
SSHKit.config.command_map[:rake] = "bundle exec rake"

set :application, 'akp'
set :repo_url, 'git@bitbucket.org:a-s-h/akp.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/data/akp'
set :deploy_via, :remote_cache

set :linked_dirs, %w{public/uploads tmp}

set :branch, fetch(:branch, "master")
set :env, fetch(:env, "production")

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end