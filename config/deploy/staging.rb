set :user, :deploy
set :password, 'bernedar5'

set :deploy_to, '/data/akp'

server '188.166.92.89', user: fetch(:user), password: fetch(:password), roles: %w{web app db}

set :stage, :staging

set :branch, 'staging'
set :env, 'staging'
