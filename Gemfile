source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'

gem 'mysql2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

# Use LESS for stylesheets
gem 'less-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'


# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Enable tree structured model relations
gem 'ancestry'

# Uploading files
gem 'carrierwave'

# Search module
gem 'elasticsearch-model', git: 'git://github.com/elasticsearch/elasticsearch-rails.git'
gem 'elasticsearch-rails', git: 'git://github.com/elasticsearch/elasticsearch-rails.git'

# Javascript runtime
gem 'execjs'
gem 'therubyracer'

# authentication and authorisation
gem 'devise'
gem 'cancancan'

# admin
gem 'rails_admin'

# xml parsing
gem 'nokogiri'

group :development do
  gem 'spring'
  gem 'faker'
  gem 'seed_dump'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-unicorn-nginx', '~> 3.2.0'
end

group :staging do
  gem 'unicorn-rails'
end