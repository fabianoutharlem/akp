set :user, :deploy
set :password, 'bernedar5'

server '95.85.11.25', user: fetch(:user), password: fetch(:password), roles: %w{web app db}

set :stage, :staging

set :branch, 'staging'
set :env, 'staging'