# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'sinatra-contrib'
gem 'puma'
gem 'octokit', "~> 4.0"
gem 'figaro'

group :development do
  gem 'byebug'
  gem "capistrano", "~> 3.14", require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rbenv', require: false
end
