set :user, :deploy
set :password, 'bernedar5'

server '188.166.97.179', user: fetch(:user), password: fetch(:password), roles: %w{web app db}

set :stage, :staging

set :branch, 'staging'
set :env, 'staging'
