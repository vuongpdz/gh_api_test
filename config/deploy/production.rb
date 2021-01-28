# frozen_string_literal: true

set :user, "zigexn"
set :branch, "main"
set :rbenv_path, "/home/#{fetch(:user)}/.rbenv"

server "CHANGE ME in config/deploy/production.rb", user: fetch(:user), roles: %w{app}

set :ssh_options, {
  keys: %w(~/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey)
}
