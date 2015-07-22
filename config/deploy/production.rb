set :user, :deploy
set :password, 'bernedar5'

set :deploy_to, '/data/akp_production'

server '188.166.92.89', user: fetch(:user), password: fetch(:password), roles: %w{web app db}

set :stage, :production

set :branch, 'master'
set :env, 'production'
