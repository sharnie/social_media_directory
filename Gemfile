source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', require: 'active_record'
gem 'sinatra-activerecord', require: 'sinatra/activerecord'
gem 'instagram'
gem 'rake'
gem 'require_all'

group :production do
  gem 'pg'
end

group :test, :development do
  gem 'shotgun'
  gem 'sqlite3'
  gem 'pry'
  gem 'rspec'
end